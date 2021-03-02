import 'package:biocheck/common/utils/theme_color_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  //Welcome Screen
  static var welcomeTextColor = Color(0xff32394B);
  static const indicatorColor = Color(0xff32394B);
  static var acheivementsTextColor = Color(0xff414141);
  static var noAccTextColor = Color(0xff1C05FF);

//dashboard
  static var dashboardTextColor = welcomeTextColor;
  static var drawerItemTextColor = welcomeTextColor;

  //Common
  static var commonAppbarColor = Color(0xffF7F7F7);
  static var endurance2 = Color(0xff0E065D);
  static var endurance2a = Color(0xff469167);
  static var commonTextColorCronic = Color(0xff414141);
  static const calenderDateTextColor = Color(0xff32394B);
  static const bodyColor = Color(0xffF7F7F7);
  static const themeRedColor = Color(0xffB11918);

  static var parrotGreen = <Color>[
    const Color(0xFF7BF4B1),
    const Color(0xFF69E5A1),
    const Color(0xFF5DDC97),
    const Color(0xFF50D28C),
    const Color(0xFF3DC27C),
  ];

  //chat date font size
  static const chatDataColor = Color(0xff78849E);

  static var redGradien = <Color>[
    const Color(0xFFFC587B),
    const Color(0xFFDE3F53),
    const Color(0xFFCB2F3B),
    const Color(0xFFBA2024),
    const Color(0xFFB11918),
  ];

  static var welcomeButton = <Color>[
    const Color(0xFF6879A2),
    const Color(0xFF5D6C91),
    const Color(0xFF536080),
    const Color(0xFF48536E),
    const Color(0xFF373F53),
  ];

  static var senderBG = <Color>[
    const Color(0xFFCBCED8),
    const Color(0xFFB8BCC7),
    const Color(0xFF989DAA),
    const Color(0xFF7F8494),
    const Color(0xFF616879),
  ];
  static var receiverBG = <Color>[
    const Color(0xFF7CF5B2),
    const Color(0xFF71ECA9),
    const Color(0xFF62E09C),
    const Color(0xFF54D590),
    const Color(0xFF44C882),
  ];

  static var startButtonPopup = <Color>[
    const Color(0xFFF7F7F7),
    const Color(0xFFF7F7F7),
    const Color(0xFFF7F7F7),
  ];

  static var loginButton = <Color>[
    const Color(0xFF79F3AF),
    const Color(0xFF6BE7A3),
    const Color(0xFF5AD995),
    const Color(0xFF4DCF8A),
    const Color(0xFF3DC27C),
  ];

  static var lgStrs = <Color>[
    const Color(0xFFE05700),
    const Color(0xFFC50000),
    const Color(0xFF3DC27C),
    const Color(0xFFB1DE4E),
    const Color(0xFFE6EB38),
    const Color(0xFFFFBC00),
    const Color(0xFFE05700),
    const Color(0xFFC50000),
  ];

  static var normalStrs = <Color>[
    const Color(0xFF43EB38),
    const Color(0xFF76F442),
    const Color(0xFF8EF847),
    const Color(0xFFA1FB4A),
    const Color(0xFFB3FE4E),
  ];
  static var lgStrs1 = <Color>[
    const Color(0xFFFFE11E),
    const Color(0xFFFFCC14),
    const Color(0xFFFFBD0D),
    const Color(0xFFFFB208),
    const Color(0xFFFFA000),
  ];

  static var purpleBlue = <Color>[
    const Color(0xFF5140F6),
    const Color(0xFF4434E1),
    const Color(0xFF392AD0),
    const Color(0xFF2E20BF),
    const Color(0xFF1E11A5),
  ];

  static var lemoneYellow = <Color>[
    const Color(0xFFFBFEA3),
    const Color(0xFFF8FB92),
    const Color(0xFFF3F77B),
    const Color(0xFFEFF364),
    const Color(0xFFE9ED46),
  ];

  //Theme colors


  static var textColorMode = ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff32394B);

  static var welcomeTextColorMode = ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff32394B);
  static var indicatorColorMode =  ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff32394B);
  static var acheivementsTextColorMode = ColorResources.instance.getMode?Color(0xFFFFFFFF) :Color(0xff414141);
  static var noAccTextColorMode =  ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff1C05FF);


  static var featureTextColorMode =ColorResources.instance.getMode?Colors.white: Color(0xff8890A6);
  static var endurance2Mode = ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff0E065D);
  static var endurance2aMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xff469167);
  static var commonTextColorCronicMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xff414141);
  static  var calenderDateTextColorMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xff32394B);
  static var bodyColorMode = ColorResources.instance.getMode?Color(0xFF32394B):Color(0xffF7F7F7);
  static var themeRedColorMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xffB11918);

  static void setProp()
  {
     textColorMode = ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff32394B);

      welcomeTextColorMode = ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff32394B);
    indicatorColorMode =  ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff32394B);
   acheivementsTextColorMode = ColorResources.instance.getMode?Color(0xFFFFFFFF) :Color(0xff414141);
    noAccTextColorMode =  ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff1C05FF);


    featureTextColorMode =ColorResources.instance.getMode?Colors.white: Color(0xff8890A6);
    endurance2Mode = ColorResources.instance.getMode?Color(0xFFFFFFFF):Color(0xff0E065D);
   endurance2aMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xff469167);
    commonTextColorCronicMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xff414141);
    calenderDateTextColorMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xff32394B);
    bodyColorMode = ColorResources.instance.getMode?Color(0xFF32394B):Color(0xffF7F7F7);
    themeRedColorMode =ColorResources.instance.getMode?Color(0xFFFFFFFF): Color(0xffB11918);
  }
}
