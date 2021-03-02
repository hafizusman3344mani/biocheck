import 'dart:async';

import 'package:biocheck/common/ui_widgets/start_screen_background.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/screens/startup/select_language.dart';
import 'package:biocheck/screens/startup/start_info_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  var squareScaleA = 0.5;
  var opacity = 1.0;
  AnimationController _controllerA;
  Widget logo;

  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 6.0,
        duration: Duration(milliseconds: 700));

    Timer(Duration(milliseconds: 400),(){
      _controllerA.forward(from: 0.5);
    });
    _controllerA.addStatusListener((c) {
      if (c == AnimationStatus.dismissed) {
        Timer(
          Duration(milliseconds: 200),
          () {
            Navigator.pushReplacement(
              context,
              RoutePage(builder: (context) => StartupGuide()),
            );
          },
        );
      }
    });
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
        if (squareScaleA == 6.0) {
          squareScaleA = _controllerA.value;
          opacity = 0.0;
          _controllerA.reverse();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen1(
      screenGradient: WidgetProps.getAppGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.redGradien,
      ),
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: opacity,
        child: Transform.scale(
          scale: squareScaleA,
          child: SvgPicture.asset(
            GlobalResources.logoPath,
            width: 48.0,
            height: 48.0,
          ),
        ),
      ),
    );
  }
}
