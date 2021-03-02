package com.tekdhaba.biocheck;

public class AtdsCalculations {
    public AtdsCalculations() {
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
    // Description:
    // ---------------------------------------------------------------------------
    public native int processHeartBeat(int usHeartRate);

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: GetAtdsStatus
    //
    // Description: returns state of Atds calculation
    // ---------------------------------------------------------------------------
    public native int getAtdsState();

    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: GetAtdsStatus
    //
    // Description: returns state of Atds calculation
    // ---------------------------------------------------------------------------
    public native int getAtdsStateProgress();


    // ---------------------------------------------------------------------------
    // Class: AtdsCalculations
    // Function: GetAtdsStatus
    //
    // Description: returns state of Atds calculation
    // ---------------------------------------------------------------------------
    public native int getState();


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
    // Description: Puts ATDS AT in the uiChannelTable widget
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
    // Description: Puts ATDS AT in the uiChannelTable widget
    // ---------------------------------------------------------------------------
    public native int getAdem();

    public native int getTimeBase();

    public native int getTrainingSport();

    public native void resetCalc();

    public native void resetTimeOut();


//    if 174 option is selected then it should false else true
    public native void resetCalcStartTr(boolean bResetAt);


    /// if I select other(2nd) option in CVP training level the i have to send values to this function(For All other states)
    public native void setAtFromInput(boolean bOn, int iAtIn);

    ////// It is only used when 174 option is selected
    public native void SetState(int usState);
    
    /// if I select 174 option in CVP training level the i have to send values to this function
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
