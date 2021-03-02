package com.tekdhaba.biocheck;

public class DataTypes {

   public static int SCAN = 1;
   public static int CONNECT = 2;
   public static int DISCONNECT = 3;
   public static int POWERON = 4;
   public static int POWEROFF = 5;
   public static int HR = 6;

   public static int REST = 0;
   public static int CVP = 1;


   public static final int TRAINING_REST = 2;
   public static final int TRAINING_EXERCISE = 3;
   public static final int TRAINING_AT_TEST_RUN = 4;
   public static final int TRAINING_AT_TEST_BICYCLE = 5;
   public static final int TRAINING_TYPE_CHRON_VERM = 6;
   public static final int TRAINING_TYPE_AT_TRAINING = 7;
   public static final int TRAINING_REST_FREE = 8;


   public static final int TRAINING_SPORT_NONE = 0;
   public static final int TRAINING_SPORT_CYCLING = 1;
   public static final int TRAINING_SPORT_ROWING = 2;
   public static final int TRAINING_SPORT_JOGGING = 3;
   public static final int TRAINING_SPORT_SKATING = 4;
   public static final int TRAINING_SPORT_STEPS = 5;
   public static final int TRAINING_SPORT_WALKING = 6;




private final static int HRVHF_UNKNOWN   = 0;        // Neutral, no value known or not implemented (yet)
   private final static int HRV_MAX         = 1;        // HRV >     70   maximum    (cyan,   Relax)
   private final static int HRV_HIGH        = 2;        // HRV 40 .. 69   high       (purple, Rest)
   private final static int HRV_MEDIUM      = 3;        // HRV 10 .. 39   medium     (white,  Active)
   private final static int HRV_LOW         = 4;        // HRV  5 .. 9    low        (yellow, Warm-up Cool-down)
   // HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
   private final static int HF_LOW          = 5;        // HF  > 0.97 * Aerobic Thr. (green,  Endurance 1)
   private final static int HF_MEDIUM       = 6;        // HF  > 1.12 * Aerobic Thr. (blue,   Endurance 2)
   private final static int HF_HIGH         = 7;        // HF  > 1.25 * Aerobic Thr. (orange, Endurance 3)
   private final static int HF_INTENS       = 8;        // HF  > 1.40 * Aerobic Thr. (red,    Intensive)
   private final static int HF_INTENS2      = 9;        // HF  > 1.40 * AT + 10      (red,    Intense-2)

   // Exposed to be used by BlueRobin.c display function
   public final static int HRVHF_NONE 		= HRVHF_UNKNOWN;
   public final static int HRV_RELAX 		= HRV_MAX;
   public final static int HRV_REST 		= HRV_HIGH;
   public final static int HRV_ACTIVE 		= HRV_MEDIUM;
   public final static int HRV_WUPCDN 		= HRV_LOW;

   // HRV < 5, HF Aerobic Threshold equals 1.00 * HF
   public final static int HF_END1 		= HF_LOW;
   public final static int HF_END2 		= HF_MEDIUM;
   public final static int HF_END3 		= HF_HIGH;
   public final static int HF_INTENSE 		= HF_INTENS;
   public final static int HF_INTENSE2 	= HF_INTENS2;
public final int HRV_VALUE_LIMIT 	= 99; 	// MAX variance change in one step
   public final int HRV_END_MAX 		= 10; 	// HRV end MAX range
   public final int HRV_BEGIN_MAX 		= 70; 	// HRV begin MAX range
   public final int HRV_BEGIN_HIGH 	= 40; 	// HRV begin HIGH range
   public final int HRV_BEGIN_MEDIUM 	= 10; 	// HRV begin medium range
   public final int HRV_BEGIN_LOW 		= 5; 	// HRV begin low range

}
