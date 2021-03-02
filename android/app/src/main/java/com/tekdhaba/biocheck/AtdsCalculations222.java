package com.tekdhaba.biocheck;

public class AtdsCalculations222{


    public AtdsCalculations222() {
        System.loadLibrary("native-lib");
    }

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: Initliazies an new calculatio instance since the native librtary works with an static instance! it is very imortant to always call this method on new training measurements
    //
    // Description:
    // ---------------------------------------------------------------------------
    public native void Initialize();

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: math test to check if the module works. An number is multplied againt 5
    //
    // Description:
    // ---------------------------------------------------------------------------
    public native int DemoTest(int number);
    
    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: ProcessHeartBeat (quint16 usHeartb)
    //
    // Description:  It returns point turns a value this value is named as HeartFilter,This is used at one point if to check that ur device giving proper value
    // ---------------------------------------------------------------------------
    public native int processHeartBeat(int usHeartRate);

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: GetAtdsStatus ENUM of integer
    //
    // Description: it will be changed every time when a heart beat output changes so when call procesHeartBeat  after that call this
    // ---------------------------------------------------------------------------
    public native int getAtdsState();

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: GetAtdsStatus
    //
    // Description: returns state of Atds calculation it will return progress showing in training screens
    // ---------------------------------------------------------------------------
    public native int getAtdsStateProgress();


    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: GetAtdsStatus
    //
    // Description: returns state of Atds calculation skip this one
    // ---------------------------------------------------------------------------
    public native int getState();



    //important one:-
    public native void SetState(int usState);

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: ItemFillAtdsHF
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native int getHF();

    // ---------------------------------------------------------------------------
    // Function: getBreathFreq
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native int getBreathFreq();

    // ---------------------------------------------------------------------------
    // Function: getHrvAmplitude
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native double getAmplitude();

    // ---------------------------------------------------------------------------
    // Function: getdTi
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native double getdTi();

    // ---------------------------------------------------------------------------
    // Function: getdHrtAverage
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native double getdTe();

    // ---------------------------------------------------------------------------
    // Function: getdHrtAverage
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native double getTiTe();

    // ---------------------------------------------------------------------------
    // Function: getRawHrt
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native int getRawHrt();

    // ---------------------------------------------------------------------------
    // Function: getdHrtAverage
    //
    // Description: multiply this value with two to get original value for bottom graph value in Rest measurement
    // ---------------------------------------------------------------------------
    public native int getHRTFil2();

    // ---------------------------------------------------------------------------
    // Function: ItemFillAtdsAT
    //
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native int getAT();

    public native int getFilterMaxAmpDiff();

    public native int getFilterAmpsSamples();

    public native double getBreathMultiplier();

    // ---------------------------------------------------------------------------
    // Function:  get dHrtAverage
    //
    // Description: THis function is being used by top graph in Rest measurement for the breath frequency
    // ---------------------------------------------------------------------------
    public native int getAdem();

    public native int getTimeBase();

    public native int getTrainingSport();

    public native void resetCalc();

    public native void resetTimeOut();

    public native void resetCalcStartTr(boolean bResetAt);

    public native void setAtFromInput(boolean bOn, int iAtIn);

    public native void setAtFromInput(int iLastAt, int iLevel);

    // ---------------------------------------------------------------------------
    // Class : AtdsCalculations
    // Function : f_ATDS_SetFilter
    //
    // Return : -
    // Description : Set the filter to be used to determine the HRT value
    // ---------------------------------------------------------------------------
    public native void setMeasurementType(int iType, int iTypeSport);
}
