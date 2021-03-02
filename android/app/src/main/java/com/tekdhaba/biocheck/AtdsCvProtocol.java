//package com.tekdhaba.biocheck;
//
//import android.content.Context;
//import android.content.res.AssetManager;
//import android.util.Log;
//
//import com.biocheck.customer.backend.AudioController;
//import com.biocheck.customer.backend.LogFile;
//import com.biocheck.customer.backend.database.DB_SourceGlobal;
//import com.biocheck.customer.R;
//
//import org.json.JSONArray;
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.util.ArrayList;
//import java.util.List;
//
//import static com.biocheck.customer.backend.atds.AtdsCalc.HF_END1;
//import static com.biocheck.customer.backend.atds.AtdsCalc.HF_END2;
//import static com.biocheck.customer.backend.atds.AtdsCalc.HF_END3;
//
//
//public class AtdsCvProtocol {
//
//    private static final String	LOG_TAG	= "AtdsCvProtocol";
//
//    // chronisch state
//    private static final int 	TR_ST_IDEL					= 0;
//    private static final int 	TR_ST_WARMING_UP			= 1;
//    private static final int 	TR_ST_TRAINING_START		= 2;
//    private static final int 	TR_ST_TRAINING_RUN_EN1		= 3;
//    private static final int 	TR_ST_TRAINING_RUN_EN2		= 4;
//    private static final int 	TR_ST_TRAINING_RUN_EN3		= 5;
//    public static final int 	TR_ST_COOLING_DOWN_START	= 6;
//    private static final int 	TR_ST_COOLING_DOWN			= 7;
//
//    private final static long CVP_WARMING_UP_TIME    = 6 * 60 * 1000;
//    private final static long CVP_COOLING_DOWN_TIME  = 6 * 60 * 1000;
//
//    private final static long CVP_NUMBER_TRAINING_WEEK   = 3;
//    private final static long CVP_NUMBER_WEEK_BLOK   = 6;
//    public final static long CVP_NUMBER_TRAINING_BLOK = (CVP_NUMBER_TRAINING_WEEK * CVP_NUMBER_WEEK_BLOK);
//
//
//    private long lCvpTimePart = 0;
//    private long lMeasurementTimeOld = 0;
//
//    private Context mContext;
//
//    private List<Integer> ilEndurance = new ArrayList<>();
//    private List<Integer> ilTime = new ArrayList<>();
//
//
//    private int stCvpTrainingState = 0;
//    private int stCvpTrainingStateOld = 0;
//    private long lTrainingTimeTarget = 0;
//    private String sTrainingStatus = "";
//    private boolean bEndurance1Done = false;
//
//    public AtdsCvProtocol(Context cContext)
//    {
//        mContext = cContext;
//    }
//
//    // ---------------------------------------------------------------------------
//    // Function : ReadTrainingData
//    //
//    // Input : Cvp start time.
//    // Description : Read the training setting for the current CVP training
//    // ---------------------------------------------------------------------------
//    private void ReadTrainingData()
//    {
//        try {
//            DB_SourceGlobal dDataBaseGlobal = new DB_SourceGlobal(mContext);
//            long lNumberOfCvpTraining = dDataBaseGlobal.GetNumberOfCvpTraining();
//            long lTrainingWeek = (lNumberOfCvpTraining / CVP_NUMBER_TRAINING_WEEK) + 1;
//            Log.d(LOG_TAG, "CVP Number of Cvp tr: "+lNumberOfCvpTraining + " Tr Week: " + lTrainingWeek);
//
//            JSONObject JsonCvp = GetCvpProtocol();
//            if(lTrainingWeek > 36)
//                lTrainingWeek = 36;
//
//
//            if( JsonCvp.has("Week" + lTrainingWeek)) {
//                JSONArray array = JsonCvp.getJSONArray("Week" + lTrainingWeek);
//                JSONObject Step1 = array.getJSONObject(0);
//                JSONObject Step2 = array.getJSONObject(1);
//                JSONObject Step3 = array.getJSONObject(2);
//
//                ilEndurance.clear();
//                ilEndurance.add(Step1.getInt("Endurance"));
//                ilEndurance.add(Step2.getInt("Endurance"));
//                ilEndurance.add(Step3.getInt("Endurance"));
//
//                ilTime.clear();
//                ilTime.add(Step1.getInt("Time") * 60 * 1000);
//                ilTime.add(Step2.getInt("Time") * 60 * 1000);
//                ilTime.add(Step3.getInt("Time") * 60 * 1000);
//
//                LogFile.WriteLogRow( LOG_TAG,"CVP Step 1 endurance: "+ ilEndurance.get(0) + " Step 1 time: "+ilTime.get(0) +
//                        " Step 2 endurance: "+ ilEndurance.get(1) + " Step 2 time: "+ilTime.get(1) +
//                        " Step 3 endurance: "+ ilEndurance.get(2) + " Step 3 time: "+ilTime.get(2));
//            }
//            else {
//                LogFile.WriteLogRow( LOG_TAG, "Training week :" + lTrainingWeek + " not found");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // ---------------------------------------------------------------------------
//    // Function : GetCvpProtocol
//    //
//    // Input :
//    // Description : Read the cvp protocol form a json file
//    // ---------------------------------------------------------------------------
//    private JSONObject GetCvpProtocol()
//    {
//        JSONObject json = null;
//
//        try {
//            String str = "";
//            AssetManager assetManager = mContext.getAssets();
//            InputStream in = assetManager.open("CvpProtocol.json");
//            InputStreamReader isr = new InputStreamReader(in);
//            char [] inputBuffer = new char[100];
//
//            int charRead;
//            StringBuilder sStringFull = new StringBuilder();
//            while((charRead = isr.read(inputBuffer))>0)
//            {
//                sStringFull.append(String.copyValueOf(inputBuffer,0,charRead));
//            }
//            str = sStringFull.toString();
//            json = new JSONObject(str);
//
//        } catch (JSONException e) {
//            e.printStackTrace();
//        } catch(IOException ioe)
//        {
//            ioe.printStackTrace();
//        }
//
//        //implement logic with JSON here
//        return json;
//    }
//
//
//    // ---------------------------------------------------------------------------
//    // Function : AddTrainingTime
//    //
//    // Input : bool add or not add time, the time.
//    // Description : Add time to the training timer
//    // ---------------------------------------------------------------------------
//    private void AddTrainingTime(boolean bAdd, long lMeasurementTime)
//    {
//        if(bAdd)
//        {
//            lCvpTimePart += (lMeasurementTime - lMeasurementTimeOld);
//        }
//        lMeasurementTimeOld = lMeasurementTime;
////        Log.d(LOG_TAG, "lCvpTimePart: "+lCvpTimePart);
//    }
//
//    public long GetTrainingTimePart()
//    {
//        return lCvpTimePart;
//    }
//
//    public long GetTimeTarget()
//    {
//        return lTrainingTimeTarget;
//    }
//
//    public int GetTrainingState()
//    {
//        return stCvpTrainingState;
//    }
//
//    public String GetTrainingText()
//    {
//        return sTrainingStatus;
//    }
//
//
//
//    // ---------------------------------------------------------------------------
//    // Function : StartTraining
//    //
//    // Input : lCvpStart cvp start datetime
//    // Description : StartTraining the CV protocol
//    // ---------------------------------------------------------------------------
//    public void StartTraining()
//    {
//
//        ReadTrainingData();
//
//        if((ilTime.size() >= 3)&& (ilEndurance.size() >= 3)) {
//            sTrainingStatus = "";
//            stCvpTrainingState = TR_ST_WARMING_UP;
//            lTrainingTimeTarget = CVP_WARMING_UP_TIME;
//            lCvpTimePart = 0;
//            lMeasurementTimeOld = 0;
//        }
//    }
//
//    public Boolean Endurance1Done()
//    {
//        return bEndurance1Done;
//    }
//
//
//    // ---------------------------------------------------------------------------
//    // Function : HandelCvp
//    //
//    // Input : Atdscalc, audio controller, current training time
//    // Description : Handel the CV protocol
//    // ---------------------------------------------------------------------------
//
//
//
//
//
//
//
//
//    public Boolean HandelCvp(AtdsCalc aAtdsCalc, AudioController cAudioController, long lMeasurementTime)
//    {
//        Boolean bStopTraining = false;
//        switch (stCvpTrainingState)
//        {
//            case TR_ST_IDEL:
//                lCvpTimePart = 0;
//                lTrainingTimeTarget = CVP_WARMING_UP_TIME;
//                sTrainingStatus = "";
//                break;
//
//            case TR_ST_WARMING_UP: // now the athlete need to st 3 min in warming up cooling down level.
//
//                if(aAtdsCalc.Atds_getAmplitude()  == 0)
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                }
//                else if(aAtdsCalc.Atds_getAmplitude() > aAtdsCalc.HRV_BEGIN_MAX) // relax.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//
//                }
//                else if((aAtdsCalc.Atds_getAmplitude() < (aAtdsCalc.HRV_BEGIN_LOW + 2.5)) || (aAtdsCalc.Atds_getAtdsState() > AtdsCalc.HRV_WUPCDN)) // if the athlete go to fast give a warning.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//
//                }
//                else // the athlete is going ok.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                }
//
//                if((aAtdsCalc.Atds_getAtdsState() > AtdsCalc.HRVHF_NONE) &&
//                        (aAtdsCalc.Atds_getAtdsState() <= AtdsCalc.HRV_WUPCDN))
//                {
//                    AddTrainingTime(true, lMeasurementTime);
//                    if(GetTrainingTimePart() > CVP_WARMING_UP_TIME) // after 6min the athlete have done the slow start up and can do his training.
//                    {
//                        stCvpTrainingState = TR_ST_TRAINING_START;
//
//                        if((ilTime.size() >= 1) && (ilTime.get(0) != 0))
//                            lTrainingTimeTarget = ilTime.get(0);
//                        else if (ilTime.size() >= 2)
//                            lTrainingTimeTarget = ilTime.get(1);
//                        else
//                            lTrainingTimeTarget = 0;
//                        cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_TrStart));
//                        lCvpTimePart = 0;
//                    }
//                }
//                else {
//                    AddTrainingTime(false, lMeasurementTime);
//                }
//                break;
//            case TR_ST_TRAINING_START:
//
//                if(aAtdsCalc.Atds_getAtdsState() >= HF_END1)
//                {
//                    bEndurance1Done = true;
//                    if(ilTime.get(0) != 0)
//                        stCvpTrainingState = TR_ST_TRAINING_RUN_EN1;
//                    else
//                        stCvpTrainingState = TR_ST_TRAINING_RUN_EN2;
//
//                    cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_TrRun));
//                }
//                else {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                    AddTrainingTime(false, lMeasurementTime);
//                }
//                break;
//
//            case TR_ST_TRAINING_RUN_EN1:
//
//
//
//
//
//                if(aAtdsCalc.Atds_getAtdsState() == ilEndurance.get(0))
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                else if(aAtdsCalc.Atds_getAtdsState() > ilEndurance.get(0))
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//                else
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//
//
//
//                if ((aAtdsCalc.Atds_getAtdsState() >= HF_END1) &&
//                        (aAtdsCalc.Atds_getAtdsState() == (ilEndurance.get(0) - 1) ||
//                                aAtdsCalc.Atds_getAtdsState() == ilEndurance.get(0)))// Only calc time is user is in end1 or higher
////                {
//                    AddTrainingTime(true, lMeasurementTime);
//                    if(GetTrainingTimePart() > ilTime.get(0)) // after 6min the athlete have done the slow start up and can do his training.
//                    {
//                        stCvpTrainingState = TR_ST_TRAINING_RUN_EN2;
//                        lTrainingTimeTarget = ilTime.get(1);
//                        cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_TrEn1End));
//
//                        lCvpTimePart = 0;
//                    }
//                }
//                else
//                    AddTrainingTime(false, lMeasurementTime);
//
//
//
//                break;
//
//
//
//
//
//
//
//
//            case TR_ST_TRAINING_RUN_EN2:
//                if(aAtdsCalc.Atds_getAtdsState() == ilEndurance.get(1))
//                {
//
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                }
//                else if(aAtdsCalc.Atds_getAtdsState() > ilEndurance.get(1))
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//                }
//                else
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                }
//
//                if ((aAtdsCalc.Atds_getAtdsState() >= HF_END1)  &&
//                        (aAtdsCalc.Atds_getAtdsState() == (ilEndurance.get(1) - 1) ||
//                                aAtdsCalc.Atds_getAtdsState() == ilEndurance.get(1))) // Only calc time is user is in end1 or higher
//                {
//                    AddTrainingTime(true, lMeasurementTime);
//                    if(GetTrainingTimePart() > ilTime.get(1)) // after 6min the athlete have done the slow start up and can do his training.
//                    {
//                        if(ilTime.get(2) != 0) {
//                            stCvpTrainingState = TR_ST_TRAINING_RUN_EN3;
//                            lTrainingTimeTarget = ilTime.get(2);
//                            cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_TrEn2End));
//                        }
//                        else {
//                            stCvpTrainingState = TR_ST_COOLING_DOWN_START;
//                            lTrainingTimeTarget = CVP_COOLING_DOWN_TIME;
//                            cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_TrEnd));
//                        }
//                        lCvpTimePart = 0;
//                    }
//                }
//                else
//                    AddTrainingTime(false, lMeasurementTime);
//
//                break;
//            case TR_ST_TRAINING_RUN_EN3:
//
//                if(aAtdsCalc.Atds_getAtdsState() == ilEndurance.get(2))
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                }
//                else if(aAtdsCalc.Atds_getAtdsState() > ilEndurance.get(2))
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//                }
//                else
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                }
//
//                if ((aAtdsCalc.Atds_getAtdsState() >= HF_END1)  &&
//                        (aAtdsCalc.Atds_getAtdsState() == (ilEndurance.get(2) - 1) ||
//                                aAtdsCalc.Atds_getAtdsState() == ilEndurance.get(2))) // Only calc time is user is in end1 or higher
//                {
//                    AddTrainingTime(true, lMeasurementTime);
//                    if(GetTrainingTimePart() > ilTime.get(2)) // after 6min the athlete have done the slow start up and can do his training.
//                    {
//                        stCvpTrainingState = TR_ST_COOLING_DOWN_START;
//                        lTrainingTimeTarget = CVP_COOLING_DOWN_TIME;
//                        cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_TrEnd));
//                        lCvpTimePart = 0;
//                    }
//                }
//                else
//                    AddTrainingTime(false, lMeasurementTime);
//
//                break;
//            case TR_ST_COOLING_DOWN_START:
//                if(aAtdsCalc.Atds_getAtdsState() < HF_END1)
//                {
//                    stCvpTrainingState = TR_ST_COOLING_DOWN;
//                    lTrainingTimeTarget = CVP_COOLING_DOWN_TIME;
//                    cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_CdRun));
//                }
//                else {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//                    AddTrainingTime(false, lMeasurementTime);
//                }
//                break;
//
//            case TR_ST_COOLING_DOWN:
//                if( (aAtdsCalc.Atds_getAtdsState() >= HF_END1)||
//                    (aAtdsCalc.Atds_getAmplitude() < (aAtdsCalc.HRV_BEGIN_LOW + 2.5)))// the athlete go to slo. Below warming up cooling down level.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//                }
//                else if(aAtdsCalc.Atds_getAmplitude() > aAtdsCalc.HRV_BEGIN_MAX)
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                }
//                else // the athlete is going ok.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                }
//
//                if (aAtdsCalc.Atds_getAtdsState() <= AtdsCalc.HRV_WUPCDN)
//                {
//                    AddTrainingTime(true, lMeasurementTime);
//                    if(GetTrainingTimePart() > CVP_COOLING_DOWN_TIME) // after 6min the athlete have done the slow start up and can do his training.
//                    {
//                        cAudioController.SpeakText(mContext.getString(R.string.s_chro_State_Down));
//                        sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Down);
//                        stCvpTrainingState = TR_ST_IDEL;
//
//                        lCvpTimePart = 0;
//                        bStopTraining = true;
//                    }
//                }
//                else
//                    AddTrainingTime(false, lMeasurementTime);
//                break;
//
//            default:
//                break;
//        }
//
//        if(stCvpTrainingState != stCvpTrainingStateOld)
//        {
//            stCvpTrainingStateOld = stCvpTrainingState;
//            if((ilTime.size() >= 3)&& (ilEndurance.size() >= 3)) {
//                LogFile.WriteLogRow(LOG_TAG, "CVP State " + stCvpTrainingState + " Step 1 endurance: " + ilEndurance.get(0) + " Step 1 time: " + ilTime.get(0) +
//                        " Step 2 endurance: " + ilEndurance.get(1) + " Step 2 time: " + ilTime.get(1) +
//                        " Step 3 endurance: " + ilEndurance.get(2) + " Step 3 time: " + ilTime.get(2));
//            }
//            else {
//                LogFile.WriteLogRow(LOG_TAG, "CVP Training not found ");
//            }
//        }
//
//        return bStopTraining;
//    }
//}
