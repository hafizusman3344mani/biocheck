import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/counter/slide_countdown_clock.dart';
import 'package:biocheck/common/ui_widgets/counter/slide_direction.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CounterWithWigetToGo extends StatefulWidget {
  Widget next;
  int pageTitle;

  CounterWithWigetToGo(this.next, this.pageTitle);

  @override
  _CounterWithWigetToGoState createState() => _CounterWithWigetToGoState();
}

class _CounterWithWigetToGoState extends State<CounterWithWigetToGo> with TickerProviderStateMixin{
  double font = 120.0;

  var squareScaleA = 1.0;
  AnimationController _controllerA;
  var hrController = Get.find<HRController>();
  double opacity=1.0;
  @override
  void initState() {
    hrController.mType=Constants.CVP;
    hrController.connectAndFetchHeartRate();
    _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.4,
        upperBound: 1.0,
        duration: Duration(seconds: 5));
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
       // opacity =squareScaleA;
      });
    });

    Timer(Duration(milliseconds: 500), () {
      //setState(() {
      _controllerA.reverse(from: 1.0);
      opacity=0.0;
     // });
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
    return Scaffold(
      body:Transform.scale(
        scale: squareScaleA,
        child: AnimatedOpacity(
          opacity: opacity,
          curve: Curves.easeOut,
          duration: Duration(milliseconds:5200),
          child:  Center(
              child: Container(
                height: 130.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // AnimatedDefaultTextStyle(
                    //   curve: Curves.easeOut,
                    //   duration: Duration(milliseconds: 2000),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(right: 10.0),
                    //     child: Text(
                    //       "0",
                    //     ),
                    //   ),
                    //   style: TextStyle(
                    //     color: AppColors.dashboardTextColor,
                    //     fontSize: font,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),
                    AnimatedDefaultTextStyle(
                      curve: Curves.easeOut,
                      duration: Duration(milliseconds: 1500),
                      child: SlideCountdownClock(
                        duration:
                            Duration(days: 0, minutes: 0, hours: 0, seconds: 5),
                        slideDirection: SlideDirection.Down,
                        separator: ":",
                        textStyle: TextStyle(
                          color: AppColors.dashboardTextColor,
                          fontSize: font,
                          fontWeight: FontWeight.w900,
                        ),
                        shouldShowDays: true,
                        onDone: () {
                          Navigator.pushReplacement(
                              context,
                              RoutePage(
                                builder: (context) => widget.next,
                              ));
                        },
                      ),
                      style: TextStyle(
                        color: AppColors.dashboardTextColor,
                        fontSize: font,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
            ),

        ),
      ),
    );
  }
}
