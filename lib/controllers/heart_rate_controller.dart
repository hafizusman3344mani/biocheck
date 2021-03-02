import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/db/entities/rest_measure_entity.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';
import 'package:biocheck/db/repository/rest_measure_repo.dart';
import 'package:biocheck/models/local/device_result.dart';
import 'package:biocheck/models/local/rest_measurement_model.dart';
import 'package:biocheck/screens/popups/ask_quit_popup.dart';
import 'package:biocheck/screens/popups/ask_to%20disconnect_popup.dart';
import 'package:biocheck/screens/popups/connectivity_change_popup.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/gen/flutterblue.pbenum.dart';
import 'package:get/get.dart';

import 'infrastructure/common/connection_controller.dart';
import 'infrastructure/plugin.dart';

class HRController extends GetxController {
  var hr = RestMeasure.fromClass().obs;
  var _hr = RestMeasure.fromClass();

  Stream stream;
  StreamSubscription sub;
  bool result = false;
  Stream streamBluetooth;
  StreamSubscription subStreamBluetooth;

  List<BluetoothService> services = [];
  BluetoothDevice currentDevice;

  BluetoothCharacteristic characteristic;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  String snapshot;

  var maeasurementModel = RestMeasurementEntity.fromClass();
  var hrList = [];
  var ampList = [];
  var adamList = [];
  bool isPop = false;
  int mType = 0;
  bool trace = false;
  int rmId = 0;
  int startMeasuring = 0;
  int dataType = -2;
  bool isDiconn = false;
  int HeartRate = 0;

  List<int> rrs = [];
  List<int> hrsss = [];

  updateData(RestMeasure data) {
    hr.value = data;
    //update();
  }

  Future<RestMeasurementEntity> getMeasurementById(int id) async {
    RestMeasurementEntity obj =
        await RestMeasureRepo.instance.getMeasurementById(id);
    return obj;
  }

  Future<List<RestQuestionnaire>> getMeasurementQues(int id) async {
    List<RestQuestionnaire> obj =
        await RestMeasureRepo.instance.getMeasurementQues(id);
    return obj;
  }

  updateMeasurementQues(RestQuestionnaire entity) async {
    await RestMeasureRepo.instance.updateQuesData(entity);
  }

  connectAndFetchHeartRate() async {
    ConnectivityPolar.connect(
            Get.find<ConnectionController>().connection.ConnectionId, mType)
        .listen((event) {
      startMeasuring = 1;
      // print(event);
      // print(event);
      // print(event);
      int type = json.decode(event)["type"] as int;
      dataType = type;
      // if (!trace) {
      //   showExitPopup();
      //   trace = true;
      // }

      //snapshot = event;
      // update();
      if (type == Constants.HR) {}
      // Map dataString = json.decode(event)["data"];
      // if (dataString != null) {
      //   _hr.heartBeat = dataString["HeartRate"] as int;
      //   _hr.heartBeatMS1 = dataString["HeartRateMS1"] as int;
      //   _hr.heartBeatMS2 = dataString["HeartRateMS2"] as int;
      //   _hr.heartBeatAmp = dataString["HeartRateAMP"] as int;
      // }
    });
  }

  void connectToDevice() async {
    isDiconn = false;
    // if(device.)
    await connectAndPlay();
    streamBluetooth = flutterBlue.state;

    subStreamBluetooth = streamBluetooth.listen((state) async {
      if (state == BluetoothState.off) {
        isDiconn = true;
        showConnectionChangePopup();
        print(state);
        sub.cancel();
      } else if (state == BluetoothState.on) {
        if (isDiconn) {
          await connectAndPlay();
          isDiconn = false;
          Get.back();
        }
      }
    });
  }

  startSyncing() async {

    stream = characteristic.value;
    sub = stream.listen((event) async {
      // var results = await .device.readCharacteristic(characteristic);
      // print("${results.toList()}");
      parseHr(event);

      if(!result) {
        result = true;
        if (HeartRate > 0) {
          await getMeasurement();
          update();
        }
        result = false;
      }
    });
  }

  connectAndPlay() async {

    await currentDevice.disconnect();
    await currentDevice.connect();
    List<BluetoothService> services = await currentDevice.discoverServices();
    this.services = services;
    characteristic = services[0].characteristics[2];
    print(characteristic.uuid);
    currentDevice.state.listen((event) {
      print(event);
    });
    result = false;
    BluetoothService service = services
        .where((element) =>
            element.uuid.toString().toUpperCase().substring(4, 8) == '180D')
        .toList()
        .first;
    characteristic = service.characteristics
        .where((element) =>
            element.uuid.toString().toUpperCase().substring(4, 8) == '2A37')
        .toList()
        .first;

    startMeasuring = 1;
    characteristic.setNotifyValue(true);
    await ConnectivityPolar.initCalc;
    await startSyncing();
  }

  int parseHr(List<int> value) {
if(value.isNotEmpty) {
  List<int> valueSorted = [];
  valueSorted.insert(0, value[0]);
  valueSorted.insert(1, value[1]);
  for (var i = 0; i < (value.length - 3); i++) {
    valueSorted.insert(i + 2, value[i + 3]);
    valueSorted.insert(i + 3, value[i + 2]);
  }

  // int offset= 1;
  // int rr_count =0;
  //  rr_count = ((value.length - offset) / 2) as int;
  // for (int i = 0; i < rr_count; i++){
  //   hrsss[i] = characteristic.getIntValue(BluetoothGattCharacteristic.FORMAT_UINT16, offset);
  //   offset += 2;
  //  // Logger.trace("Received RR: {}", mRr_values[i]);
  // }
// Get flags directly from list
  var flags = valueSorted[0];

// Get the ByteBuffer view of the data to recode it later
  var buffer = new Uint8List.fromList(valueSorted)
      .buffer; // Buffer bytes from list

  if (flags == 0) {
    // HR
    var hrBuffer = new ByteData.view(buffer, 1, 1); // Get second byte
    var hr = hrBuffer.getUint8(0);
    HeartRate = hr;// Recode as UINT8
    print(hr);
  }

  if (flags == 16) {
    // HR
    var hrBuffer = new ByteData.view(buffer, 1, 1); // Get second byte
    var hr = hrBuffer.getUint8(0); // Recode as UINT8
    HeartRate = hr;
    // RR (more than one can be retrieved in the list)
    int offset = 2;
    var nRr = (valueSorted.length - offset) /
        2; // Remove flags and hr from byte count; then split in two since RR is coded as UINT16
    List<int> rrs = [];
    for (var i = 0; i < nRr; i++) {
      var rrBuffer = new ByteData.view(buffer, 2 + (i * 2),
          2); // Get pairs of bytes counting since the 3rd byte
      var rr = rrBuffer.getUint16(0);
     // offset += 2;// Recode as UINT16
      rrs.insert(i, rr);
    }

    this.rrs = rrs;
    print(this.rrs);
  }
}
    return HeartRate;
  }

  showExitPopup() {
    Get.dialog(QuitPopup());
  }

  showDisconnectPopup() {
    Get.dialog(DisconnectFromDevicePopup());
  }

  showConnectionChangePopup() {
    Get.dialog(ConnectionPopup()).then((value) => isDiconn = false);
  }

  showNetworkChangePopup() {
    Get.dialog(ConnectionPopup()).then((value) => isDiconn = false);
  }

  getMeasurement() async {
    if (rrs.isNotEmpty) {
      snapshot = await ConnectivityPolar.getMeasurements( HeartRate,rrs);
    }
  }
}
