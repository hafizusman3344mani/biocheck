import 'package:flutter/material.dart';

import 'ui_widgets/custom_curves.dart';

class Constants
{
  static const BASE_URL ="https://mijn.biocheck.nl/api/v1/";
  static String appLocale ="Locale";
  static const int DATABASE_VERSION= 1;


  static const int POLARTYPE = 1;
  static const int SIGMATYPE = 2;

  static int SCAN = 1;
  static int CONNECT = 2;
  static int DISCONNECT = 3;
  static int POWERON = 4;
  static int POWEROFF = 5;
  static int HR = 6;


  static int REST = 0;
  static int CVP = 1;


  static int CRONIC_PROTOCOL= 1;
  static int FREE_TRAINING= 2;


  static int pushuptime = 250;
    static int pushTime= 500;

  static Curve backout = BackOutCurve();


  static int NONE = 0;
  static int REPLACE = 1;
  static int ALL = 2;

  //
  static int DARK = 0;
  static int FOCUS = 1;

  static String EN="en";
  static String BG="bg";
  static String FR="fr";
  static String NL="nl";



  static String RESLUT_HEART_BEAT="hbr";


  static int HRV_VALUE_LIMIT 	= 99; 	// MAX variance change in one step
  static int HRV_END_MAX 		= 10; 	// HRV end MAX range
  static int HRV_BEGIN_MAX 		= 70; 	// HRV begin MAX range
  static int HRV_BEGIN_HIGH 	= 40; 	// HRV begin HIGH range
  static int HRV_BEGIN_MEDIUM 	= 10; 	// HRV begin medium range
  static int HRV_BEGIN_LOW 		= 5;

   static int HRVHF_NONE 		= HRVHF_UNKNOWN;
 static int HRV_RELAX 		= HRV_MAX;
  static int HRV_REST 		= HRV_HIGH;
  static int HRV_ACTIVE 		= HRV_MEDIUM;
  static int HRV_WUPCDN 		= HRV_LOW;

 static int HRVHF_UNKNOWN   = 0;        // Neutral, no value known or not implemented (yet)
   static int HRV_MAX         = 1;        // HRV >     70   maximum    (cyan,   Relax)
  static int HRV_HIGH        = 2;        // HRV 40 .. 69   high       (purple, Rest)
 static int HRV_MEDIUM      = 3;        // HRV 10 .. 39   medium     (white,  Active)
  static int HRV_LOW         = 4;

  // HRV  5 .. 9    low        (yellow, Warm-up Cool-down)
  // HRV < 5,  HF Aerobic Threshold equals 1.00 * HF
  static int HF_LOW          = 5;        // HF  > 0.97 * Aerobic Thr. (green,  Endurance 1)
  static int HF_MEDIUM       = 6;        // HF  > 1.12 * Aerobic Thr. (blue,   Endurance 2)
  static int HF_HIGH         = 7;        // HF  > 1.25 * Aerobic Thr. (orange, Endurance 3)
  static int HF_INTENS       = 8;        // HF  > 1.40 * Aerobic Thr. (red,    Intensive)
  static int HF_INTENS2      = 9;        // HF  > 1.40 * AT + 10      (red,    Intense-2)

  // Exposed to be used by BlueRobin.c display function


  // HRV < 5, HF Aerobic Threshold equals 1.00 * HF
   static int HF_END1 		= HF_LOW;
   static int HF_END2 		= HF_MEDIUM;
   static int HF_END3 		= HF_HIGH;
   static int HF_INTENSE 		= HF_INTENS;
   static int HF_INTENSE2 	= HF_INTENS2;

}