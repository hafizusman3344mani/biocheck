import 'package:flutter/cupertino.dart';

class AppValue {
  static double verticalMargin = 70.0;
  static double horizontalMargin = 15.0;
  static double cardHeight = 1.55;

  //SelectLanguage Screen
  static double flagImageSize = 90.0;

  //Welcome Screen
  static EdgeInsets contentPadding =EdgeInsets.symmetric(vertical:0.0,horizontal: 15.0);

  //howrizontal padding resultscreen
  static EdgeInsets contentResultsPadding =EdgeInsets.symmetric(horizontal: 18.0);

  static double bottomBar= 50.0;

  //Login
  static double inputFieldHeight= 50.0;

  //Common
  static double customButtonHeight=45.0;
  static double customButtonRadius=5.0;
  static double commonAppbarHeight=45.0;
  static double commonBottomAppbarHeight=75.0;
  static double dashboardAppbarHeight=50.0;
  static double screenCommonTitleSize=30.0;

static Curve opacityCurve= Curves.ease;
static int opacityDuration = 100;

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
