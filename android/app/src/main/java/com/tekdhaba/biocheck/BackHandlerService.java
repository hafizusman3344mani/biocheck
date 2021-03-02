//package com.tekdhaba.biocheck;
//
//import android.app.Notification;
//import android.app.NotificationChannel;
//import android.app.NotificationManager;
//import android.app.PendingIntent;
//import android.app.Service;
//import android.content.Context;
//import android.content.Intent;
//import android.graphics.Bitmap;
//import android.graphics.BitmapFactory;
//import android.os.Build;
//import android.os.Bundle;
//import android.os.CountDownTimer;
//import android.os.Handler;
//import android.os.IBinder;
//import android.os.Message;
//import android.os.Messenger;
//import android.util.Log;
//
//import androidx.core.app.NotificationCompat;
//import androidx.core.content.ContextCompat;
//
//import com.biocheck.customer.AppHelper;
//import com.biocheck.customer.BuildConfig;
//import com.biocheck.customer.MessageEvent;
//import com.biocheck.customer.MessengerSenderToClients;
//import com.biocheck.customer.MyApplication;
//import com.biocheck.customer.R;
//import com.biocheck.customer.backend.atds.AtdsCalc;
//import com.biocheck.customer.backend.atds.AtdsCvProtocol;
//import com.biocheck.customer.backend.atds.AtdsNames;
//import com.biocheck.customer.backend.atds.MeasurementData;
//import com.biocheck.customer.backend.atds.MeasurementStorageFile;
//import com.biocheck.customer.backend.database.DB_SourceDetail;
//import com.biocheck.customer.backend.database.DB_SourceGlobal;
//import com.biocheck.customer.backend.database.TrainingElementGlobale;
//import com.biocheck.customer.backend.upload.UploadHandlerV3;
//import com.biocheck.customer.frontend.MainActivity;
//import com.biocheck.customer.frontend.bluetooth.BluetoothBle;
//import com.crashlytics.android.answers.Answers;
//import com.crashlytics.android.answers.CustomEvent;
//
//import net.grandcentrix.tray.AppPreferences;
//
//import org.greenrobot.eventbus.EventBus;
//import org.greenrobot.eventbus.Subscribe;
//import org.greenrobot.eventbus.ThreadMode;
//import org.json.JSONArray;
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Locale;
//
//import static com.biocheck.customer.backend.PreferenceConfig.BLUE_DEVICE;
//
//public class BackHandlerService extends Service
//{
//	private static final String	LOG_TAG	= "BackHandlerService";
//	public static final String	MSG_KEY_SPORT_TYPE	= "MSG_KEY_SPORT_TYPE";
//
//	public static final int ONGOING_NOTIFICATION_ID = 107;
//
//	// message
//	public static final int		MSG_REGISTER_CLIENT				= 10;
//	public static final int		MSG_UNREGISTER_CLIENT			= 11;
//    public static final int		MSG_REGISTER_CLIENT_MAIN	    = 12;
//
//	// Device connection
//	public static final int		MSG_READ_SETTINGS		    = 20;
//	public static final int		MSG_HOME_VIEW_START		    = 21;
//
//	// data Message
//    public static final int		MSG_GENERAL				    = 30;
//	public static final int		MSG_DATA				    = 32;
//	public static final int		MSG_DATA_GRAPH			    = 33;
//	public static final int 	MSG_DATA_AT_TEST_BICYCLE 	= 34;
//	public static final int 	MSG_DATA_AT_TEST_RUN 		= 35;
//
//	// Training Start/Stop message
//    public static final int     MSG_TRAINING_START_REST           	= 50;
//    public static final int     MSG_TRAINING_STOP_REST            	= 51;
//    public static final int     MSG_TRAINING_START_EXERCISE  		= 52;
//	public static final int     MSG_TRAINING_START_EXERCISE_AT  	= 53;
//    public static final int     MSG_TRAINING_STOP_EXERCISE        	= 54;
//	public static final int     MSG_TRAINING_START_CHRONISCH  	  	= 55;
//	public static final int     MSG_TRAINING_START_CHRONISCH_INPUT 	= 56;
//	public static final int     MSG_TRAINING_STOP_CHRONISCH        	= 57;
//	public static final int 	MSG_TRAINING_IS_END                 = 58;
//	public static final int 	MSG_TRAINING_TOGGLE_PAUSE 			= 59;
//    public static final int 	MSG_TRAINING_START_AT_TEST_BICYCLE 	= 60;
//    public static final int 	MSG_TRAINING_STOP_AT_TEST_BICYCLE 	= 61;
//	public static final int 	MSG_TRAINING_START_REST_FREE		= 62;
//	public static final int 	MSG_TRAINING_START_AT_TEST_RUN 		= 63;
//	public static final int 	MSG_TRAINING_STOP_AT_TEST_RUN 		= 64;
//
//	// OTHER
//	public static final int     MSG_TRAINING_HISTORY_LOAD_ID    = 70;
//
//	public static final int		MSG_LOGIN_DATA				= 80;
//	public static final int		MSG_LOGIN					= 81;
//	public static final int		MSG_LOGIN_ERROR				= 82;
//	public static final int		MSG_LOG_OUT					= 83;
//	public static final int 	MSG_INIT_AUDIO				= 84;
//
//    public static final int		MSG_NEW_REST_LEVEL			= 96;
//    public static final int		MSG_UPDATE_HISTORY			= 97;
//    public static final int		MSG_NEW_HISTORY_DATA		= 98;
//    public static final int		MSG_NEW_TRAINING_DETAIL		= 99;
//
//	public static final int		MSG_MESSAGE_TRAINER			= 101;
//	public static final int		MSG_MESSAGE_TRAINER_NEW		= 102;
//    public static final int		MSG_MESSAGE_NEW_LIST	    = 103;
//    public static final int		MSG_MESSAGE_READ			= 104;
//	public static final int		MSG_MESSAGE_PUSH_NEW		= 105;
//
//
//    public static final int		MSG_MESSAGE_STATUS_SITE		= 110;
//    public static final int     MSG_UPDATE_SETTING_AT       = 111;
//	public static final int     MSG_LOAD_TRAINING_VIEW      = 112;
//	public static final int     MSG_GET_SITE_STATUS         = 113;
//
//	public static final int     MSG_BLUETOOTH_DATA       	= 200;
//
//    // end Message
//
//	public static final int 	TRAINING_STATE_WUP_CLDOWN	= 6 * 60 * 1000;
//	public static final int 	TRAINING_STATE_TR_END2		= 20 * 60 *1000; // 20 min
//	public static final int 	MAX_PAUSE_TIME 				= 6 * 60 * 1000; // 6 minutes
//	public static final int 	TRAINING_CVP_DURATION = (TRAINING_STATE_WUP_CLDOWN + TRAINING_STATE_TR_END2 + MAX_PAUSE_TIME);
//	public static final int 	POOL_LOW_PRIORITY_TIME 			=5* 60 * 1000; // 2 minutes
//
//    // Time defines
//	public static final int	POOLING_TIMER		        = 500;
//    public static final int TRAINING_LOG_TIME           = 2 * 1000;     // Timer to log a training point after 2sec
//    public static final int TRAINING_SAVE_TIME          = 2 * 60 * 1000; // Training global data save time 2 minutes
//
//	public static final int REST_TRAINING_DURATION      = 6 * 60 * 1000; // 6 minutes
//	public static final int REST_TRAINING_MAX_DURATION  = 6 * 60 * 1000 + 10 * 1000; // 6 minutes
//
//	public static final int MINIMUM_TRAINING_DURATION   = 6 * 60 * 1000; // 6 minutes
//	public static final int	DATA_TIME_OUT 		        = 60 * 1000;
//	public static final int	ZERO_CHECK_CALIBRATE_TIME   = 5000;
//	public static final int	ZERO_CHECK_CALIBRATE_TIME_INV   = 1000;
//
//	// Messenger service to send data to activity's
//	private final Messenger						mMessenger			= new Messenger(new Handler(new IncomingHandler()));
//	// Messenger service to send and received to activity's
//	private ArrayList<Messenger>				mClients			= new ArrayList<>();
//    private MessengerSenderToClients mMessengerSender    = new MessengerSenderToClients();
//
//    // Timers
//    private TimerPooling 			tTimerPooling;
//    private TimerLiveTraining		tTimerLiveTraining;
////    private TimerSiteHighPriority 	tTimerSiteHighPriority;
//	private TimerSiteLowPriority 	tTimerSiteLowPriority;
//	private TimerDataTimeOut		tTimerDataTimeOut;
//    private TimerSaveTraining 		tTimerSaveTraining;
//
//    private AtTestHandlerBicycle pAtTestBicycleHandler = null;
//	private AtTestHandlerRun pAtTestRunHandler = null;
//
//	// ATDS variable
//    private AtdsCalc aAtdsCalc = null;
//	private MeasurementData aMeasurementData = null;
//	private AtdsCvProtocol aAtdsCvProtocol = null;
//
//	// Strap data
//	private boolean bHeartRateDataValid = false;
//	private boolean bHeartRateDataFound = false;
//
//    // Location variable
//    private GpsHandler cGpsHandler			= null;
//
//	// Logfile variable
//	private MeasurementStorageFile AtdsLogData;
//	// Database variable
//	private UploadHandlerV3 SiteDataHandler	= null;
//	private boolean bSendSiteWifiOnly = false; 		// if false upload only data if connected to wifi.
//    private DB_SourceGlobal mDbHandlerGlobale;
//    private DB_SourceDetail mDbHandlerDetail;
//	private boolean 	bTrainingOnTeamOld = false;
//
//	private AudioController cAudioController				= null;
//
//    private boolean 	bAtFromInput = false;
//	private long lLastTrainingId = 0; // use for menu_history view
//
//	private NotificationCompat.Builder notificationBuilder;
//	private int iCurrentTrainingTypeView = 0;
//	private boolean bEndurance1Done = false;
//
//	private boolean bBluetoothOn = false;
//	private boolean bBluetoothConnected = false;
//	private boolean bBluetoothConnecting = false;
//	private int iBluetoothBatteryLevel = 0;
//
//	@Override
//	public void onCreate()
//	{
//		super.onCreate();
//
//		Log.d(LOG_TAG, "Service on create ThreadId: " + Thread.currentThread().getId());
//		aAtdsCalc = new AtdsCalc();
//		aMeasurementData = new MeasurementData();
//
//        pAtTestBicycleHandler = new AtTestHandlerBicycle(getApplicationContext(), Locale.getDefault());
//		pAtTestRunHandler = new AtTestHandlerRun(getApplicationContext(), Locale.getDefault());
//
//		SiteDataHandler = new UploadHandlerV3(getApplicationContext());
//
//		cAudioController = new AudioController(getApplicationContext(), Locale.getDefault());
//		cGpsHandler = new GpsHandler(getApplicationContext());
//
//		aAtdsCvProtocol = new AtdsCvProtocol(getApplicationContext());
//
//		tTimerPooling = new TimerPooling();
//		tTimerLiveTraining = new TimerLiveTraining();
//		tTimerDataTimeOut = new TimerDataTimeOut();
//		tTimerSiteLowPriority = new TimerSiteLowPriority();
//        tTimerSaveTraining = new TimerSaveTraining();
//
//		mDbHandlerGlobale = new DB_SourceGlobal(getApplicationContext());
//		mDbHandlerDetail = new DB_SourceDetail(getApplicationContext());
//		tTimerPooling.start();
//		tTimerLiveTraining.start();
//		tTimerSiteLowPriority.start();
//        tTimerSaveTraining.start();
//		CheckInternetConnection(); // Check the internet connection
//
//		// login to site / check login
////		SiteDataHandler.Site_LogIn(MyApplication.getInstance().getPrefManager().getUserName(),
////				MyApplication.getInstance().getPrefManager().getUserPassword());
//
//		startForeground(ONGOING_NOTIFICATION_ID, SetNotificationService());
//		EventBus.getDefault().register(this);
//
//		SiteDataHandler.ValidateToken();
//	}
//
//
//	public static final String PRIMARY_CHANNEL = "default";
//	private Notification SetNotificationService ()
//	{
//		Log.d(LOG_TAG, "SetNotificationService");
//		try {
//			NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//			if(notificationManager != null) {
//				if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//					NotificationChannel chan1 = new NotificationChannel(PRIMARY_CHANNEL, "Primary Channel", NotificationManager.IMPORTANCE_LOW);
//					chan1.setSound(null, null);
//					notificationManager.createNotificationChannel(chan1);
//				}
//				Bitmap largeIcon = BitmapFactory.decodeResource(getResources(), R.drawable.ic_biocheck);
//				Log.d(LOG_TAG, "SetNotificationService build" + PRIMARY_CHANNEL);
//				Intent resultIntent = new Intent(this, MainActivity.class);
//				PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, resultIntent, 0);
//				notificationBuilder = new NotificationCompat.Builder(this, PRIMARY_CHANNEL)
//						.setSmallIcon(getNotificationIcon())
//						.setColor(ContextCompat.getColor(getApplicationContext(), R.color.colorPrimary))
//						.setLargeIcon(largeIcon)
//						.setTicker(getApplicationContext().getResources().getString(R.string.app_nameFull))
//                        .setDefaults(0)
//						.setWhen(0)
//                        .setOnlyAlertOnce(true)
//						.setAutoCancel(false)
//						.setContentTitle(getApplicationContext().getResources().getString(R.string.app_nameFull))
//						.setContentText(getApplicationContext().getResources().getString(R.string.sNotStart))
//						.setOngoing(true)
//						.setContentIntent(pendingIntent)
//						.setChannelId(PRIMARY_CHANNEL);
//
//				notificationManager.notify(ONGOING_NOTIFICATION_ID, notificationBuilder.build());
//
//				return notificationBuilder.getNotification();
//			}
//		}catch (Exception e)
//		{
//			e.printStackTrace();
//		}
//		return null;
//	}
//
//    private int getNotificationIcon() {
//        boolean useWhiteIcon = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP);
//        return useWhiteIcon ? R.drawable.ic_notification_white : R.drawable.ic_biocheck;
//    }
//
//	private void UpdateNotification()
//	{
//		String sText;
//		if(bBluetoothConnected) {
//			sText = String.format(Locale.getDefault(), "%s %d bpm %s",
//					getString(AtdsNames.GetAtdsStatusName(aAtdsCalc.Atds_getAtdsState(), AtdsCalc.TRAINING_EXERCISE)),
//					aAtdsCalc.Atds_getHF(),
//					aMeasurementData.Get_MeasurementTimeString());
//		}
//		else {
//			sText = GetBluetoothStatus();
//		}
//
//		notificationBuilder.setContentText(sText);
//		NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//		if(notificationManager != null)
//			notificationManager.notify(ONGOING_NOTIFICATION_ID, notificationBuilder.build());
//	}
//
//	@Override
//	public IBinder onBind(Intent intent)
//	{
//		Log.d(LOG_TAG, "On bind: " + intent);
//		return mMessenger.getBinder();
//	}
//
//	// ---------------------------------------------------------------------------
//	// Function : IncomingHandler
//	//
//	// Input :
//	// Description : Incoming Message Handler
//	// ---------------------------------------------------------------------------
//	private class IncomingHandler implements Handler.Callback
//	{ // Handler of incoming messages from
//		// clients.
//		@Override
//		public boolean handleMessage(Message msg)
//		{
//			switch (msg.what)
//			{
//				case MSG_REGISTER_CLIENT:
//					Log.d(BackHandlerService.LOG_TAG, "MSG_REGISTER_CLIENT " + mClients.size() + "  " + msg.replyTo);
//					mClients.add(msg.replyTo);
//					break;
//				case MSG_MESSAGE_READ:
//					Log.d(LOG_TAG, "SetMessageRead");
//					SiteDataHandler.SetMessageRead(); //iMessage
//					break;
//
//                case MSG_REGISTER_CLIENT_MAIN:
//                    mClients.add(msg.replyTo);
//                    aMeasurementData.ResetStateTimer();
//                    break;
//
//				case MSG_UNREGISTER_CLIENT:
//					Log.d(BackHandlerService.LOG_TAG, "MyService remove Client NR: " + mClients.size() + "  " + msg.replyTo);
//					mClients.remove(msg.replyTo);
//					break;
//
//				case MSG_READ_SETTINGS: // Read the settings form memory
//					ReadUserSettings();
//                    String sToken  	= msg.getData().getString("Token");
//                    Log.d(LOG_TAG, "Token set: " +sToken);
//                    if((sToken != null) && (!sToken.isEmpty()))
//                        SiteDataHandler.UpdateToken(sToken);
//					break;
//
//				case MSG_HOME_VIEW_START:
//					aMeasurementData.ResetStateTimer();
//					break;
//
//				case MSG_TRAINING_START_REST:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						bAtFromInput = false;
//						Log.d(LOG_TAG, "Start menu_training Rest");
//                        TrainingStart(AtdsCalc.TRAINING_REST, AtdsCalc.TRAINING_SPORT_NONE);
//					}
//					break;
//				case MSG_TRAINING_START_REST_FREE:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						bAtFromInput = false;
//						Log.d(LOG_TAG, "Start menu_training Rest free");
//						TrainingStart(AtdsCalc.TRAINING_REST_FREE, AtdsCalc.TRAINING_SPORT_NONE);
//					}
//					break;
//
//                case MSG_TRAINING_STOP_REST:
//                    if (aMeasurementData.Is_MeasurementOn()) {
//                        Log.d(LOG_TAG, "MSG_TRAINING_STOP_ASK" + msg.getData().getBoolean("Save"));
//                        TrainingStop(msg.getData().getBoolean("Save"));
//                    }
//                    break;
//
//				case MSG_TRAINING_START_EXERCISE:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						Log.d(LOG_TAG, "Start menu_training exercise");
//						bAtFromInput = false;
//
//						TrainingStart(AtdsCalc.TRAINING_EXERCISE, msg.getData().getInt(MSG_KEY_SPORT_TYPE));
//					}
//					break;
//				case MSG_TRAINING_START_EXERCISE_AT:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						Log.d(LOG_TAG, "Start menu_training exercise at");
//						bAtFromInput = true;
//						TrainingStart(AtdsCalc.TRAINING_TYPE_AT_TRAINING, msg.getData().getInt(MSG_KEY_SPORT_TYPE));
//					}
//					break;
//
//                case MSG_TRAINING_STOP_EXERCISE:
//                    if (aMeasurementData.Is_MeasurementOn()) {
//                        Log.d(LOG_TAG, "MSG_TRAINING_STOP_ASK");
//                        TrainingStop(msg.getData().getBoolean("Save"));
//                    }
//                    break;
//
//				case MSG_TRAINING_START_CHRONISCH:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						Log.d(LOG_TAG, "Start menu_training CHRONISCH");
//						bAtFromInput = false;
//						TrainingStart(AtdsCalc.TRAINING_TYPE_CHRON_VERM, msg.getData().getInt(MSG_KEY_SPORT_TYPE) );
//					}
//					break;
//				case MSG_TRAINING_START_CHRONISCH_INPUT:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						Log.d(LOG_TAG, "Start menu_training CHRONISCH");
//						bAtFromInput = true;
//						TrainingStart(AtdsCalc.TRAINING_TYPE_CHRON_VERM, msg.getData().getInt(MSG_KEY_SPORT_TYPE));
//					}
//					break;
//
//				case MSG_TRAINING_STOP_CHRONISCH:
//					if (aMeasurementData.Is_MeasurementOn()) {
//						Log.d(LOG_TAG, "Start menu_training CHRONISCH");
//						TrainingStop(msg.getData().getBoolean("Save"));
//					}
//					break;
//				case MSG_TRAINING_TOGGLE_PAUSE:
//					if (aMeasurementData.Is_MeasurementOn())
//					{
//						if (aMeasurementData.Is_MeasurementPause())
//							aMeasurementData.MeasurementPause(false);
//						else
//							aMeasurementData.MeasurementPause(true);
//					}
//					break;
//
//				case MSG_TRAINING_START_AT_TEST_RUN:
//					if (!aMeasurementData.Is_MeasurementOn()) {
//						Log.d(LOG_TAG, "Start AtTest run");
//						AtTestRunStartStop(true, true);
//					}
//					break;
//
//				case MSG_TRAINING_STOP_AT_TEST_RUN:
//					if (aMeasurementData.Is_MeasurementOn()){
//						Log.d(LOG_TAG, "stop AtTest run");
//						AtTestRunStartStop(false, msg.getData().getBoolean("Save"));
//					}
//					break;
//
//                case MSG_TRAINING_START_AT_TEST_BICYCLE:
//                    if (!aMeasurementData.Is_MeasurementOn()) {
//                        Log.d(LOG_TAG, "Start AtTest Bicycle");
//                        AtTestBicycleStartStop(true, true);
//                    }
//                    break;
//
//                case MSG_TRAINING_STOP_AT_TEST_BICYCLE:
//                    if (aMeasurementData.Is_MeasurementOn()){
//                        Log.d(LOG_TAG, "Stop AtTest Bicycle");
//                        AtTestBicycleStartStop(false, msg.getData().getBoolean("Save"));
//                    }
//                    break;
//
//				case MSG_TRAINING_HISTORY_LOAD_ID:
//					Log.d("LoadFile", "Load Id from menu_history Id:" + msg.getData().getLong("Id"));
//                    lLastTrainingId = msg.getData().getLong("Id");
//					break;
//
//				case MSG_LOGIN:
//					String sEmail = msg.getData().getString("Email");
//					String sPassWord = msg.getData().getString("PassWord");
//					boolean bNewUser = msg.getData().getBoolean("NewUser");
//					SiteDataHandler.LogIn(sEmail, sPassWord, bNewUser);
//					break;
//                case MSG_LOG_OUT:
//                	Log.d(LOG_TAG, "MSG_LOG_OUT");
//					mDbHandlerGlobale.removeAllData();
//					mDbHandlerDetail.removeAllData();
//					SiteDataHandler.LogOut();
//					break;
//
//                case MSG_INIT_AUDIO:
//                    cAudioController = new AudioController(getApplicationContext(), Locale.getDefault());
//                    break;
//
//
//                case MSG_UPDATE_HISTORY:
//					UploadToSiteLowPriority();
//                    break;
//
//                case MSG_MESSAGE_TRAINER_NEW:
//					Log.d(LOG_TAG, "MSG_MESSAGE_TRAINER_NEW");
//                    String sMessage = msg.getData().getString("message");
//					String sFilePath = msg.getData().getString("file_path");
//                    long lTraining = msg.getData().getLong("TrainingId");
//
//					mDbHandlerGlobale.NewMessage(sMessage,System.currentTimeMillis()/1000,lTraining,sFilePath);
//					UploadToSiteLowPriority();
//                    break;
//				case MSG_MESSAGE_PUSH_NEW:
//
//
//
//					Log.d(LOG_TAG, "MSG_MESSAGE_PUSH_NEW");
//					String pushMessage = msg.getData().getString("message");
//					String messageId = msg.getData().getString("message_id");
//					String user_name = msg.getData().getString("user_name");
//					String user_id = msg.getData().getString("user_id");
//					String created_at = msg.getData().getString("created_at");
//					String attachment_url = msg.getData().getString("attachment_url");
//					JSONObject messageObject = new JSONObject();
//					assert messageId != null;
//
//					try {
//						messageObject.put("Id", Integer.parseInt(messageId));
//						messageObject.put("ReplyFromPersonId", user_id);
//						messageObject.put("ReplyFrom", user_name);
//						messageObject.put("DateOfMessage", "/Date(" + created_at + ")/");
//						messageObject.put("Message", pushMessage);
//						messageObject.put("AttachmentUrl", attachment_url);
//						messageObject.put("DateRead", "null");
//					} catch (JSONException e) {
//						e.printStackTrace();
//					}
//
//					JSONArray array = new JSONArray();
//					array.put(messageObject);
//					mDbHandlerGlobale.NewMessengerList(array);
//					UploadToSiteLowPriority();
//					break;
//				case MSG_MESSAGE_NEW_LIST:
//                    SiteDataHandler.StartGetAllMessage();
//                    break;
//
//                case MSG_UPDATE_SETTING_AT:
//                    int iNewAt = msg.getData().getInt("NewAt");
//                    MyApplication.getInstance().getPrefManager().storeAt(iNewAt);
//                    break;
//				case MSG_LOAD_TRAINING_VIEW:
//
//					iCurrentTrainingTypeView = msg.getData().getInt("TrainingType");
//					Log.d(LOG_TAG, "MSG_LOAD_TRAINING_VIEW " + iCurrentTrainingTypeView);
//					break;
//
//				case MSG_BLUETOOTH_DATA:
//					HandelBluetoothPacket(msg.getData());
//					break;
//                case MSG_GET_SITE_STATUS:
//					Log.d(LOG_TAG, "MSG_GET_SITE_STATUS ");
//                    SiteDataHandler.MultiSiteRequestSlow();
//                    break;
//			}
//			return true;
//		}
//	}
//
//    @Subscribe(threadMode = ThreadMode.BACKGROUND)
//    public void onMessageEvent(MessageEvent event) {
//        Log.d(LOG_TAG, "event DB_GetAllMessage get all onMessageEvent" + event.message);
//        if(event.event == MessageEvent.MSG_NEW_MESSAGE)
//        {
//            Log.d(LOG_TAG, "Message MSG_NEW_MESSAGE");
////			mMessengerSender.SendMessage(MSG_MESSAGE_TRAINER, mClients);
//			mMessengerSender.SendMessage(MSG_MESSAGE_NEW_LIST, mClients);
//        }
//        else if (event.event == MessageEvent.MSG_NEW_REST_LEVEL)
//		{
//			mMessengerSender.SendMessage(MSG_NEW_REST_LEVEL, mClients);
//		}
//		else if (event.event == MessageEvent.MSG_NEW_TRAINING_DETAIL)
//		{
//			mMessengerSender.SendMessage(MSG_NEW_TRAINING_DETAIL, mClients);
//		}
//		else if(event.event == MessageEvent.MSG_NEW_STATE_STATUS)
//			{
//			mMessengerSender.SendMessage(MSG_MESSAGE_STATUS_SITE, mClients);
//		}
//		else if(event.event == MessageEvent.MSG_NEW_TRAINING_DATA)
//		{
//			mMessengerSender.SendMessage(MSG_NEW_HISTORY_DATA, mClients);
//		}
//		else if(event.event == MessageEvent.MSG_NEW_LOGIN)
//		{
//
//			Bundle BundleData = new Bundle();
//			BundleData.putInt(UploadHandlerV3.ACCOUNT_SUCCESS, event.mBundleData.getInt(UploadHandlerV3.ACCOUNT_SUCCESS));
//			BundleData.putString(UploadHandlerV3.ACCOUNT_MESSAGE, event.mBundleData.getString(UploadHandlerV3.ACCOUNT_MESSAGE));
//
//			mMessengerSender.SendMessage(MSG_LOGIN_DATA, BundleData, mClients);
//
//			if (SiteDataHandler.Site_GetRefNr_Int() != 0) {
//				LogFile.WriteLogRow(LOG_TAG, "Blue connect from HandlerDataBaseStatus login");
//				UploadToSiteLowPriority();
//			}
//
//		}
//		else if(event.event == MessageEvent.MSG_NEW_LOGIN_ERROR)
//		{
//			if(!aMeasurementData.Is_MeasurementOn())
//			{
//				mMessengerSender.SendMessage(MSG_LOGIN_ERROR, mClients);
//
//				mDbHandlerGlobale.removeAllData();
//				mDbHandlerDetail.removeAllData();
//				SiteDataHandler.LogOut();
//
//			}
//		}
//    }
//
//	void ReadUserSettings()
//	{
//		AppPreferences pref = new AppPreferences(getApplicationContext());
//
//		bSendSiteWifiOnly = pref.getBoolean("prefSendSiteWifiOnly", false);
//
//		cAudioController.SetAudioOn(pref.getBoolean("AudioOn", true),
//				pref.getBoolean("SetAudioStateOnChance", true));
//		cAudioController.SetAudioInterval(Integer.parseInt(pref.getString("SetAudioInterval", "5")));
//		cAudioController.SetSpeakType(pref.getBoolean("SetAudioState", true),
//				pref.getBoolean("SetAudioTime", true),
//				pref.getBoolean("SetAudioHrt", true),
//				pref.getBoolean("SetAudioSpeed", true),
//				pref.getBoolean("SetAudioDistance", true)
//		);
//		pAtTestBicycleHandler.SetAudioOn(pref.getBoolean("AudioOn", true),
//				Integer.parseInt(pref.getString("SetAudioIntervalAt", "20")));
//		pAtTestRunHandler.SetAudioOn(pref.getBoolean("AudioOn", true),
//				Integer.parseInt(pref.getString("SetAudioIntervalAt", "20")));
//	}
//
//
//    //---------------------------------------------------------------------------
//    // Function:    PoolDataHandler
//    // Input:
//    // Description: This timer send avery 1 sec the message to the view,
//    //      and if the menu_training is on the p menu_training date will be saved.
//    //      If the atds state is change the audio will be played.
//    //---------------------------------------------------------------------------
//	private void PoolDataHandler()
//    {
//
////		EventBus.getDefault().post(new MessageEvent(MessageEvent.MSG_READ_MESSAGE, "Read message from server"));
//        if( aMeasurementData.Is_MeasurementOn())
//        {
//			cGpsHandler.SetGpsTrainingPause(aMeasurementData.Is_MeasurementPause());
//            aMeasurementData.AddTime(aAtdsCalc.Atds_getState());
//
//			if(aMeasurementData.Is_MeasurementPause() &&(aMeasurementData.Get_MeasurementTimePause()> MAX_PAUSE_TIME))
//				TrainingStop(true);
//        }
//
//		HandelTrainingState();
//		CheckInternetConnection(); // Check the internet connection
//		UpdateNotification(); // Update the notification text.
//
//        if( aMeasurementData.Is_MeasurementOn()) {
//			if (	(aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_EXERCISE) ||
//					(aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_TYPE_AT_TRAINING) )
//			{
//
//
//				cAudioController.StateUpdate(
//						aAtdsCalc.Atds_getState(),
//						aMeasurementData.Get_MeasurementTime(),
//						aAtdsCalc.Atds_getHF(),
//						cGpsHandler.GetCurrentSpeedKmh(),
//						cGpsHandler.GetDistance(), "",
//						bEndurance1Done); // update the for the audio player
//
//			}
//			else if (aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_TYPE_CHRON_VERM)
//			{
//				cAudioController.StateUpdate(
//						aAtdsCalc.Atds_getState(),
//						aMeasurementData.Get_MeasurementTime(),
//						aAtdsCalc.Atds_getHF(),
//						cGpsHandler.GetCurrentSpeedKmh(),
//						cGpsHandler.GetDistance(),
//						aAtdsCvProtocol.GetTrainingText(),
//						aAtdsCvProtocol.Endurance1Done()); // update the for the audio player
//			}
//		}
//		if (pAtTestBicycleHandler.isMeasurementOn())
//		{
//			pAtTestBicycleHandler.SetValues(aAtdsCalc.Atds_getHF());
//			pAtTestBicycleHandler.HandleTest();
//			SendMsgAtTestBicycle();
//		}
//		else if (pAtTestRunHandler.isMeasurementDone())
//		{
//			SendMsgAtTestRun();
//		}
//		if (pAtTestRunHandler.isMeasurementOn())
//		{
//			pAtTestRunHandler.SetValues(aAtdsCalc.Atds_getHF(), cGpsHandler.GetCurrentSpeedKmh());
//			pAtTestRunHandler.HandleTest();
//			SendMsgAtTestRun();
//		}
//		else if (pAtTestBicycleHandler.isMeasurementDone())
//		{
//			SendMsgAtTestBicycle();
//		}
//
//		SendMsgGeneral();
//		SendMessageData();              // Send the data to the clients
//		SendMsgGraphPoint();
//    }
//
//	private String GetBluetoothStatus()
//	{
//		String sStatus;
//		if(!bBluetoothOn)
//		{
//			sStatus = getResources().getString(R.string.s_blue_is_off_l1);
//		}
//		else if(bBluetoothConnected)
//		{
//			sStatus = getResources().getString(R.string.s_blue_is_OnConnect);
//		}
//		else if(bBluetoothConnecting)
//		{
//			sStatus = getResources().getString(R.string.s_blue_is_Connecting_s);
//		}
//		else if (GetBluetoothDeviceName().isEmpty())
//		{
//			sStatus = getResources().getString(R.string.s_blue_is_NoDevice);
//		}
//		else
//		{
//			sStatus = getResources().getString(R.string.s_blue_is_Disconnect);
//		}
//		return sStatus;
//	}
//
//	String GetBluetoothDeviceName()
//	{
//		AppPreferences pref = new AppPreferences(getApplicationContext());
//		String sName = pref.getString(BLUE_DEVICE, "");
//		if(sName == null)
//			sName = "";
//		return sName;
//	}
//
//	void HandelBluetoothPacket (Bundle packet)
//	{
//		if (packet.getInt("msg") == BluetoothBle.LOW_STATUS)
//		{
//			bBluetoothOn = packet.getBoolean(BluetoothBle.MS_BluetoothOn);
//			bBluetoothConnected = packet.getBoolean(BluetoothBle.MS_BluetoothConnected);
//			bBluetoothConnecting = packet.getBoolean(BluetoothBle.MS_BluetoothConnecting);
//			iBluetoothBatteryLevel = packet.getInt(BluetoothBle.MS_BatteryLevel);
//		}
//		else if (packet.getInt("msg") ==BluetoothBle.LOW_ENERGY_DATA)
//		{
//			int	iaHeartbeat[];
//			int iHeartBeatNumber = packet.getInt(BluetoothBle.MS_HeartBeatNumber); // get the number of
//			iaHeartbeat = packet.getIntArray(BluetoothBle.MS_HeartBeat);
//
//			if(iaHeartbeat != null)
//			{
//				for (int iI = 0; iI < iHeartBeatNumber; iI++) {
//					if (iI < iaHeartbeat.length) {
//						int iNewRrTime = iaHeartbeat[iI];
//						if (iNewRrTime > 100) // is Time oke
//						{
//							int usHRTFilter = aAtdsCalc.Atds_ProcessHeartBeat(iNewRrTime); // Calculate the Atds values
//							if ((aMeasurementData.Is_MeasurementOn()) && (usHRTFilter != 0)) // a menu_training is start
//							{
//								aMeasurementData.NewHrtValue(iNewRrTime);
//								// Save the menu_training time and state
//								AtdsLogData.WriteDataSimple(iNewRrTime); // Write the simple log file only rr time (txt)
//								AtdsLogData.WriteDataAll(aAtdsCalc,
//										cGpsHandler.GetCurrentSpeedKmh(),
//										cGpsHandler.GetCurrentPosition().latitude,
//										cGpsHandler.GetCurrentPosition().longitude, aMeasurementData.Is_MeasurementPause());
//
//							}
//						} else if (packet.getInt(BluetoothBle.MS_HeartRate) == 0) // no rr time, send only the other data
//						{
//							aAtdsCalc.Atds_ProcessHeartBeat(iNewRrTime);
//						}
//					}
//				}
//			}
//			if (packet.getInt(BluetoothBle.MS_HeartRate) != 0) {
//				if(!bHeartRateDataValid)
//					Log.d(LOG_TAG, "Bluetooth received hf " + packet.getInt(BluetoothBle.MS_HeartRate));
//				bHeartRateDataValid = true;
//			}
//
//			bHeartRateDataFound = true;
//		}
//	}
//
//	//---------------------------------------------------------------------------
//	// Function:    HandelTrainingState
//	// Input        Training time.
//	// Description: This function helps the athlete to slowly start his menu_training if he have done that the atds class can calculate the good pi.
//	//---------------------------------------------------------------------------
//	private void HandelTrainingState()
//	{
//		// Is it a zerocheck And time is done
//		if(	(aMeasurementData.Is_MeasurementOn())&&
//			(aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_REST) &&
//				(aAtdsCalc.Atds_GetTimeBase() >= REST_TRAINING_DURATION) )
//		{
//			TrainingStop(true);
//		} else if (aMeasurementData.Is_MeasurementOn() &&
//		aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_REST &&
//			aMeasurementData.Get_MeasurementTime() >= REST_TRAINING_MAX_DURATION)
//		{
//			TrainingStop(true);
//		}
//		// is it a CVP Training?
//		else if ((aMeasurementData.Is_MeasurementOn())&& (aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_TYPE_CHRON_VERM))
//		{
//			if(aAtdsCvProtocol.HandelCvp(aAtdsCalc, cAudioController, aMeasurementData.Get_MeasurementTime()))
//			{
//				TrainingStop(true);
//			}
//		}
//		else {
//			if(aAtdsCalc.Atds_getAtdsState() >= AtdsCalc.HF_END1)
//				bEndurance1Done = true;
//		}
//	}
//
//
//	// ---------------------------------------------------------------------------
//	// Function : Send the General msg to the clients
//	// Input :
//	// Description :
//	// ---------------------------------------------------------------------------
//	private void SendMsgGeneral()
//	{
//		Bundle BundleData = new Bundle();
//		BundleData.putBoolean("MeasurementOn", aMeasurementData.Is_MeasurementOn());
//		BundleData.putBoolean("MeasurementPause", aMeasurementData.Is_MeasurementPause());
//		BundleData.putInt("MeasurementType", aMeasurementData.Get_MeasurementType());
//		BundleData.putInt("CurrentTrainingTypeView", iCurrentTrainingTypeView);
//
//		BundleData.putBoolean("BluetoothOn", bBluetoothOn);
//		BundleData.putBoolean("BluetoothConnected", bBluetoothConnected);
//		BundleData.putBoolean("BluetoothConnecting", bBluetoothConnecting);
//		BundleData.putInt("BluetoothBattery", iBluetoothBatteryLevel);
//
//		BundleData.putBoolean("HeartRateDataValid", bHeartRateDataValid);
//		BundleData.putString("StatusBluetooth", GetBluetoothStatus());
//		BundleData.putBoolean("AtUseFromInput", bAtFromInput);
//		BundleData.putLong("LastTrainingId", lLastTrainingId);
//		mMessengerSender.SendMessage(MSG_GENERAL, BundleData, mClients);
//	}
//
//	// ---------------------------------------------------------------------------
//	// Function : Send the Data msg to the clients
//	// Input :
//	// Description :
//	// ---------------------------------------------------------------------------
//	private void SendMessageData()
//	{
//        if(cGpsHandler != null) {
//            Bundle BundleData = new Bundle();
//            BundleData.putInt("AtdsState", aAtdsCalc.Atds_getAtdsState());
//            BundleData.putInt("AtdsStateProgress", aAtdsCalc.Atds_getAtdsStateProgress());
//            BundleData.putInt("AtdsHeartRate", aAtdsCalc.Atds_getHF());
//            BundleData.putDouble("AtdsAmplitude", aAtdsCalc.Atds_getAmplitude());
//            BundleData.putInt("AtdsBreathFreq", aAtdsCalc.Atds_getBreathFreq());
//            BundleData.putInt("AtdsAtPoint", aAtdsCalc.Atds_getAT());
//            BundleData.putBoolean("AtdsAtPointFromInput", bAtFromInput);
//
//
//            BundleData.putLong("MeasurementTime", aMeasurementData.Get_MeasurementTime());
//            BundleData.putString("MeasurementTimeString", aMeasurementData.Get_MeasurementTimeString());
//			BundleData.putInt("MeasurementType", aMeasurementData.Get_MeasurementType());
//            BundleData.putDouble("SpeedKph", cGpsHandler.GetCurrentSpeedKmh());
//            BundleData.putDouble("Distance", cGpsHandler.GetDistance());
//
//            BundleData.putLong("TrGuideTime", aAtdsCvProtocol.GetTrainingTimePart());
//            BundleData.putLong("TrGuideTimeTarget", aAtdsCvProtocol.GetTimeTarget());
//            BundleData.putInt("stTrainingState", aAtdsCvProtocol.GetTrainingState());
//            BundleData.putString("TrainingStatus", aAtdsCvProtocol.GetTrainingText());
//            mMessengerSender.SendMessage(MSG_DATA, BundleData, mClients);
//        }
//	}
//
//    private void SendMsgGraphPoint()
//    {
//        Bundle BundleDataGraphList = new Bundle();
//		BundleDataGraphList.putDouble("dlTimeBase", (double) aMeasurementData.Get_MeasurementTime());
//		BundleDataGraphList.putDouble("dlBreathTime", aAtdsCalc.Atds_GetAdem());
//        mMessengerSender.SendMessage(MSG_DATA_GRAPH, BundleDataGraphList, mClients);
//    }
//
//	private void SendMsgAtTestRun()
//	{
//		Bundle BundleData = new Bundle();
//		BundleData.putBoolean("MetingStartStop", pAtTestRunHandler.isMeasurementOn());
//		BundleData.putBoolean("MetingDone", pAtTestRunHandler.isMeasurementDone());
//		BundleData.putDouble("SpeedTarget", pAtTestRunHandler.GetSpeedTarget());
//		BundleData.putDouble("SpeedMax", pAtTestRunHandler.GetSpeedMax());
//		BundleData.putInt("HrtMax", pAtTestRunHandler.GetHrtMax());
//		BundleData.putInt("HrtTarget", pAtTestRunHandler.GetHrtTarget());
//		BundleData.putInt("AtTestState", pAtTestRunHandler.GetAtTestState());
//		BundleData.putInt("CalcAt", pAtTestRunHandler.GetCalcAt());
//		BundleData.putString("MeasurementTimeString", AppHelper.Get_TimeString(pAtTestRunHandler.GetTestTime()));
//		BundleData.putDouble("Distance", cGpsHandler.GetDistance());
//
//		Log.d(LOG_TAG, "Msg At test data Target speed: " + String.format(Locale.US,"%.1f", pAtTestRunHandler.GetSpeedTarget()));
//
//		mMessengerSender.SendMessage(MSG_DATA_AT_TEST_RUN, BundleData, mClients);
//	}
//
//	private void SendMsgAtTestBicycle()
//	{
//		Bundle BundleData = new Bundle();
//		BundleData.putBoolean("MetingStartStop", pAtTestBicycleHandler.isMeasurementOn());
//		BundleData.putBoolean("MetingDone", pAtTestBicycleHandler.isMeasurementDone());
//		BundleData.putInt("HrtTarget", pAtTestBicycleHandler.GetHrtTarget());
//		BundleData.putInt("HrtMax", pAtTestBicycleHandler.GetHrtMax());
//		BundleData.putInt("CalcAt", pAtTestBicycleHandler.GetCalcAt());
//		BundleData.putString("MeasurementTimeString", AppHelper.Get_TimeString(pAtTestBicycleHandler.GetTestTime()));
//		BundleData.putDouble("Distance", cGpsHandler.GetDistance());
//
//		Log.d(LOG_TAG, "Msg At test data Target hrt: " + String.format("%d", pAtTestBicycleHandler.GetHrtTarget()));
//		mMessengerSender.SendMessage(MSG_DATA_AT_TEST_BICYCLE, BundleData, mClients);
//	}
//
//	private void CheckInternetConnection() {
//		boolean bInternetConnected= false;
//		if (SiteDataHandler != null)
//		{
//			if (SiteDataHandler.Site_IsLoggedIn())// only upload if user is log in
//			{
//				// if upload mobile on upload always els only if connected to the wifi
//				if ((AppHelper.CheckConnectedToWifi(getApplicationContext())) || // Connected to wifi?
//						(!bSendSiteWifiOnly && AppHelper.CheckConnected(getApplicationContext()))) // Connected to mobile en not set upload only wifi
//					bInternetConnected = true;
////				LogFile.WriteLogRow( LOG_TAG, "CheckInternetConnection SendSiteWifiOnly: " + bSendSiteWifiOnly
////                        + " CheckConnected " +  AppHelper.CheckConnected(getApplicationContext())
////                        + " CheckConnectedToWifi " +  AppHelper.CheckConnectedToWifi(getApplicationContext()) );
//			}
//			SiteDataHandler.Set_HaveConnection(bInternetConnected);
//		}
//	}
//
//	// ---------------------------------------------------------------------------
//	// Function : TrainingStart
//	//
//	// Input : Type of menu_training Rest or Exercise
//	// Description : Save the log files on the device
//	// ---------------------------------------------------------------------------
//	private void TrainingStart(int iMeasurementType, int iSportType)
//	{
//        LogFile.WriteLogRow( LOG_TAG, "TrainingStart Type: " + aMeasurementData.Get_MeasurementType()+ " AtFromInput:" + bAtFromInput);
//		Answers.getInstance().logCustom(new CustomEvent("TrainingStart Type: " + aMeasurementData.Get_MeasurementType()));
//		if(bHeartRateDataValid)
//		{
//            MyApplication.getInstance().getPrefManager().setTrainingOn(true);
//
//			aAtdsCalc.Atds_ResetCalcStartTr(!bAtFromInput);
//			aAtdsCalc.Atds_SetMeasurementType(iMeasurementType, iSportType);
//			cGpsHandler.SetGpsTrainingOn(true);
//
//			Log.d(LOG_TAG, "Start menu_training: " + iMeasurementType);
//
//			aMeasurementData.MeasurementStart(iMeasurementType);
//            StartNewAtdsFile(iMeasurementType);
//
//			if ((iMeasurementType == AtdsCalc.TRAINING_REST) || (iMeasurementType == AtdsCalc.TRAINING_REST_FREE)) // Set filter to zero
//			{
//				cGpsHandler.StopGps();
//				cAudioController.SetTrainingOn(false);
//                aAtdsCalc.Atds_SetAtFromInput(false, 0);
//			}
//			else // Exercise
//			{
//				int iAtSetInput = MyApplication.getInstance().getPrefManager().getAt();
//
//				cGpsHandler.StartGps();
//				cAudioController.SetTrainingOn(true);
//				if(iMeasurementType == AtdsCalc.TRAINING_TYPE_CHRON_VERM)
//				{
//					aAtdsCvProtocol.StartTraining();
//					cAudioController.SpeakText(getString(R.string.Speak_CVP_TrainingStarted));
//
//					if(bAtFromInput)
//
//						////as i m noting saving data i can use 0 as second param    aAtdsCalc.Atds_SetAtFromInput(174, 0);
//
//						aAtdsCalc.Atds_SetAtFromInput(iAtSetInput, mDbHandlerGlobale.getLastRestLevel());
//					else
//						aAtdsCalc.Atds_SetAtFromInput(false, 0);
//				}
//				else if(bAtFromInput)
//				{
//					aAtdsCalc.Atds_SetAtFromInput(true, iAtSetInput);
//
//
//					//IF 174 THEN  CALL THIS FUNCTION WITH VALUE = 4
//					aAtdsCalc.Atds_SetState(AtdsCalc.HRV_WUPCDN);
//
//					cAudioController.SpeakText(getString(R.string.Speak_AtTrainingStarted));
//				}
//                else {
//					aAtdsCalc.Atds_SetAtFromInput(false, 0);
//					cAudioController.SpeakText(getString(R.string.Speak_TrainingStarted));
//				}
//			}
//            MakeTrainingRowGlobal(0,0 );
//			MakeTrainingRowDetail();
//		}
//	}
//
//	private void TrainingStop(boolean bSave)
//	{
//		aMeasurementData.AddTime(aAtdsCalc.Atds_getState());	// Save last trainings data
//		MakeTrainingRowDetail();
//
//        LogFile.WriteLogRow(LOG_TAG, "TrainingStop Type:" + aMeasurementData.Get_MeasurementType());
//        MyApplication.getInstance().getPrefManager().setTrainingOn(false);
//
//		cAudioController.SetTrainingOn(false);
//		aMeasurementData.MeasurementStop();
//		MakeTrainingRowDetail();
//
//		if ((aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_REST) &&
//				((aAtdsCalc.Atds_GetTimeBase() >= REST_TRAINING_DURATION) ||
//						(aMeasurementData.Get_MeasurementTime() >= REST_TRAINING_MAX_DURATION)))
//		{
//			StopAtdsFile();	// Stop atds file and make zip
//			// Rest measurement done
//			LogFile.WriteLogRow(LOG_TAG, "CalcRestLevel " + lLastTrainingId);
//			int iRestLevel = mDbHandlerGlobale.CalcRestLevel(lLastTrainingId);
//			MakeTrainingRowGlobal(0,iRestLevel);
//			Log.d(LOG_TAG, "NewRestTest stop " + aMeasurementData.Get_MeasurementStartTimeSec() + " iRestLevel." + iRestLevel);
//
//			cAudioController.SpeakText(getString(R.string.sAudioGuideRestEnd, getString(AtdsNames.GetRestLevelId(iRestLevel))));
//		}
//		else if((aMeasurementData.Get_MeasurementType() != AtdsCalc.TRAINING_REST) &&
//				(((aMeasurementData.Get_MeasurementTime() >= MINIMUM_TRAINING_DURATION)&& (bSave))))
//		{
//
//			StopAtdsFile();	// Stop atds file and make zip
//			if(aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_REST_FREE)
//			{
//				MakeTrainingRowGlobal(0,0);
//				cAudioController.SpeakText(getString(R.string.sAudioGuideRestFreeEnd));
//			}
//			else
//				{
//				MakeTrainingRowGlobal(aAtdsCalc.Atds_getAT(),0);
//			}
//		}
//        else {
//            TrainingElementGlobale tTrainingFull = mDbHandlerGlobale.getTrainingById(lLastTrainingId);
//            mDbHandlerGlobale.DeleteTraining(lLastTrainingId);
//            mDbHandlerDetail.DeleteTraining(tTrainingFull.lDateTime);
//            lLastTrainingId = 0;
//        }
//		cGpsHandler.SetGpsTrainingOn(false);
//		cGpsHandler.StopGps();
//
//		Bundle BundleData = new Bundle();
//		BundleData.putLong("LastTrainingId", lLastTrainingId);
//		mMessengerSender.SendMessage(MSG_TRAINING_IS_END, BundleData, mClients);
//		bAtFromInput = false;
//		UploadToSiteLowPriority();
//	}
//
//	// Start or stop the
//	// ---------------------------------------------------------------------------
//	// Function : AtTestRunStartStop
//	// Input : menu_training on
//	// Description : Start or stop the
//	// ---------------------------------------------------------------------------
//	private void AtTestRunStartStop(boolean bStart,  boolean bSave)
//	{
//		if(bStart)
//		{
//			Answers.getInstance().logCustom(new CustomEvent("AtTestRun Start"));
//			if(bHeartRateDataValid)
//			{
//				Log.d(LOG_TAG, "At Test Run Start");
//				aMeasurementData.MeasurementStart(AtdsCalc.TRAINING_AT_TEST_RUN);
//
//				MyApplication.getInstance().getPrefManager().setTrainingOn(true);
//				aAtdsCalc.Atds_ResetCalcStartTr(true);
//				aAtdsCalc.Atds_SetMeasurementType(AtdsCalc.TRAINING_AT_TEST_RUN, AtdsCalc.TRAINING_SPORT_NONE);
//				cGpsHandler.SetGpsTrainingOn(true);
//
//				StartNewAtdsFile(AtdsCalc.TRAINING_AT_TEST_RUN);
//				pAtTestRunHandler.MeasurementStart();
//
//				aAtdsCalc.Atds_ResetCalc();
//				cAudioController.SetTrainingOn(false);
//				cGpsHandler.StartGps();
//				MakeTrainingRowGlobal(0, 0);
//				MakeTrainingRowDetail();
//			}
//		}
//		else
//		{
//			MakeTrainingRowDetail();
//			Answers.getInstance().logCustom(new CustomEvent("AtTestRun Stop"));
//			MyApplication.getInstance().getPrefManager().setTrainingOn(false);
//			cAudioController.SetTrainingOn(false);
//
//			pAtTestRunHandler.MeasurementStop();
//			if((aMeasurementData.Get_MeasurementTime() > AtTestHandlerBicycle.WARMING_UP)&& (bSave))
//			{
//				int iAtNewInput = pAtTestRunHandler.GetCalcAt();
//				MakeTrainingRowGlobal(iAtNewInput,0);
//
//				if(iAtNewInput > 1) {
//					MyApplication.getInstance().getPrefManager().storeAt(iAtNewInput);
//				}
//			}
//			else {
//				pAtTestRunHandler.MeasurementReset();
//
//				TrainingElementGlobale tTrainingFull = mDbHandlerGlobale.getTrainingById(lLastTrainingId);
//				mDbHandlerGlobale.DeleteTraining(lLastTrainingId);
//				mDbHandlerDetail.DeleteTraining(tTrainingFull.lDateTime);
//				lLastTrainingId = 0;
//
//			}
//			aMeasurementData.MeasurementStop();
//			StopAtdsFile();
//
//			MakeTrainingRowDetail();
//
//			cGpsHandler.SetGpsTrainingOn(false);
//			cGpsHandler.StopGps();
//
//			Bundle BundleData = new Bundle();
//			BundleData.putLong("LastTrainingId", lLastTrainingId);
//			mMessengerSender.SendMessage(MSG_TRAINING_IS_END, BundleData, mClients);
//			UploadToSiteLowPriority();
//		}
//	}
//
//    // Start or stop the
//    // ---------------------------------------------------------------------------
//    // Function : AtTestRunStartStop
//    // Input : menu_training on
//    // Description : Start or stop the
//    // ---------------------------------------------------------------------------
//	private void AtTestBicycleStartStop(boolean bStart,  boolean bSave)
//    {
//        if(bStart)
//        {
//			Answers.getInstance().logCustom(new CustomEvent("AtTestBicycle Start"));
//            if(bHeartRateDataValid)
//            {
//                Log.d(LOG_TAG, "At Test Bicycle Start");
//                aMeasurementData.MeasurementStart(AtdsCalc.TRAINING_AT_TEST_BICYCLE);
//
//                MyApplication.getInstance().getPrefManager().setTrainingOn(true);
//                aAtdsCalc.Atds_ResetCalcStartTr(true);
//                aAtdsCalc.Atds_SetMeasurementType(AtdsCalc.TRAINING_AT_TEST_BICYCLE, AtdsCalc.TRAINING_SPORT_NONE);
//                cGpsHandler.SetGpsTrainingOn(true);
//
//                StartNewAtdsFile(AtdsCalc.TRAINING_AT_TEST_BICYCLE);
//                pAtTestBicycleHandler.MeasurementStart(aAtdsCalc.Atds_getHF());
//
//                aAtdsCalc.Atds_ResetCalc();
//                cAudioController.SetTrainingOn(false);
//                cGpsHandler.StartGps();
//                MakeTrainingRowGlobal(0, 0);
//				MakeTrainingRowDetail();
//            }
//        }
//        else
//        {
//			MakeTrainingRowDetail();
//			Answers.getInstance().logCustom(new CustomEvent("AtTestBicycle Stop"));
//            MyApplication.getInstance().getPrefManager().setTrainingOn(false);
//            cAudioController.SetTrainingOn(false);
//
//            pAtTestBicycleHandler.MeasurementStop();
//            if((aMeasurementData.Get_MeasurementTime() > AtTestHandlerBicycle.WARMING_UP)&& (bSave))
//            {
//				int iAtNewInput = pAtTestBicycleHandler.GetCalcAt();
//                MakeTrainingRowGlobal(iAtNewInput, 0);
//
//				if(iAtNewInput > 1) {
//					MyApplication.getInstance().getPrefManager().storeAt(iAtNewInput);
//				}
//            }
//            else {
//                pAtTestBicycleHandler.MeasurementReset();
//
//                TrainingElementGlobale tTrainingFull = mDbHandlerGlobale.getTrainingById(lLastTrainingId);
//
//                mDbHandlerGlobale.DeleteTraining(lLastTrainingId);
//				mDbHandlerDetail.DeleteTraining(tTrainingFull.lDateTime);
//                lLastTrainingId = 0;
//
//            }
//            aMeasurementData.MeasurementStop();
//			StopAtdsFile();
//
//            MakeTrainingRowDetail();
//
//            cGpsHandler.SetGpsTrainingOn(false);
//            cGpsHandler.StopGps();
//
//            Bundle BundleData = new Bundle();
//            BundleData.putLong("LastTrainingId", lLastTrainingId);
//            mMessengerSender.SendMessage(MSG_TRAINING_IS_END, BundleData, mClients);
//			UploadToSiteLowPriority();
//        }
//    }
//
//    private void StartNewAtdsFile(int iMeasurementType)
//    {
//        AtdsLogData = new MeasurementStorageFile(
//                aAtdsCalc.GetBreathMultiplier(),
//                aAtdsCalc.GetFilterMaxAmpDiff(),
//                aAtdsCalc.GetFilterAmpsSamples(),
//				BuildConfig.VERSION_NAME,
//                iMeasurementType,
//				GetBluetoothDeviceName(),
//                aMeasurementData.Get_MeasurementStartCalendar());
//    }
//
//	private void StopAtdsFile()
//	{
//		LogFile.WriteLogRow(LOG_TAG, "StopAtdsFile");
//		String sNewFileName = AtdsLogData.CompressAndRemoveFiles();
//		LogFile.WriteLogRow(LOG_TAG, "StopAtdsFile sNewFileName " + sNewFileName);
//		if(sNewFileName != null)
//			mDbHandlerGlobale.UpdateTrainingFileName(lLastTrainingId, sNewFileName);
//	}
//
//    private void MakeTrainingRowGlobal(int iAt, int iRestLevel)
//    {
//		double dAvgAmplitude = 0.0;
//		double dAvgHeartRate = 0.0;
//		double dAvgBreathFeq = 0.0;
//		double dAvgSpeed = 0.0;
//		List<Double> lValues = mDbHandlerDetail.GetAvgValues(aMeasurementData.Get_MeasurementStartTimeSec());
//
//		if(lValues.size() == 4){
//			dAvgHeartRate = lValues.get(0);
//			dAvgAmplitude = lValues.get(1);
//			dAvgBreathFeq = lValues.get(2);
//			dAvgSpeed = lValues.get(3);
//		}
//
//        Log.d(LOG_TAG, "MakeTrainingRowGlobal Amp : "+ dAvgAmplitude +
//				" Hf db: "+ dAvgHeartRate + " GetFileName: " + AtdsLogData.GetFileName() );
//
//        lLastTrainingId = mDbHandlerGlobale.createTraining(
//                aMeasurementData.Get_MeasurementStartTimeSec(),
//                aMeasurementData.Get_MeasurementType(),
//                aAtdsCalc.Atds_GetTrainingSport(),
//                aMeasurementData,
//                "",
//				(!aMeasurementData.Is_MeasurementOn()) ? AtdsLogData.GetFileName(): "",
//                aMeasurementData.Get_MeasurementTime(),
//				dAvgHeartRate,
//				dAvgAmplitude,
//				aMeasurementData.CalcRecoveryLevel(),
//				iAt,
//				iRestLevel,
//                cGpsHandler.GetDistance(),
//				dAvgSpeed,
//				dAvgBreathFeq);
//    }
//
//	// Send the live data to the data base
//	private void MakeTrainingRowDetail()
//	{
//		if((aMeasurementData.Is_MeasurementOn()) || (bTrainingOnTeamOld)) // is the menu_training running or the trainer is stop
//		{
//			if(!aMeasurementData.Is_MeasurementPause()) {
//				mDbHandlerDetail.CreateTrainingPoint( // Make a new menu_training point
//						SiteDataHandler.Site_GetRefNr_Int(),
//						aMeasurementData.Get_MeasurementStartTimeSec(),
//						aAtdsCalc.Atds_getHF(),
//						aAtdsCalc.Atds_getAmplitude(),
//						aAtdsCalc.Atds_getBreathFreq(),
//						aMeasurementData.Get_MeasurementTime(),
//						aAtdsCalc.Atds_getAT(),
//						aAtdsCalc.Atds_getState(),
//						cGpsHandler.GetDistance(),
//						cGpsHandler.GetCurrentSpeedKmh(),
//						cGpsHandler.GetHeight(),
//						cGpsHandler.GetCurrentPosition().longitude,
//						cGpsHandler.GetCurrentPosition().latitude,
//						aMeasurementData.Is_MeasurementOn(),
//						aMeasurementData.Get_MeasurementType());
//			}
//			else {
//				mDbHandlerDetail.CreateTrainingPoint( // Make a new menu_training point
//						SiteDataHandler.Site_GetRefNr_Int(),
//						aMeasurementData.Get_MeasurementStartTimeSec(),
//						0,
//						0.0,
//						0,
//						aMeasurementData.Get_MeasurementTime(),
//						aAtdsCalc.Atds_getAT(),
//						AtdsCalc.HRVHF_NONE,
//						0,
//						0,
//						0,
//						cGpsHandler.GetCurrentPosition().longitude,
//						cGpsHandler.GetCurrentPosition().latitude,
//						aMeasurementData.Is_MeasurementOn(),
//						aMeasurementData.Get_MeasurementType());
//			}
//
//			if((!aMeasurementData.Is_MeasurementOn()) && (bTrainingOnTeamOld)) // is menu_training stop wire one extra point with menu_training on is false zo the website can detect the menu_training end.
//			{
//				mDbHandlerDetail.CreateTrainingPoint(
//						SiteDataHandler.Site_GetRefNr_Int(),
//						aMeasurementData.Get_MeasurementStartTimeSec(),
//						aAtdsCalc.Atds_getHF(),
//						aAtdsCalc.Atds_getAmplitude(),
//						aAtdsCalc.Atds_getBreathFreq(),
//						aMeasurementData.Get_MeasurementTime(),
//						aAtdsCalc.Atds_getAT(),
//						aAtdsCalc.Atds_getState(),
//						cGpsHandler.GetDistance(),
//						cGpsHandler.GetCurrentSpeedKmh(),
//						cGpsHandler.GetHeight(),
//						cGpsHandler.GetCurrentPosition().longitude,
//						cGpsHandler.GetCurrentPosition().latitude,
//						aMeasurementData.Is_MeasurementOn(),
//						aMeasurementData.Get_MeasurementType());
//			}
//		}
//		bTrainingOnTeamOld = aMeasurementData.Is_MeasurementOn(); // save the old menu_training state to detect a menu_training stop.
//	}
//
//	// upload all the data form the database to the website
//	private void UploadToSiteLowPriority()
//	{
//		Log.d(LOG_TAG, "UploadToSiteLowPriority");
//		SiteDataHandler.MultiSiteRequestSlow();
//	}
//
//	// ---------------------------------------------------------------------------
//	// Function : PoolingTimer
//	// Input :
//	// Description : PoolingTimer the send the message to the fragments
//	// ---------------------------------------------------------------------------
//	private class TimerPooling extends CountDownTimer {
//		private TimerPooling() {
//			super(POOLING_TIMER, POOLING_TIMER);
//		}
//
//		@Override
//		public void onFinish() //
//		{
//            if(cGpsHandler != null)
//			    PoolDataHandler();
//            this.start();
//		}
//
//		@Override
//		public void onTick(long millisUntilFinished) {
//		}
//	}
//
//	// ---------------------------------------------------------------------------
//	// Function : TimerSiteLowPriority
//	// Input :
//	// Description : PoolingTimer the read the low priority data to/from the server
//	// ---------------------------------------------------------------------------
//	private class TimerSiteLowPriority extends CountDownTimer {
//		private TimerSiteLowPriority() {
//			super(POOL_LOW_PRIORITY_TIME, POOL_LOW_PRIORITY_TIME);
//		}
//
//		@Override
//		public void onFinish() //
//		{
//			if(!aMeasurementData.Is_MeasurementOn())
//				UploadToSiteLowPriority();
//            this.start();
//		}
//
//		@Override
//		public void onTick(long millisUntilFinished) {
//		}
//	}
//
//	// ---------------------------------------------------------------------------
//	// Function : TimerSendSite
//	// Input :
//	// Description : the timer run on 1sec
//	// ---------------------------------------------------------------------------
//	private class TimerLiveTraining extends CountDownTimer
//	{
//		private TimerLiveTraining()
//		{
//			super(TRAINING_LOG_TIME, TRAINING_LOG_TIME);
//		}
//
//		@Override
//		public void onFinish() //
//		{
//			MakeTrainingRowDetail(); // handel the live menu training
//            this.start();
//		}
//
//		@Override
//		public void onTick(long millisUntilFinished)
//		{
//		}
//	}
//
//
//    // ---------------------------------------------------------------------------
//    // Function : TimerSaveTraining
//    // Input :
//    // Description : This timer save is training on the training data so if the app crash the data wil nog be deleted
//    // ---------------------------------------------------------------------------
//	private class TimerSaveTraining extends CountDownTimer {
//		private TimerSaveTraining() {
//            super(TRAINING_SAVE_TIME, TRAINING_SAVE_TIME);
//        }
//
//        @Override
//        public void onFinish() //
//        {
//			Log.d(LOG_TAG, "TimerSaveTraining Training on:" + aMeasurementData.Is_MeasurementOn());
//            if(aMeasurementData.Is_MeasurementOn()) // Only save is the training is on
//            {
//                if( (aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_EXERCISE) ||
//						(aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_TYPE_CHRON_VERM)||
//						(aMeasurementData.Get_MeasurementType() == AtdsCalc.TRAINING_TYPE_AT_TRAINING))
//                    MakeTrainingRowGlobal(aAtdsCalc.Atds_getAT(), 0);
//                else
//                    MakeTrainingRowGlobal(0, 0);
//
//            }
//            this.start();
//        }
//        @Override
//        public void onTick(long millisUntilFinished) {
//        }
//    }
//
//    // ---------------------------------------------------------------------------
//    // Function : PoolingTimer
//    // Input :
//    // Description : PoolingTimer the send the message to the fragments
//    // ---------------------------------------------------------------------------
//    private class TimerDataTimeOut extends CountDownTimer {
//        private TimerDataTimeOut() {
//            super(DATA_TIME_OUT, DATA_TIME_OUT);
//        }
//
//        @Override
//        public void onFinish() //
//        {
//            if(!bHeartRateDataFound)
//            {
//                LogFile.WriteLogRow(LOG_TAG, "TimerDataTimeOut Reset atds data.");
//                bHeartRateDataValid = false;
//                aAtdsCalc.Atds_ResetTimeOut();
//            }
//            bHeartRateDataFound = false;
//            tTimerDataTimeOut.start();
//        }
//
//        @Override
//        public void onTick(long millisUntilFinished) {
//        }
//    }
//
//	// class destructor
//	@Override
//	public void onDestroy() {
//		EventBus.getDefault().unregister(this);
//		Log.d(LOG_TAG, "Com Service onDestroy");
//
//		if(aMeasurementData.Is_MeasurementOn()) // if a menu_training is running do a save menu_training end zo the data is saved
//			TrainingStop(true);
//
//		tTimerPooling.cancel(); // stop the timers
//		tTimerLiveTraining.cancel();
//		tTimerSiteLowPriority.cancel();
//        tTimerSaveTraining.cancel();
//
//		tTimerPooling = null; // delete the timers
//		tTimerLiveTraining = null;
//		tTimerSiteLowPriority = null;
//        tTimerSaveTraining = null;
//
//		cGpsHandler.StopGps(); // stop the gps
//		NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//		if(notificationManager != null)
//			notificationManager.cancel(ONGOING_NOTIFICATION_ID);
//
//		cAudioController = null;
//		cGpsHandler = null;
//		super.onDestroy();
//	}
//
//
//	@Override
//	public void onTaskRemoved(Intent rootIntent) {
//		NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//		if(notificationManager != null)
//			notificationManager.cancel(ONGOING_NOTIFICATION_ID);
//		super.onTaskRemoved(rootIntent);
//		Log.i(LOG_TAG, "onTaskRemoved()");
//	}
//}
