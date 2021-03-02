package com.tekdhaba.biocheck;


import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGattCharacteristic;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.location.LocationManager;
import android.os.Build;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.util.Log;

import androidx.annotation.NonNull;

import com.bosphere.filelogger.FL;
import com.bosphere.filelogger.FLConfig;
import com.bosphere.filelogger.FLConst;
import com.bosphere.filelogger.Loggable;
import com.google.gson.Gson;
import com.tekdhaba.biocheck.models.RestMeasurement;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.Disposable;


public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler, EventChannel.StreamHandler {
    private static final String CHANNEL = "connectivity_polar";
    BluetoothAdapter mBluetoothAdapter;
    private MethodChannel channel;
    private EventChannel eventChannel;

    Gson gson = new Gson();
    private static final String TAG = MainActivity.class.getSimpleName();
    private static final String API_LOGGER_TAG = "API LOGGER";

    String DEVICE_ID;//= "E4:12:AD:87:65:83"; // or bt address like F5:A7:B8:EF:7A:D1 // TODO replace with your device id
    String state = null; // or bt address like F5:A7:B8:EF:7A:D1 // TODO replace with your device id
    //String DEVICE_ID = "F8:B4:CA:B9:31:A93"; // or bt address like F5:A7:B8:EF:7A:D1 // TODO replace with your device id
    Disposable autoConnectDisposable;

    MethodChannel.Result result;
    private EventChannel.EventSink mEventSink;
    CommonData devices = new CommonData();
    CommonData restRate = new CommonData();
    CommonData disconnect = new CommonData();
    CommonData connect = new CommonData();
    CommonData poweroff = new CommonData();
    CommonData poweron = new CommonData();
    AtdsCalculations calculations = new AtdsCalculations();
    RestMeasurement restMeasurement = new RestMeasurement();
    boolean paired = false;
    GpsHandler gpsHandler;
    int mType = 0;
    ExceptionHandler handler;

    int hr;BluetoothGattCharacteristic characteristic;
    List<Integer> rrs=new ArrayList<>();

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        channel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "connectivity_polar");
        channel.setMethodCallHandler(this);
        eventChannel = new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "connectionStream");
        eventChannel.setStreamHandler(this);
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        handler = new ExceptionHandler(this);
        File logFile = new File("sdcard/biiochecllog.file");
        if (!logFile.exists()) {
            try {
                logFile.createNewFile();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        FL.init(new FLConfig.Builder(this)
                .logger(new Loggable() {
                    @Override
                    public void v(String tag, String log) {

                    }

                    @Override
                    public void d(String tag, String log) {

                    }

                    @Override
                    public void i(String tag, String log) {

                    }

                    @Override
                    public void w(String tag, String log) {

                    }

                    @Override
                    public void e(String tag, String log) {

                    }

                    @Override
                    public void e(String tag, String log, Throwable tr) {

                    }
                })       // customise how to hook up with logcat
                .defaultTag("Default Tag")   // customise default tag
                .minLevel(FLConst.Level.V)   // customise minimum logging level
                .logToFile(true)   // enable logging to file
                .dir(logFile)    // customise directory to hold log files// customise log format and file name
                .retentionPolicy(FLConst.RetentionPolicy.FILE_COUNT) // customise retention strategy
                .maxFileCount(FLConst.DEFAULT_MAX_FILE_COUNT)    // customise how many log files to keep if retention by file count
                .maxTotalSize(FLConst.DEFAULT_MAX_TOTAL_SIZE)    // customise how much space log files can occupy if retention by total size
                .build());

        FL.setEnabled(true);
    }

    @Override
    public void onListen(Object object, EventChannel.EventSink sink) {


    }

    @Override
    public void onCancel(Object arguments) {
        if (gpsHandler != null) {
            gpsHandler.StopGps();
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {


        this.result = result;
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("checkBTPower")) {
            if (mBluetoothAdapter == null || !mBluetoothAdapter.isEnabled()) {
                // Bluetooth is not enabled :)
                result.success(false);
            } else {
                // Bluetooth is enabled
                result.success(true);
            }
        } else if (call.method.equals("checklocation")) {
            LocationManager lm = (LocationManager) this.getSystemService(Context.LOCATION_SERVICE);
            boolean gps_enabled = false;
            boolean network_enabled = false;

            try {
                gps_enabled = lm.isProviderEnabled(LocationManager.GPS_PROVIDER);
            } catch (Exception ex) {
            }

            try {
                network_enabled = lm.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
            } catch (Exception ex) {
            }

            if (gps_enabled) {
                // notify user
                result.success(true);
            } else {
                result.success(false);
            }
        } else if (call.method.equals("initCalc")) {
            iniMeasurement();

        } else if (call.method.equals("getMeasurement")) {
             hr = call.argument("hr");
            rrs = call.argument("rrs");
            result.success(getJsonData(hr, rrs));
        } else if (call.method.equals("restart")) {
            mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
            mBluetoothAdapter.disable();
            mBluetoothAdapter.enable();
        } else if (call.method.equals("enable")) {
            mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
            mBluetoothAdapter.enable();
            result.success(true);
        } else {
            result.notImplemented();
        }
    }

    private String getJsonData(int heartRate, List<Integer> rrs) {

       // Log.i("Heart Rate = ", String.valueOf(heartRate));
        FL.d("\n\n\nThis is the rr received from device = " + rrs, rrs);
        FL.d("\n\n\nThis is the Heard Rate Number that I received from device = " + heartRate, heartRate);


        restRate.type = DataTypes.HR;


        if (mType == DataTypes.REST) {

            if (!rrs.isEmpty()) {
                for (int iI = 0; iI < heartRate; iI++) {
                   // Log.i("Heart Rate entered= "+heartRate, String.valueOf(heartRate));
                   // Log.i("index entered= "+iI, String.valueOf(iI));
                    if (iI < rrs.size()) {
                        int iNewRrTime = rrs.get(iI);
                        int usHRTFilter = calculations.processHeartBeat(iNewRrTime); //
                        //Log.i("Filterss= "+usHRTFilter, String.valueOf(iNewRrTime));
                        if (heartRate == 0) // no rr time, send only the other data
                        {
                            calculations.processHeartBeat(iNewRrTime);
                           // Log.i("I am 0= "+iI, String.valueOf(iI));
                        }
                    }
                }
            }

            restMeasurement.HeartRate = calculations.getHF();

            FL.d("\n\n\n\nThis is the Heart After Calculation from pulgin by the getHF() function= " + restMeasurement.HeartRate, restMeasurement.HeartRate);
            restMeasurement.HeartRateMS1 = calculations.getHRTFil2() * 2;
          //  FL.d(TAG, "\n Calculation Miliseconds from getHRTFil2() * 2 is = " + (new Date().getTime()) + " is " + restMeasurement.HeartRateMS1);
            restMeasurement.HeartRateAMP = calculations.getAmplitude();

            restMeasurement.AdemFreq = calculations.getAdem();

            restMeasurement.BreathFreq = calculations.getBreathFreq();

            restMeasurement.stress = calculations.getAtdsStateProgress();

        } else if (mType == DataTypes.CVP) {
            gpsHandler = new GpsHandler(MainActivity.this);
            gpsHandler.StartGps();

           // restMeasurement.HeartRate = calculations.processHeartBeat(hrvalue) > 0 ? calculations.getHF() : 0;
            restMeasurement.HeartRateMS1 = calculations.getHRTFil2() * 2;
            restMeasurement.HeartRateAMP = calculations.getAmplitude();
            restMeasurement.AdemFreq = calculations.getAdem();
            restMeasurement.BreathFreq = calculations.getBreathFreq();
            restMeasurement.progressAT = calculations.getAtdsStateProgress();
            restMeasurement.stateAT = calculations.getAtdsState();
            restMeasurement.CurrentSpeedKmh = gpsHandler.GetCurrentSpeedKmh();
            restMeasurement.Distance = gpsHandler.GetDistance();


        }
        Log.i("I am heart Rate= ", String.valueOf(restMeasurement.HeartRate));
        Log.i("I am Amplitude= ", String.valueOf(restMeasurement.HeartRateAMP));
        restRate.data = restMeasurement;

        return gson.toJson(restRate);
    }


    public void onCreateeeeee() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(BluetoothDevice.ACTION_ACL_CONNECTED);
        filter.addAction(BluetoothDevice.ACTION_ACL_DISCONNECT_REQUESTED);
        filter.addAction(BluetoothDevice.ACTION_ACL_DISCONNECTED);
        registerReceiver(BTReceiver, filter);
    }

    private final BroadcastReceiver BTReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();

            if (BluetoothDevice.ACTION_ACL_CONNECTED.equals(action)) {
                //Do something if connected
                Log.d(TAG, "BATTERY LEVEL: 0-00000000" + 0);
                if (!paired) {
                    Log.d(TAG, "I am connected once only ");
                    paired = true;
                    result.success(paired);
                }

            } else if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) {
                //Do something if disconnected
                Log.d(TAG, "I am disconnected once only ");
            }

            if (mEventSink != null) {
                mEventSink.success(gson.toJson(restRate));
                Log.d(TAG, "I am not null BATTERY LEVEL:111111111111 ");
            }
            //else if...
        }
    };


    private void iniMeasurement() {
        calculations.Initialize();
        calculations.resetCalcStartTr(false);
        calculations.setMeasurementType(DataTypes.TRAINING_REST, DataTypes.TRAINING_SPORT_NONE);
        calculations.setAtFromInput(false, 0);
        Log.d(TAG, "I am initialized ");
        result.success(true);
    }

    private boolean checkConnectedDevices(String id) {
        boolean connectionExists = false;
        if (mBluetoothAdapter != null && mBluetoothAdapter.isEnabled()) {
            Set<BluetoothDevice> pairedDevices = mBluetoothAdapter.getBondedDevices();
// If there are paired devices
            if (pairedDevices.size() > 0) {
                // Loop through paired devices
                for (BluetoothDevice device : pairedDevices) {
                    // Add the name and address to an array adapter to show in a ListView
                    if (device.getAddress().equals(id)) {
                        connectionExists = true;
                        break;
                    }
                }
            }
        }
        return connectionExists;
    }


    @Override
    public void onDestroy() {
        super.onDestroy();

        unregisterReceiver(BTReceiver);
        gpsHandler.StopGps();
    }



    public float[] parse(BluetoothGattCharacteristic c) {



        double heartRate = extractHeartRate(c);
        double contact = extractContact(c);
        double energy = extractEnergyExpended(c);
        Integer[] interval = extractBeatToBeatInterval(c);

        float[] result = null;
        if (interval != null) {
            result = new float[interval.length + 1];
        } else {
            result = new float[2];
            result[1] = -1.0f;
        }
        result[0] = (float) heartRate;

        if (interval != null) {
            for (int i = 0; i < interval.length; i++) {
                result[i+1] = interval[i].floatValue();
            }
        }

        return result;
    }

    private  double extractHeartRate(
            BluetoothGattCharacteristic characteristic) {

        int flag = characteristic.getProperties();
        Log.d(TAG, "Heart rate flag: " + flag);
        int format = -1;
        // Heart rate bit number format
        if ((flag & 0x01) != 0) {
            format = BluetoothGattCharacteristic.FORMAT_UINT16;
            Log.d(TAG, "Heart rate format UINT16.");
        } else {
            format = BluetoothGattCharacteristic.FORMAT_UINT8;
            Log.d(TAG, "Heart rate format UINT8.");
        }
        final int heartRate = characteristic.getIntValue(format, 1);
        Log.d(TAG, String.format("Received heart rate: %d", heartRate));
        return heartRate;
    }

    private  double extractContact(
            BluetoothGattCharacteristic characteristic) {

        int flag = characteristic.getProperties();
        int format = -1;
        // Sensor contact status
        if ((flag & 0x02) != 0) {
            Log.d(TAG, "Heart rate sensor contact info exists");
            if ((flag & 0x04) != 0) {
                Log.d(TAG, "Heart rate sensor contact is ON");
            } else {
                Log.d(TAG, "Heart rate sensor contact is OFF");
            }
        } else  {
            Log.d(TAG, "Heart rate sensor contact info doesn't exists");
        }
        //final int heartRate = characteristic.getIntValue(format, 1);
        //Log.d(TAG, String.format("Received heart rate: %d", heartRate));
        return 0.0d;
    }

    private static double extractEnergyExpended(
            BluetoothGattCharacteristic characteristic) {

        int flag = characteristic.getProperties();
        int format = -1;
        // Energy calculation status
        if ((flag & 0x08) != 0) {
            Log.d(TAG, "Heart rate energy calculation exists.");
        } else {
            Log.d(TAG, "Heart rate energy calculation doesn't exists.");
        }
        //final int heartRate = characteristic.getIntValue(format, 1);
        //Log.d(TAG, String.format("Received heart rate: %d", heartRate));
        return 0.0d;
    }

    private static Integer[] extractBeatToBeatInterval(
            BluetoothGattCharacteristic characteristic) {

        int flag = characteristic.getIntValue(BluetoothGattCharacteristic.FORMAT_UINT8, 0);
        int format = -1;
        int energy = -1;
        int offset = 1; // This depends on hear rate value format and if there is energy data
        int rr_count = 0;

        if ((flag & 0x01) != 0) {
            format = BluetoothGattCharacteristic.FORMAT_UINT16;
            Log.d(TAG, "Heart rate format UINT16.");
            offset = 3;
        } else {
            format = BluetoothGattCharacteristic.FORMAT_UINT8;
            Log.d(TAG, "Heart rate format UINT8.");
            offset = 2;
        }
        if ((flag & 0x08) != 0) {
            // calories present
            energy = characteristic.getIntValue(BluetoothGattCharacteristic.FORMAT_UINT16, offset);
            offset += 2;
            Log.d(TAG, "Received energy: {}"+ energy);
        }
        if ((flag & 0x16) != 0){
            // RR stuff.
            Log.d(TAG, "RR stuff found at offset: "+ offset);
            Log.d(TAG, "RR length: "+ (characteristic.getValue()).length);
            rr_count = ((characteristic.getValue()).length - offset) / 2;
            Log.d(TAG, "RR length: "+ (characteristic.getValue()).length);
            Log.d(TAG, "rr_count: "+ rr_count);
            if (rr_count > 0) {
                Integer[] mRr_values = new Integer[rr_count];
                for (int i = 0; i < rr_count; i++) {
                    mRr_values[i] = characteristic.getIntValue(
                            BluetoothGattCharacteristic.FORMAT_UINT16, offset);
                    offset += 2;
                    Log.d(TAG, "Received RR: " + mRr_values[i]);
                }
                return mRr_values;
            }
        }
        Log.d(TAG, "No RR data on this update: ");
        return null;
    }



}


