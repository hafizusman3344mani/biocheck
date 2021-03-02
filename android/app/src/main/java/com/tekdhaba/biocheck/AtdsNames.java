//package com.tekdhaba.biocheck;
//
//
//import com.biocheck.customer.R;
//
//public class AtdsNames {
//
//	//---------------------------------------------------------------------------
//	// Function     : SetAtdsStatus
//	//
//	// Input       	:
//	// Description	: This function set the training state on the screen
//	//					: with the right text and color
//	//---------------------------------------------------------------------------
//	public static int GetAtdsStatusName(int iStatus, int iTrainingType)
//	{
//		int ResId = 0;
//
//		if((iTrainingType == AtdsCalc.TRAINING_REST)|| (iTrainingType == AtdsCalc.TRAINING_REST_FREE))
//		{
//			switch (iStatus) {
//				case AtdsCalc.HRVHF_NONE:              // Neutral, no value known or not implemented (yet)
//					ResId = R.string.HRV_TEXT_REST_HRVHF_NONE;
//					break;
//				case AtdsCalc.HRV_RELAX:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//					ResId = R.string.HRV_TEXT_REST_HRV_RELAX;
//					break;
//				case AtdsCalc.HRV_REST:                   // HRV 40 .. 69   high       (purple, Rest)
//					ResId = R.string.HRV_TEXT_REST_HRV_REST;
//					break;
//				case AtdsCalc.HRV_ACTIVE:                 // HRV 10 .. 39   medium     (pink,  Active)
//					ResId = R.string.HRV_TEXT_REST_HRV_ACTIVE;
//					break;
//				case AtdsCalc.HRV_WUPCDN:                    // HRV  5 .. 9    low        (white, Warm-up Cool-down)
//					ResId = R.string.HRV_TEXT_REST_HRV_WUPCDN;
//					break;
//				// HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
//				case AtdsCalc.HF_END1:                     // HF  > 0.97 * Aerobic Thr. (yellow,  Endurance 1)
//				case AtdsCalc.HF_END2:                  // HF  > 1.12 * Aerobic Thr. (green,   Endurance 2)
//				case AtdsCalc.HF_END3:                    // HF  > 1.25 * Aerobic Thr. (blue, Endurance 3)
//				case AtdsCalc.HF_INTENSE:                // HF  > 1.40 * Aerobic Thr. (orange,    Intensive)
//				case AtdsCalc.HF_INTENSE2:
//					ResId = R.string.HRV_TEXT_REST_HF_END1;
//					break;
//			}   // end of: switch (sATDSData.ucState)
//		}
//		else {
//
//
//			switch (iStatus) {
//				case AtdsCalc.HRVHF_NONE:              // Neutral, no value known or not implemented (yet)
//					ResId = R.string.HRV_TEXT_HRVHF_NONE;
//					break;
//				case AtdsCalc.HRV_RELAX:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//					ResId = R.string.HRV_TEXT_HRV_RELAX;
//					break;
//				case AtdsCalc.HRV_REST:                   // HRV 40 .. 69   high       (purple, Rest)
//					ResId = R.string.HRV_TEXT_HRV_REST;
//					break;
//				case AtdsCalc.HRV_ACTIVE:                 // HRV 10 .. 39   medium     (pink,  Active)
//					ResId = R.string.HRV_TEXT_HRV_ACTIVE;
//					break;
//				case AtdsCalc.HRV_WUPCDN:                    // HRV  5 .. 9    low        (white, Warm-up Cool-down)
//					ResId = R.string.HRV_TEXT_HRV_WUPCDN;
//					break;
//				// HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
//				case AtdsCalc.HF_END1:                     // HF  > 0.97 * Aerobic Thr. (yellow,  Endurance 1)
//					ResId = R.string.HRV_TEXT_HF_END1;
//					break;
//				case AtdsCalc.HF_END2:                  // HF  > 1.12 * Aerobic Thr. (green,   Endurance 2)
//					ResId = R.string.HRV_TEXT_HF_END2;
//					break;
//				case AtdsCalc.HF_END3:                    // HF  > 1.25 * Aerobic Thr. (blue, Endurance 3)
//					ResId = R.string.HRV_TEXT_HF_END3;
//					break;
//				case AtdsCalc.HF_INTENSE:                // HF  > 1.40 * Aerobic Thr. (orange,    Intensive)
//					ResId = R.string.HRV_TEXT_HF_INTENSE;
//					break;
//				case AtdsCalc.HF_INTENSE2:
//					ResId = R.string.HRV_TEXT_HF_INTENSE;
//					break;
//			}   // end of: switch (sATDSData.ucState)
//		}
//		return ResId;
//	}
//
//
//	//---------------------------------------------------------------------------
//	// Function     : SetAtdsStatus
//	//
//	// Input       	:
//	// Description	: This function set the training state on the screen
//	//					: with the right text and color
//	//---------------------------------------------------------------------------
//	public static int GetAtdsStatusNameExercise(int iStatus, boolean bEndurance1Done)
//	{
//		int ResId = 0;
//
//		switch (iStatus) {
//			case AtdsCalc.HRVHF_NONE:              // Neutral, no value known or not implemented (yet)
//				ResId = R.string.HRV_TEXT_HRVHF_NONE;
//				break;
//			case AtdsCalc.HRV_RELAX:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//				ResId = R.string.HRV_TEXT_HRV_RELAX;
//				break;
//			case AtdsCalc.HRV_REST:                   // HRV 40 .. 69   high       (purple, Rest)
//				ResId = R.string.HRV_TEXT_HRV_REST;
//				break;
//			case AtdsCalc.HRV_ACTIVE:                 // HRV 10 .. 39   medium     (pink,  Active)
//			case AtdsCalc.HRV_WUPCDN:                    // HRV  5 .. 9    low        (white, Warm-up Cool-down)
//				if(!bEndurance1Done)
//					ResId = R.string.HRV_TEXT_HRV_WUP;
//				else
//					ResId = R.string.HRV_TEXT_HRV_CDN;
//				break;
//			// HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
//			case AtdsCalc.HF_END1:                     // HF  > 0.97 * Aerobic Thr. (yellow,  Endurance 1)
//				ResId = R.string.HRV_TEXT_HF_END1;
//				break;
//			case AtdsCalc.HF_END2:                  // HF  > 1.12 * Aerobic Thr. (green,   Endurance 2)
//				ResId = R.string.HRV_TEXT_HF_END2;
//				break;
//			case AtdsCalc.HF_END3:                    // HF  > 1.25 * Aerobic Thr. (blue, Endurance 3)
//				ResId = R.string.HRV_TEXT_HF_END3;
//				break;
//			case AtdsCalc.HF_INTENSE:                // HF  > 1.40 * Aerobic Thr. (orange,    Intensive)
//				ResId = R.string.HRV_TEXT_HF_INTENSE;
//				break;
//			case AtdsCalc.HF_INTENSE2:
//				ResId = R.string.HRV_TEXT_HF_INTENSE;
//				break;
//		}   // end of: switch (sATDSData.ucState)
//		return ResId;
//	}
//
//	public static int GetAtdsStatusFullName(int iStatus, boolean bEndurance1Done)
//	{
//		int ResId = 0;
//
//		switch(iStatus)
//		{
//			case AtdsCalc.HRVHF_NONE:              // Neutral, no value known or not implemented (yet)
//				ResId = R.string.HRV_TEXT_HRVHF_NONE;
//				break;
//			case AtdsCalc.HRV_RELAX:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//				ResId = R.string.HRV_TEXT_HRV_RELAX;
//				break;
//			case AtdsCalc.HRV_REST:                   // HRV 40 .. 69   high       (purple, Rest)
//				ResId = R.string.HRV_TEXT_HRV_REST;
//				break;
//			case AtdsCalc.HRV_ACTIVE:                 // HRV 10 .. 39   medium     (pink,  Active)
//			case AtdsCalc.HRV_WUPCDN:                    // HRV  5 .. 9    low        (white, Warm-up Cool-down)
//				if(!bEndurance1Done)
//					ResId = R.string.HRV_TEXT_HRV_WUP;
//				else
//					ResId = R.string.HRV_TEXT_HRV_CDN;
//				break;
//			// HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
//			case AtdsCalc.HF_END1:                     // HF  > 0.97 * Aerobic Thr. (yellow,  Endurance 1)
//				ResId = R.string.HRV_TEXT_HF_END1;
//				break;
//			case AtdsCalc.HF_END2:                  // HF  > 1.12 * Aerobic Thr. (green,   Endurance 2)
//				ResId = R.string.HRV_TEXT_HF_END2;
//				break;
//			case AtdsCalc.HF_END3:                    // HF  > 1.25 * Aerobic Thr. (blue, Endurance 3)
//				ResId = R.string.HRV_TEXT_HF_END3;
//				break;
//			case AtdsCalc.HF_INTENSE:                // HF  > 1.40 * Aerobic Thr. (orange,    Intensive)
//				ResId = R.string.HRV_TEXT_HF_INTENSE;
//				break;
//			case AtdsCalc.HF_INTENSE2:
//				ResId = R.string.HRV_TEXT_HF_INTENSE;
//				break;
//		}   // end of: switch (sATDSData.ucState)
//
//		return ResId;
//	}
//
//	public static int GetRestLevelId(int iLevel)
//	{
//		int iLevelId;
//		if (iLevel < -10)
//			iLevelId = R.string.sLevel_Recovery;
//		else if (iLevel < 0)
//			iLevelId = R.string.sLevel_Modust;
//		else if (iLevel < 10)
//			iLevelId = R.string.sLevel_Normal;
//		else
//			iLevelId = R.string.sLevel_Intense;
//
//		return iLevelId;
//	}
//	public static int GetRestLevelSmall(int iLevel)
//	{
//		int iLevelId;
//		if (iLevel < -10)
//			iLevelId = R.string.sLevel_Sm_Recovery;
//		else if (iLevel < 0)
//			iLevelId = R.string.sLevel_Sm_Modust;
//		else if (iLevel < 10)
//			iLevelId = R.string.sLevel_Sm_Normal;
//		else
//			iLevelId = R.string.sLevel_Sm_Intense;
//
//		return iLevelId;
//	}
////    public static int GetRestLevelAdvice(int iLevel)
////    {
////        int iLevelId;
////        if (iLevel < -10)
////            iLevelId = R.string.sLevel_Av_Recovery;
////        else if (iLevel < 0)
////            iLevelId = R.string.sLevel_Av_Modust;
////        else if (iLevel < 10)
////            iLevelId = R.string.sLevel_Av_Normal;
////        else
////            iLevelId = R.string.sLevel_Av_Intense;
////
////        return iLevelId;
////    }
//
//	public static int GetTrainingType(int iType)
//	{
//		int ResId = 0;
//
//		switch(iType)
//		{
//			case AtdsCalc.TRAINING_REST:              // Neutral, no value known or not implemented (yet)
//				ResId = R.string.s_His_TypeZc;
//				break;
//			case AtdsCalc.TRAINING_REST_FREE:              // Neutral, no value known or not implemented (yet)
//				ResId = R.string.s_His_TypeZcFree;
//				break;
//			case AtdsCalc.TRAINING_EXERCISE:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//				ResId = R.string.s_His_TypeTr;
//				break;
//			case AtdsCalc.TRAINING_AT_TEST_RUN:                   // HRV 40 .. 69   high       (purple, Rest)
//				ResId = R.string.s_His_TypeAtRun;
//				break;
//			case AtdsCalc.TRAINING_AT_TEST_BICYCLE:
//				ResId = R.string.s_His_TypeAtTest;
//				break;
//			case AtdsCalc.TRAINING_TYPE_CHRON_VERM:
//				ResId = R.string.s_His_TypeCvp;
//				break;
//			case AtdsCalc.TRAINING_TYPE_AT_TRAINING:
//				ResId = R.string.s_His_TypeAt;
//				break;
//		}   // end of: switch (sATDSData.ucState)
//		return ResId;
//	}
//
//	public static int GetAtdsStateColorTr(int iType)
//	{
//		int ResId;
//
//		switch(iType)
//		{
//			default:              // Neutral, no value known or not implemented (yet)
//			case AtdsCalc.HRVHF_NONE:              // Neutral, no value known or not implemented (yet)
//			case AtdsCalc.HRV_RELAX:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//				ResId = R.color.cRelax_tr;
//				break;
//			case AtdsCalc.HRV_REST:                   // HRV 40 .. 69   high       (purple, Rest)
//				ResId = R.color.cRest_tr;
//				break;
//			case AtdsCalc.HRV_ACTIVE:                 // HRV 10 .. 39   medium     (pink,  Active)
//			case AtdsCalc.HRV_WUPCDN:
//				ResId = R.color.cWarmup_tr;
//				break;
//			case AtdsCalc.HF_END1:                     // HF  > 0.97 * Aerobic Thr. (yellow,  Endurance 1)
//				ResId = R.color.cEndurance1_tr;
//				break;
//			case AtdsCalc.HF_END2:                  // HF  > 1.12 * Aerobic Thr. (green,   Endurance 2)
//				ResId = R.color.cEndurance2_tr;
//				break;
//			case AtdsCalc.HF_END3:                    // HF  > 1.25 * Aerobic Thr. (blue, Endurance 3)
//				ResId = R.color.cEndurance3_tr;
//				break;
//			case AtdsCalc.HF_INTENSE:                // HF  > 1.40 * Aerobic Thr. (orange,    Intensive)
//			case AtdsCalc.HF_INTENSE2:
//				ResId = R.color.cIntensive_tr;
//				break;
//		}   // end of: switch (sATDSData.ucState)
//		return ResId;
//	}
//
//	public static int GetAtdsSportName(int iStatus)
//	{
//		int iResId;
//
//		switch(iStatus)
//		{
//			case AtdsCalc.TRAINING_SPORT_NONE:              // Neutral, no value known or not implemented (yet)
//				iResId = R.string.sSportTypeOthers;
//				break;
//			case AtdsCalc.TRAINING_SPORT_CYCLING:                    // HRV >     70   maximum    (cyan (Aqua),   Relax)
//				iResId = R.string.sSportTypeCycling;
//				break;
//			case AtdsCalc.TRAINING_SPORT_ROWING:                   // HRV 40 .. 69   high       (purple, Rest)
//				iResId = R.string.sSportTypeRowing;
//				break;
//			case AtdsCalc.TRAINING_SPORT_JOGGING:                 // HRV 10 .. 39   medium     (pink,  Active)
//				iResId = R.string.sSportTypeJogging;
//				break;
//			case AtdsCalc.TRAINING_SPORT_SKATING:                    // HRV  5 .. 9    low        (white, Warm-up Cool-down)
//				iResId = R.string.sSportTypeSkating;
//				break;
//			// HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
//			case AtdsCalc.TRAINING_SPORT_STEPS:                     // HF  > 0.97 * Aerobic Thr. (yellow,  Endurance 1)
//				iResId = R.string.sSportTypeCrossTrainer;
//				break;
//			case AtdsCalc.TRAINING_SPORT_WALKING:                  // HF  > 1.12 * Aerobic Thr. (green,   Endurance 2)
//				iResId = R.string.sSportTypeWalking;
//				break;
//			default:
//				iResId = R.string.sSportTypeOthers;
//				break;
//
//
//		}   // end of: switch (sATDSData.ucState)
//
//		return iResId;
//	}
//}
