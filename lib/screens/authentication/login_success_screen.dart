import 'dart:async';

import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/screens/startup/start_info_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginSuccess extends StatefulWidget {
  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess>
    with TickerProviderStateMixin {
  AnimationController _controllerCheckIcon;
  AnimationController _controllerShieldIcon;

  var squareScaleA = 1.0;
  var squareScaleB = 1.0;
  var opacityCheckIcon = 1.0;
  var opacityShield = 1.0;

  double height;

  AlignmentGeometry _alignment = Alignment.center;

  var marginBottom=0.0;

  @override
  void initState() {
    _controllerCheckIcon = Animations.getScaleAnimationController(
      this,
      600,
      7.0,
      0.0,
    );
    _controllerShieldIcon = Animations.getScaleAnimationController(
      this,
      600,
      13.0,
      0.0,
    );

    _controllerCheckIcon.addListener(() {
      setState(() {
        squareScaleA = _controllerCheckIcon.value;
      });
    });

    _controllerShieldIcon.addListener(() {
      setState(() {
        squareScaleB = _controllerShieldIcon.value;
      });
    });

    Timer(Duration(milliseconds: 400), () {
      opacityShield = 0.0;
      if (mounted) {
        _controllerCheckIcon.forward(from: 0.5);
        _controllerShieldIcon.forward(from: 0.5);
      };
    });
    _controllerShieldIcon.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(milliseconds: 500), () {
          opacityCheckIcon = 0.0;
          if (mounted) {
            _controllerCheckIcon.reverse();
          }
        });
      }
    });

      Timer(Duration(milliseconds: 300), () {
        _alignment = Alignment.bottomCenter;
        marginBottom = 65.0;
        setState(() {

        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _controllerCheckIcon.stop(canceled: true);
    _controllerShieldIcon.stop(canceled: true);

    _controllerCheckIcon.dispose();
    _controllerShieldIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: WidgetProps.getAppGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.parrotGreen,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
            ],
          ),
          AnimatedAlign(
            curve: Curves.ease,
            duration: Duration(milliseconds: 800),
            alignment: _alignment,
            onEnd: ()
            {
              height = AppValue.screenHeight(context)/1.25;
              _alignment = Alignment.center;
              setState(() {

              });

              Timer(Duration(milliseconds: 800),(){
                Navigator.pushAndRemoveUntil(
                    Get.context,
                    RoutePage(builder: (BuildContext context) => StartupGuide()),(Route<dynamic> route) => false
                );
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: height??AppValue.screenHeight(context) / AppValue.cardHeight,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  right: AppValue.horizontalMargin,
                  left: AppValue.horizontalMargin),
              child: Material(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AnimatedOpacity(
                      curve: Curves.easeInOutQuint,
                      duration: Duration(milliseconds: 1000),
                      opacity: opacityShield,
                      child: Transform.scale(
                        scale: squareScaleB,
                        child:  GetIcon(
                          height: 30.0,
                          width: 24.0,
                          path: GlobalResources.ic_shield,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      curve: Curves.easeOutQuint,
                      duration: Duration(milliseconds: 1000),
                      opacity: opacityCheckIcon,
                      child: Transform.scale(
                        scale: squareScaleA,
                        child: GetIcon(
                          height: 12.7,
                          width: 12.7,
                          path: GlobalResources.ic_check,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
