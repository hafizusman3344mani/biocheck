//package com.tekdhaba.biocheck;
//
//import android.content.DialogInterface;
//import android.graphics.Color;
//import android.os.Bundle;
//import android.os.CountDownTimer;
//import android.os.Handler;
//import android.os.Message;
//import androidx.appcompat.app.ActionBar;
//import androidx.appcompat.app.AlertDialog;
//import android.text.Spannable;
//import android.text.style.ForegroundColorSpan;
//import android.util.Log;
//import android.view.LayoutInflater;
//import android.view.View;
//import android.view.ViewGroup;
//import android.widget.Button;
//import android.widget.ImageView;
//import android.widget.LinearLayout;
//import android.widget.RelativeLayout;
//import android.widget.SeekBar;
//import android.widget.TextView;
//
//import com.biocheck.customer.AppHelper;
//import com.biocheck.customer.backend.atds.AtdsCalc;
//import com.biocheck.customer.frontend.BaseFragment;
//import com.biocheck.customer.backend.atds.AtdsNames;
//import com.biocheck.customer.backend.BackHandlerService;
//import com.biocheck.customer.frontend.CircularProgressBar;
//import com.biocheck.customer.MessengerSendToServer;
//import com.biocheck.customer.MyApplication;
//import com.biocheck.customer.R;
//import com.biocheck.customer.frontend.SquareLayout;
//import com.biocheck.customer.frontend.graph.GraphRest;
//
//import org.achartengine.GraphicalView;
//
//import java.util.Locale;
//
//import static com.biocheck.customer.backend.BackHandlerService.MINIMUM_TRAINING_DURATION;
//import static com.biocheck.customer.backend.atds.AtdsCvProtocol.TR_ST_COOLING_DOWN_START;
//
//public class FragmentTrainingCVP extends BaseFragment {
//
//    private static final String LOG_TAG = "FragmentTrainingCVP";
//    public static final int TRAINING_WATCH         = 2 * 60 * 1000;
//    public static final int TIMER_TRAINING_SPORT         = 1000;
//
//    private CircularProgressBar prRestProgress;
//
//    private MessengerSendToServer mMessengerSendToServer;
//    boolean bMeasurementOn = false;
//    boolean bMeasurementPause = false;
//
//    private Button bttnStartStop;
//    private TextView tvTrainingState;
//    private RelativeLayout rlStateColorView;
//    private TextView tvTrainingStatus;
//
//    private TextView tvTrainingTime;
//    private TextView tvTrHeartRate;
//    private TextView tvTrTime;
//    private TextView tvTrSpeed;
//    private TextView tvTrDistance;
//    private SquareLayout vSquareData;
//
//    private ImageView imButtonBack;
//    private ImageView imButtonPause;
//    private Button bttnButtonPause;
//
//    private static GraphicalView mChartView;
//    private GraphRest cGraphLine = null;
//
//    private boolean bHeartRateDataValid = false;
//    private boolean bBluetoothConnected = false;
//    private boolean bBluetoothOn = false;
//    private boolean bEndurance1Done = false;
//
//    private RelativeLayout rlViewAtAsk;
//
//    private RelativeLayout rlViewAtAskAtInput;
//    private TextView tvViewAtAskAtInput;
//    private TimerShowText mTimerShowText;
//    private TimerShowSport mTimerShowSport;
//    private long lTrainingTime;
//
//    boolean bCurrentDisplay = false;
//
//    private RelativeLayout rlChooseSportType;
//    private int iTrainingType = 0;
//    private int iTrainingSportType = 0;
//
//    private SeekBar sbStatePoint;
//
//    @Override
//    public View onCreateView(LayoutInflater inflater, ViewGroup container,
//                             Bundle savedInstanceState) {
//        // Inflate the layout for this fragment
//        View rootView = inflater.inflate(R.layout.fragment_training, container, false);
//
//        // Set view title
//        TextView tvViewTitle = rootView.findViewById(R.id.ivTitleTop);
//        tvViewTitle.setText(GetString(R.string.sFrCvp), TextView.BufferType.SPANNABLE);
//        Spannable span = (Spannable) tvViewTitle.getText();
//        span.setSpan(new ForegroundColorSpan(AppHelper.getColor(getContext(),R.color.cAppColor)), 1, "CV".length(),
//                Spannable.SPAN_INCLUSIVE_EXCLUSIVE);
//
//        prRestProgress = rootView.findViewById(R.id.progressBar);
//        prRestProgress.setProgress(0);
//
//        bttnStartStop 	= rootView.findViewById(R.id.bttnTrainingStStart);
//
//        tvTrainingTime = rootView.findViewById(R.id.tvTrainingTime);
//        tvTrHeartRate = rootView.findViewById(R.id.ttvTrHeartRate);
//        tvTrTime = rootView.findViewById(R.id.ttvTrTime);
//        tvTrSpeed = rootView.findViewById(R.id.ttvTrSpeed);
//        tvTrDistance = rootView.findViewById(R.id.ttvTrDistance);
//        vSquareData = rootView.findViewById(R.id.SquareDataView);
//
//        tvTrainingState = rootView.findViewById(R.id.tvTrainingState);
//        rlStateColorView = rootView.findViewById(R.id.rlStateColorView);
//        tvTrainingStatus = rootView.findViewById(R.id.tvTrainingStatus);
//        bttnStartStop.setOnClickListener(bttnOnclickStartStop);
//        imButtonBack = rootView.findViewById(R.id.imBarBack);
//        imButtonPause = rootView.findViewById(R.id.imButtonRight);
//        bttnButtonPause = rootView.findViewById(R.id.bttnBarRight);
//        rootView.findViewById(R.id.bttnBarBack).setOnClickListener(bttnOnclickBack);
//        bttnButtonPause.setOnClickListener(bttnOnclickPause);
//
//        imButtonPause.setImageDrawable(AppHelper.getDrawable(getContext(), R.drawable.ic_pausewit));
//        imButtonPause.setVisibility(View.GONE);
//        bttnButtonPause.setVisibility(View.GONE);
//
//        sbStatePoint = rootView.findViewById(R.id.sbStatePoint);
//        sbStatePoint.setVisibility(View.GONE);
//        sbStatePoint.setMax(100);
//
//        cGraphLine = null;
//        cGraphLine = new GraphRest(getContext());
//        mChartView = cGraphLine.getView(getContext());
//        LinearLayout layout = rootView.findViewById(R.id.llRestGraph);
//        layout.addView(mChartView, new ActionBar.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
//
//        bttnStartStop.setVisibility(View.VISIBLE);
//        if (imButtonBack != null)
//            imButtonBack.setImageDrawable(AppHelper.getDrawable(getContext(),R.drawable.ic_back));
//        vSquareData.setVisibility(View.GONE);
//
//        mMessengerSendToServer = new MessengerSendToServer(getContext(), new Handler(new IncomingHandler()));
//        Bundle bBundle = new Bundle();
//        bBundle.putInt("TrainingType", AtdsCalc.TRAINING_TYPE_CHRON_VERM);
//        mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_LOAD_TRAINING_VIEW, bBundle);
//
//        rlViewAtAsk = rootView.findViewById(R.id.tlCvpStartAsk);
//        rlViewAtAskAtInput = rootView.findViewById(R.id.llAskCvpATInput);
//        tvViewAtAskAtInput = rootView.findViewById(R.id.tvCvpAtInput);
//
//        rootView.findViewById(R.id.llAskCvpATDay).setOnClickListener(bttnOnclickATAskDay);
//        rootView.findViewById(R.id.llAskCvpATInput).setOnClickListener(bttnOnclickATAskInput);
//
//        rlViewAtAsk.setVisibility(View.GONE);
//        mTimerShowText = new TimerShowText();
//        mTimerShowText.start();
//
//        mTimerShowSport = new TimerShowSport();
//
//        rlChooseSportType = rootView.findViewById(R.id.rlChooseSportType);
//        rlChooseSportType.setVisibility(View.GONE);
//
//        rootView.findViewById(R.id.llSportCycling).setOnClickListener(bttnOnclickChooseSport);
//        rootView.findViewById(R.id.llSportRowing).setOnClickListener(bttnOnclickChooseSport);
//        rootView.findViewById(R.id.llSportJogging).setOnClickListener(bttnOnclickChooseSport);
//        rootView.findViewById(R.id.llSportSkating).setOnClickListener(bttnOnclickChooseSport);
//        rootView.findViewById(R.id.llSportCrossTrainer).setOnClickListener(bttnOnclickChooseSport);
//        rootView.findViewById(R.id.llSportWalking).setOnClickListener(bttnOnclickChooseSport);
//        return rootView;
//    }
//
//    //---------------------------------------------------------------------------
//    // Function     : IncomingHandler
//    //
//    // Input       	:
//    // Description	: Incoming Message Handler form the BackHandlerService
//    //---------------------------------------------------------------------------
//    private class IncomingHandler implements Handler.Callback
//    {
//        @Override
//        public boolean handleMessage(Message msg) {
//            if (isAdded()) {
//
//                switch (msg.what) {
//                    case BackHandlerService.MSG_GENERAL:
//                        bMeasurementOn = msg.getData().getBoolean("MeasurementOn");
//                        bMeasurementPause = msg.getData().getBoolean("MeasurementPause");
//                        bBluetoothOn = msg.getData().getBoolean("BluetoothOn");
//                        bBluetoothConnected = msg.getData().getBoolean("BluetoothConnected");
//                        bHeartRateDataValid = msg.getData().getBoolean("HeartRateDataValid");
//
//                        if (bMeasurementOn)
//                        {
//                            bttnStartStop.setVisibility(View.GONE);
//                            vSquareData.setVisibility(View.VISIBLE);
//                            imButtonPause.setVisibility(View.VISIBLE);
//                            bttnButtonPause.setVisibility(View.VISIBLE);
//
//                            if (imButtonBack != null)
//                                imButtonBack.setImageDrawable(AppHelper.getDrawable(getContext(),R.drawable.ic_bullet_delete));
//                        } else
//                        {
//                            bEndurance1Done = false;
//                            bttnStartStop.setVisibility(View.VISIBLE);
//                            if (imButtonBack != null)
//                                imButtonBack.setImageDrawable(AppHelper.getDrawable(getContext(),R.drawable.ic_back));
//                            vSquareData.setVisibility(View.GONE);
//                            imButtonPause.setVisibility(View.GONE);
//                            bttnButtonPause.setVisibility(View.GONE);
//                        }
//                        if(bMeasurementPause) {
//                            imButtonPause.setImageDrawable(AppHelper.getDrawable(getContext(),R.drawable.ic_play));
//                        }
//                        else {
//                            imButtonPause.setImageDrawable(AppHelper.getDrawable(getContext(),R.drawable.ic_pausewit));
//                        }
//                        break;
//                    case BackHandlerService.MSG_DATA:
//                        int iAtdsState = msg.getData().getInt("AtdsState");
//                        int iStatusProgress = msg.getData().getInt("AtdsStateProgress");
//                        int stTrainingState = msg.getData().getInt("stTrainingState");
//
//                        if(stTrainingState >= TR_ST_COOLING_DOWN_START)
//                            bEndurance1Done = true;
//
//                        if(bCurrentDisplay) {
//                            tvTrainingStatus.setText(AtdsNames.GetAtdsStatusNameExercise(iAtdsState, bEndurance1Done));
//                            tvTrainingState.setText(msg.getData().getString("TrainingStatus"));
//                        }
//                        else {
//                            tvTrainingStatus.setText(msg.getData().getString("TrainingStatus"));
//                            tvTrainingState.setText(AtdsNames.GetAtdsStatusNameExercise(iAtdsState, bEndurance1Done));
//                        }
//                        tvTrHeartRate.setText(String.format(Locale.getDefault(), "%d", msg.getData().getInt("AtdsHeartRate")));
//                        tvTrTime.setText(AppHelper.Get_TimeString(msg.getData().getLong("TrGuideTimeTarget") - msg.getData().getLong("TrGuideTime")));
//                        tvTrainingTime.setText(msg.getData().getString("MeasurementTimeString"));
//                        lTrainingTime = msg.getData().getLong("MeasurementTime");
//                        tvTrSpeed.setText(String.format(Locale.getDefault(), "%d", Math.round(msg.getData().getDouble("SpeedKph"))));
//                        tvTrDistance.setText(String.format(Locale.getDefault(), "%.1f", (msg.getData().getDouble("Distance")/1000)));
//
//                        prRestProgress.setProgress(msg.getData().getLong("TrGuideTimeTarget") - msg.getData().getLong("TrGuideTime"));
//                        prRestProgress.setMax((int)msg.getData().getLong("TrGuideTimeTarget"));
//                        rlStateColorView.setBackgroundColor(AppHelper.getColor(getContext(),AtdsNames.GetAtdsStateColorTr(iAtdsState)));
//                        if (iAtdsState < AtdsCalc.HF_END1) {
//                            sbStatePoint.setVisibility(View.GONE);
//                        }
//                        else {
//                            sbStatePoint.setVisibility(View.VISIBLE);
//                            switch (iAtdsState)
//                            {
//                                case AtdsCalc.HF_END1:
//                                    sbStatePoint.setProgressDrawable(getResources().getDrawable(R.drawable.seek_bar_endurance1));
//                                    break;
//                                case AtdsCalc.HF_END2:
//                                    sbStatePoint.setProgressDrawable(getResources().getDrawable(R.drawable.seek_bar_endurance2));
//                                    break;
//                                case AtdsCalc.HF_END3:
//                                    sbStatePoint.setProgressDrawable(getResources().getDrawable(R.drawable.seek_bar_endurance3));
//                                    break;
//                                case AtdsCalc.HF_INTENSE:
//                                    sbStatePoint.setProgressDrawable(getResources().getDrawable(R.drawable.seek_bar_intensive));
//                                    break;
//                                case AtdsCalc.HF_INTENSE2:
//                                    sbStatePoint.setProgressDrawable(getResources().getDrawable(R.drawable.seek_bar_intensive));
//                                    break;
//                            }
//                        }
//
//                        sbStatePoint.setProgress(iStatusProgress);
////                        Log.d(LOG_TAG, "Time tr ");
//                        break;
//                    case BackHandlerService.MSG_DATA_GRAPH:
//                        double dinTimeBase = msg.getData().getDouble("dlTimeBase");
//                        double dinBreathTime = msg.getData().getDouble("dlBreathTime");
//
//                        cGraphLine.AddNewPoints(dinTimeBase, dinBreathTime);
//                        mChartView.repaint();
//                        break;
//
//                    case BackHandlerService.MSG_TRAINING_IS_END:
//                        mTimerShowText.cancel();
//                        if(msg.getData().getLong("LastTrainingId") != 0)
//                            ShowFragment("FragmentTrainingEnd", new FragmentTrainingEnd());
//                        else {
//                        ShowFragment("FragmentMainView", new FragmentMainView());
//                            Bundle bBundle = new Bundle();
//                            bBundle.putInt("TrainingType", 0);
//                            mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_LOAD_TRAINING_VIEW, bBundle);
//                        }
//                        break;
//
//                }
//            }
//            return true;
//        }
//    }
//
//    private final View.OnClickListener bttnOnclickBack = new View.OnClickListener()
//    {
//        @Override
//        public void onClick(final View v)
//        {
//            if(!bMeasurementOn){
//                mTimerShowText.cancel();
//                ShowFragment("FragmentTrainingEnd", new FragmentTrainingEnd());
//            }
//            else
//                StopTraining();
//        }
//    };
//
//    private final View.OnClickListener bttnOnclickPause = new View.OnClickListener()
//    {
//        @Override
//        public void onClick(final View v)
//        {
//            mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_TRAINING_TOGGLE_PAUSE);
//            if(!bMeasurementPause)
//            {
//                AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(GetContext());
//                alertDialogBuilder.setTitle(getString(R.string.s_dp_Title));
//                alertDialogBuilder.setMessage(getString(R.string.s_dp_Message));
//
//                alertDialogBuilder.setPositiveButton(getString(R.string.s_d_Done), new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface arg0, int arg1) {
//
//                    }
//                });
//
//                AlertDialog alertDialog;
//                alertDialog = alertDialogBuilder.create();
//                alertDialog.show();
//            }
//        }
//    };
//
//    private final View.OnClickListener bttnOnclickATAskInput = new View.OnClickListener() {
//        @Override
//        public void onClick(final View v)
//        {
//            iTrainingType = BackHandlerService.MSG_TRAINING_START_CHRONISCH_INPUT;
//            rlViewAtAsk.setVisibility(View.GONE);
//            rlChooseSportType.setVisibility(View.VISIBLE);
//        }
//    };
//    private final View.OnClickListener bttnOnclickATAskDay = new View.OnClickListener() {
//        @Override
//        public void onClick(final View v) {
//            iTrainingType = BackHandlerService.MSG_TRAINING_START_CHRONISCH;
//            rlViewAtAsk.setVisibility(View.GONE);
//            rlChooseSportType.setVisibility(View.VISIBLE);
//        }
//    };
//
//    final View.OnClickListener bttnOnclickChooseSport= new View.OnClickListener()
//    {
//        @Override
//        public void onClick(final View v)
//        {
//            v.setBackground(getResources().getDrawable(R.drawable.layout_bg_green));
//            switch (v.getId())
//            {
//                case R.id.llSportCycling:
//                    iTrainingSportType = AtdsCalc.TRAINING_SPORT_CYCLING;
//                    break;
//                case R.id.llSportRowing:
//                    iTrainingSportType = AtdsCalc.TRAINING_SPORT_ROWING;
//                    break;
//                case R.id.llSportJogging:
//                    iTrainingSportType = AtdsCalc.TRAINING_SPORT_JOGGING;
//                    break;
//                case R.id.llSportSkating:
//                    iTrainingSportType = AtdsCalc.TRAINING_SPORT_SKATING;
//                    break;
//                case R.id.llSportCrossTrainer:
//                    iTrainingSportType = AtdsCalc.TRAINING_SPORT_STEPS;
//                    break;
//                case R.id.llSportWalking:
//                    iTrainingSportType = AtdsCalc.TRAINING_SPORT_WALKING;
//                    break;
//            }
//            Bundle bBundle = new Bundle();
//            bBundle.putInt(BackHandlerService.MSG_KEY_SPORT_TYPE, iTrainingSportType);
//            mMessengerSendToServer.SendMessenger(iTrainingType, bBundle);           // Start the training
//            mTimerShowSport.start();
//        }
//    };
//
//    private final View.OnClickListener bttnOnclickStartStop = new View.OnClickListener()
//    {
//        @Override
//        public void onClick(final View v)
//        {
//            if(!bMeasurementOn)
//            {
//                if(!bBluetoothOn)
//                {
//                    AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(GetContext());
//                    alertDialogBuilder.setTitle(getString(R.string.s_dbo_Title));
//                    alertDialogBuilder.setMessage(getString(R.string.s_dbo_Message));
//
//                    alertDialogBuilder.setPositiveButton(getString(R.string.s_d_Done), new DialogInterface.OnClickListener() {
//                        @Override
//                        public void onClick(DialogInterface arg0, int arg1) {
//
//                        }
//                    });
//
//                    AlertDialog alertDialog;
//                    alertDialog = alertDialogBuilder.create();
//                    alertDialog.show();
//                }
//                else if(!bBluetoothConnected)
//                {
//                    AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(GetContext());
//                    alertDialogBuilder.setTitle(getString(R.string.s_db_Title));
//                    alertDialogBuilder.setMessage(getString(R.string.s_db_Message));
//
//                    alertDialogBuilder.setPositiveButton(getString(R.string.s_d_Done), new DialogInterface.OnClickListener() {
//                        @Override
//                        public void onClick(DialogInterface arg0, int arg1) {
//
//                        }
//                    });
//
//                    AlertDialog alertDialog;
//                    alertDialog = alertDialogBuilder.create();
//                    alertDialog.show();
//                }
//                else if(!bHeartRateDataValid)
//                {
//                    AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(GetContext());
//                    alertDialogBuilder.setTitle(getString(R.string.s_dh_Title));
//                    alertDialogBuilder.setMessage(getString(R.string.s_dh_Message));
//
//                    alertDialogBuilder.setPositiveButton(getString(R.string.s_d_Done), new DialogInterface.OnClickListener() {
//                        @Override
//                        public void onClick(DialogInterface arg0, int arg1) {
//
//                        }
//                    });
//
//                    AlertDialog alertDialog;
//                    alertDialog = alertDialogBuilder.create();
//                    alertDialog.show();
//                }
//                else {
//
//                    int iAtDefault = MyApplication.getInstance().getPrefManager().getAt();
//
//                    tvViewAtAskAtInput.setText(getString(R.string.sCvpAtAskAtSetVal,iAtDefault));
//                    if(iAtDefault > 0) {
//                        tvViewAtAskAtInput.setTextColor(Color.rgb(0x41, 0x41,0x41));
//                        rlViewAtAskAtInput.setEnabled(true);
//                    }
//                    else {
//                        tvViewAtAskAtInput.setTextColor(AppHelper.getColor(getContext(), R.color.cAppColor));
//                        rlViewAtAskAtInput.setEnabled(false);
//                    }
//
//                    rlViewAtAsk.setVisibility(View.VISIBLE);
//                }
//            }
//            else
//                StopTraining();
//        }
//    };
//
//    private void StopTraining()
//    {
//        if(lTrainingTime > MINIMUM_TRAINING_DURATION) {
//            AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(GetContext());
//            alertDialogBuilder.setMessage(getResources().getString(R.string.StopMeasurement));
//
//            alertDialogBuilder.setPositiveButton(getResources().getString(R.string.StopMeasurement_yes_save), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface arg0, int arg1) {
//                    Bundle BundleData = new Bundle();
//                    BundleData.putBoolean("Save", true);
//                    mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_TRAINING_STOP_EXERCISE, BundleData);
//                }
//            });
//
//            alertDialogBuilder.setNegativeButton(getResources().getString(R.string.StopMeasurement_yes_remove), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface arg0, int arg1) {
//                    Bundle BundleData = new Bundle();
//                    BundleData.putBoolean("Save", false);
//                    mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_TRAINING_STOP_EXERCISE, BundleData);
//                }
//            });
//            alertDialogBuilder.setNeutralButton(getResources().getString(R.string.StopMeasurement_no), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface dialog, int which) {
//                }
//            });
//
//            AlertDialog alertDialog;
//            alertDialog = alertDialogBuilder.create();
//            alertDialog.show();
//        }
//        else {
//            AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(GetContext());
//            alertDialogBuilder.setMessage(getResources().getString(R.string.StopMeasurementShort));
//
//            alertDialogBuilder.setNegativeButton(getResources().getString(R.string.StopMeasurement_yes_remove), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface arg0, int arg1) {
//                    Bundle BundleData = new Bundle();
//                    BundleData.putBoolean("Save", false);
//                    mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_TRAINING_STOP_EXERCISE, BundleData);
//                }
//            });
//
//            alertDialogBuilder.setNeutralButton(getResources().getString(R.string.StopMeasurement_no), new DialogInterface.OnClickListener() {
//                @Override
//                public void onClick(DialogInterface dialog, int which) {
//                }
//            });
//
//            AlertDialog alertDialog;
//            alertDialog = alertDialogBuilder.create();
//            alertDialog.show();
//        } //
//    }
//
//    @Override
//    public void onStart()
//    {
//        super.onStart();
//        Log.d(LOG_TAG, "onStart");
//
//    }
//
//    @Override
//    public void onStop()
//    {
//        super.onStop();
//        Log.d(LOG_TAG, "onStop");
//
//    }
//
//    @Override
//    public void onDestroy()
//    {
//        super.onDestroy();
//        Log.d(LOG_TAG, "onDestroy");
//        mMessengerSendToServer.SendMessenger(BackHandlerService.MSG_UNREGISTER_CLIENT);
//        mMessengerSendToServer.unbindService();
//    }
//
//    // ---------------------------------------------------------------------------
//    // Function : TimerSendSite
//    // Input :
//    // Description : TimerSendSite
//    // ---------------------------------------------------------------------------
//    private class TimerShowText extends CountDownTimer {
//        private TimerShowText() {
//            super(TRAINING_WATCH, TRAINING_WATCH);
//        }
//
//        @Override
//        public void onFinish() //
//        {
//            bCurrentDisplay = !bCurrentDisplay;
//            this.start();
//        }
//
//        @Override
//        public void onTick(long millisUntilFinished) {
//        }
//    }
//
//    // ---------------------------------------------------------------------------
//    // Function : TimerSendSite
//    // Input :
//    // Description : TimerSendSite
//    // ---------------------------------------------------------------------------
//    private class TimerShowSport extends CountDownTimer {
//        private TimerShowSport() {
//            super(TIMER_TRAINING_SPORT, TIMER_TRAINING_SPORT);
//        }
//
//        @Override
//        public void onFinish() //
//        {
//            rlChooseSportType.setVisibility(View.GONE);
//        }
//
//        @Override
//        public void onTick(long millisUntilFinished) {
//        }
//    }
//}
