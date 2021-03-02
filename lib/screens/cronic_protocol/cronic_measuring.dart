import 'dart:async';
import 'dart:convert';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/faded_widget.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/core/tts_controller.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:biocheck/db/repository/rest_measure_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/models/local/rest_measurement_model.dart';
import 'package:biocheck/screens/common/measure_finish.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CronicMeasurement extends StatefulWidget {
  String title;
  Widget heading;

  CronicMeasurement(this.title, this.heading);

  @override
  _CronicMeasurementState createState() => _CronicMeasurementState();
}

class _CronicMeasurementState extends State<CronicMeasurement>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Stream apiStream = ConnectivityPolar.results();
  var restMeasurement = RestMeasure.fromClass();
  var hrController = Get.find<HRController>();
  var pop = false;
  var disposed = false;
  bool isWarmup = true;
  bool isWarmupCompleted = false;
  bool isEnd1 = false;
  bool isEnd2 = false;
  bool isEnd3 = false;
  bool isCoolDown = false;
  String progressText = "Warming up";
  double progress = AppValue.screenWidth(Get.context);
  bool isDone = false;
  bool issteped = false;
  Duration progressDuration = new Duration(minutes: 6);
  AnimationController _controller;
  int mins = 6;
  Widget linearProgress;
  String text = '';

  LinearGradient gradient;
  Color color;

  @override
  void initState() {
    // Timer(Duration(milliseconds: 1200), () {
    //   Get.find<TTSController>().speak(S.of(context).StartTraining);
    // });;
    _controller = new AnimationController(
      duration: Duration(minutes: mins),
      vsync: this,
    );
    gradient = WidgetProps.getAppGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: AppColors.welcomeButton,
    );
    color = AppColors.welcomeTextColor;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pop) {
          return true;
        } else {
          hrController.showExitPopup();
          return false;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size(
              AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: AppLogo(),
          ),
        ),
        body: GetBuilder<HRController>(
          init: hrController,
          builder: (_) {
            return mapData();
          },
        ),
        bottomNavigationBar: BottomBar(
          gradient: WidgetProps.getAppGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.redGradien,
          ),
          childs: [
            Container(
              width: AppValue.screenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavItem2(
                      height: 25.0,
                      width: 18.0,
                      onTap: () {
                        WidgetProps.pushUpToNextPageRelace(
                            context: context,
                            enterPage: MeasureFinish(
                                S.of(context).trainingCan,
                                S.of(context).clickCross,
                                GlobalResources.ic_close,
                                AppColors.redGradien));
                      },
                      icon: GlobalResources.ic_play),
                  Textview2(
                    title: 'C V P',
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),

                  BottomNavItem2(
                      height: 23.0,
                      width: 25.0,
                      onTap: () {
                        WidgetProps.pushUpToNextPageRelace(
                            context: context,
                            enterPage: MeasureFinish(
                                S.of(context).trainingAcc,
                                S.of(context).clickCheck,
                                GlobalResources.ic_check,
                                AppColors.parrotGreen),
                            exitPage: widget);
                      },
                      icon: GlobalResources.ic_stop)
                  // WidgetProps.getLink(
                  //   finished: Constants.REPLACE,
                  //   goTo: MeasureFinish(S.of(context).trainingAcc, S.of(context).clickCheck, GlobalResources.ic_check, AppColors.parrotGreen),
                  //   transition: LinkTransition.PushDown,
                  //   child: GetIcon(
                  //     height: 23.0,
                  //     width: 25.0,
                  //     path: GlobalResources.ic_stop,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getValueWidget(String header, String value) {
    return Flexible(
      flex: 1,
      child: Card(
        elevation: 4.0,
        child: Container(
          height: 90.0,
          width: 105.0,
/*        padding: EdgeInsets.symmetric(horizontal: 10.0),*/
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Textview(header, 14.0, FontWeight.normal,
                  AppColors.welcomeTextColor, TextAlign.center),
              Textview(value, 40.0, FontWeight.w300, AppColors.welcomeTextColor,
                  TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget mapData() {
    if (hrController.snapshot != null) {
      Map dataString = json.decode(hrController.snapshot)["data"];
      if (dataString != null) {
        restMeasurement.heartBeat = dataString["HeartRate"] as int;
        restMeasurement.heartBeatMS1 = dataString["HeartRateMS1"] as int;
        restMeasurement.heartBeatMS2 = dataString["HeartRateMS2"] as int;
        restMeasurement.heartBeatAmp = (dataString["HeartRateAMP"] as double);
        restMeasurement.heartBeatAmp = restMeasurement.heartBeatAmp != null
            ? restMeasurement.heartBeatAmp.toPrecision(1)
            : 0;
        restMeasurement.speed = dataString["CurrentSpeedKmh"] as double;
        restMeasurement.distance = dataString["Distance"] as double;
        restMeasurement.adamFreq = dataString["AdemFreq"] as int;
        restMeasurement.breathFreq = dataString["BreathFreq"] as int;
        restMeasurement.stress = dataString["stress"] as int;
        restMeasurement.progressAT = dataString["progressAT"] as int;
        restMeasurement.stateAT = dataString["stateAT"] as int;
      }
    }
    range(restMeasurement.heartBeat);
    setText();
    // if (issteped) {
    //   issteped = false;
    //   if (isWarmup) {
    //     mins = 20;
    //     _controller = new AnimationController(
    //       duration: Duration(minutes: mins),
    //       vsync: this,
    //     );
    //     isWarmup = false;
    //     isEnd2 = true;
    //     progressText = "Endurance2";
    //     timer = getTimer1();
    //     linearProgress = LinearProgressIndicator(
    //       value: _controller.value,
    //       backgroundColor: Colors.transparent,
    //       valueColor:
    //           AlwaysStoppedAnimation<Color>(AppColors.dashboardTextColor),
    //     );
    //     _controller.reverse(from: 1.0);
    //   } else if (isEnd2) {
    //     isEnd2 = false;
    //     isEnd3 = true;
    //     timer = getTimer();
    //     progressText = "Endurance3";
    //   } else if (isEnd3) {
    //     isEnd3 = false;
    //     isCoolDown = true;
    //     timer = getTimer();
    //     progressText = "Cooling down";
    //   } else if (isCoolDown) {
    //     isCoolDown = false;
    //   } else {}
    // }
    return Container(
      margin: AppValue.contentResultsPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (isWarmup) warmingup(),
          if (isEnd2) end2(),
          if (isEnd3) end3(),
          if (isCoolDown) coolDown(),
          Container(
            child: Textview(text, 30.0, FontWeight.w300,
                AppColors.welcomeTextColor, TextAlign.center),
          ),
          Container(
            width: AppValue.screenWidth(context),
            height: 80.0,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 3000),
                  height: 80.0,
                  width: AppValue.screenWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    gradient: gradient,
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 3000),
                  alignment: Alignment.centerLeft,
                  height: 80.0,
                  width: progress,
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: AppColors.dashboardTextColor, width: 2.0)),

                    /*borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(3.0),
                                topLeft: Radius.circular(3.0)),*/
                    color: color,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Textview(progressText, 24.0, FontWeight.w900,
                      Colors.white, TextAlign.center),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getValueWidget(
                  S.of(context).heartbeatTitle,
                  restMeasurement.heartBeat != null
                      ? restMeasurement.heartBeat.toString()
                      : "0",
                ),
                getValueWidget(
                  S.of(context).ampTitle,
                  restMeasurement.heartBeatAmp != null
                      ? restMeasurement.heartBeatAmp.toString()
                      : "0",
                ),
                getValueWidget(
                  S.of(context).BreathfreqTitle + 'p/m',
                  restMeasurement.breathFreq != null
                      ? restMeasurement.breathFreq.toString()
                      : "0",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getValueWidget(
                  S.of(context).audioSettingsDistance,
                  restMeasurement.distance != null
                      ? restMeasurement.distance.toString()
                      : "0",
                ),
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                getValueWidget(
                  S.of(context).audioSettingsSpeed + ' km/h',
                  restMeasurement.speed != null
                      ? restMeasurement.speed.toString()
                      : "0",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  completeMeasurement() async {
    pop = true;
    disposed = true;
    WidgetProps.pushUpToNextPageRelace(
        context: context,
        enterPage: MeasureFinish(
            S.of(context).trainingCan,
            S.of(context).clickCross,
            GlobalResources.ic_close,
            AppColors.redGradien));
  }

  Widget warmingup() {
    if (!issteped) {
      issteped = true;
      _controller.reverse(from: 1.0);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: getWarmupTimer(),
            ),
          ],
        ),
        Container(
          height: 20.0,
          width: AppValue.screenWidth(Get.context),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dashboardTextColor),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          child: LinearProgressIndicator(
            value: _controller.value,
            backgroundColor: Colors.transparent,
            valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.dashboardTextColor),
          ),
        ),
      ],
    );
  }

  Widget end2() {
    if (!issteped) {
      issteped = true;
      progressText = "Endurance 2";
      _controller.reverse(from: 1.0);
      color = AppColors.endurance2a;
      gradient = WidgetProps.getAppGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.parrotGreen,
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: new CountdownFormatted(
                duration: progressDuration,
                onFinish: () {
                  issteped = false;
                  isEnd2 = false;
                  isEnd3 = true;
                  _controller = new AnimationController(
                    duration: Duration(minutes: 6),
                    vsync: this,
                  );
                },
                builder: (BuildContext ctx, String re) {
                  print(re);
                  // if (!isTimeStarted) {
                  //   waves = 0.0;
                  //   isTimeStarted = true;
                  // }
                  // if (waves == null) {
                  //   waves = AppValue.screenWidth(context);
                  // }
                  //
                  //changeTimeSlide(remaining);
                  // controller.updateAnimated();

                  return Textview(
                      S.of(context).timeInZone + re,
                      30.0,
                      FontWeight.normal,
                      AppColors.welcomeTextColor,
                      TextAlign.center); // 01:00:00
                },
              ),
            ),
          ],
        ),
        Container(
          height: 20.0,
          width: AppValue.screenWidth(Get.context),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dashboardTextColor),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          child: LinearProgressIndicator(
            value: _controller.value,
            backgroundColor: Colors.transparent,
            valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.dashboardTextColor),
          ),
        ),
      ],
    );
  }

  Widget end3() {
    if (!issteped) {
      issteped = true;
      progressText = "Endurance 3";
      _controller.reverse(from: 1.0);
      color = AppColors.noAccTextColor;
      gradient = WidgetProps.getAppGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.purpleBlue,
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: getTimerEnd3(),
            ),
          ],
        ),
        Container(
          height: 20.0,
          width: AppValue.screenWidth(Get.context),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dashboardTextColor),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          child: LinearProgressIndicator(
            value: _controller.value,
            backgroundColor: Colors.transparent,
            valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.dashboardTextColor),
          ),
        ),
      ],
    );
  }

  Widget coolDown() {
    if (!issteped) {
      issteped = true;
      progressText = "Cooling down";
      _controller.reverse(from: 1.0);
      gradient = WidgetProps.getAppGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.welcomeButton,
      );
      color = AppColors.welcomeTextColor;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: new CountdownFormatted(
                duration: progressDuration,
                onFinish: () {
                  issteped = false;
                  isEnd2 = false;
                  isEnd3 = true;
                  _controller = new AnimationController(
                    duration: Duration(minutes: 6),
                    vsync: this,
                  );
                },
                builder: (BuildContext ctx, String re) {
                  print(re);
                  // if (!isTimeStarted) {
                  //   waves = 0.0;
                  //   isTimeStarted = true;
                  // }
                  // if (waves == null) {
                  //   waves = AppValue.screenWidth(context);
                  // }
                  //
                  //changeTimeSlide(remaining);
                  // controller.updateAnimated();

                  return Textview(
                      S.of(context).timeInZone + re,
                      30.0,
                      FontWeight.normal,
                      AppColors.welcomeTextColor,
                      TextAlign.center); // 01:00:00
                },
              ),
            ),
          ],
        ),
        Container(
          height: 20.0,
          width: AppValue.screenWidth(Get.context),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dashboardTextColor),
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          child: LinearProgressIndicator(
            value: _controller.value,
            backgroundColor: Colors.transparent,
            valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.dashboardTextColor),
          ),
        ),
      ],
    );
  }

  Widget getWarmupTimer() {
    return CountdownFormatted(
      duration: progressDuration,
      onFinish: () {
        issteped = false;
        isWarmup = false;
        isEnd2 = true;
        progressDuration =Duration(minutes: 20);
        _controller = new AnimationController(
          duration: Duration(minutes: 20),
          vsync: this,
        );
      },
      builder: (BuildContext ctx, String remaining) {
        print(remaining);
        // if (!isTimeStarted) {
        //   waves = 0.0;
        //   isTimeStarted = true;
        // }
        // if (waves == null) {
        //   waves = AppValue.screenWidth(context);
        // }
        //
        //changeTimeSlide(remaining);
        // controller.updateAnimated();

        return Textview(
            S.of(context).timeInZone + remaining,
            30.0,
            FontWeight.normal,
            AppColors.welcomeTextColor,
            TextAlign.center); // 01:00:00
      },
    );
  }

  Widget getTimerEnd3() {
    return new CountdownFormatted(
      duration:progressDuration,
      onFinish: () {
        issteped = false;
        isEnd3 = false;
        isCoolDown = true;
        progressDuration =Duration(minutes: 6);
        _controller = new AnimationController(
          duration: Duration(minutes: 6),
          vsync: this,
        );
      },
      builder: (BuildContext ctx, String remaining) {
        print(remaining);
        // if (!isTimeStarted) {
        //   waves = 0.0;
        //   isTimeStarted = true;
        // }
        // if (waves == null) {
        //   waves = AppValue.screenWidth(context);
        // }
        //
        //changeTimeSlide(remaining);
        // controller.updateAnimated();

        return Textview(
            S.of(context).timeInZone + remaining,
            30.0,
            FontWeight.normal,
            AppColors.welcomeTextColor,
            TextAlign.center); // 01:00:00
      },
    );
  }

  Widget range(int val) {
    if (val != null) {
      if (val >= 50 && val <= 60) {
        progress = AppValue.screenWidth(context) * 0.2;
      } else if (val >= 61 && val <= 70) {
        progress = AppValue.screenWidth(context) * 0.4;
      } else if (val >= 71 && val <= 80) {
        progress = AppValue.screenWidth(context) * 0.6;
      } else if (val >= 81 && val <= 90) {
        progress = AppValue.screenWidth(context) * 0.8;
      } else if (val >= 91 && val <= 100) {
        progress = AppValue.screenWidth(context) * 0.8;
      } else if (val >= 101 && val <= 110) {
        progress = AppValue.screenWidth(context) * 0.9;
      } else {
        progress = AppValue.screenWidth(context);
      }
    }
    return Container();
  }

  setText() {
    //   "Week7": [{
    // "Endurance": 0,
    // "Time": 0
    // },{
    // "Endurance": 6,
    // "Time": 20
    // },{
    // "Endurance": 7,
    // "Time": 6
    // }],
    if (restMeasurement.heartBeatAmp != null){
      if(restMeasurement.stateAT!=null) {
        if (isWarmup) {
          if (restMeasurement.heartBeatAmp == 0) {
            text = "You are going too slow";
          } else if (restMeasurement.heartBeatAmp > Constants.HRV_BEGIN_MAX) {
            text = "You are going too slow";
          } else if ((restMeasurement.heartBeatAmp <
              (Constants.HRV_BEGIN_LOW + 2.5)) ||
              restMeasurement.stateAT > Constants.HRV_WUPCDN) {
            text = "You are going too fast";
          } else {
            text = "This is good";
          }

//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                }
//                else if(aAtdsCalc.Atds_getAmplitude() > aAtdsCalc.HRV_BEGIN_MAX) // relax.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//
//                }
//                else if((aAtdsCalc.Atds_getAmplitude() < (aAtdsCalc.HRV_BEGIN_LOW + 2.5)) || (aAtdsCalc.Atds_getAtdsState() > AtdsCalc.HRV_WUPCDN)) // if the athlete go to fast give a warning.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//
//                }
//                else // the athlete is going ok.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                }
        } else if (isEnd1) {} else if (isEnd2) {
          if (restMeasurement.stateAT == 6) {
            text = "This is good";
          } else if (restMeasurement.stateAT > 6) {
            text = "You are going too fast";
          } else {
            text = "You are going too slow";
          }
        } else if (isEnd3) {
          if (restMeasurement.stateAT == 7) {
            text = "This is good";
          } else if (restMeasurement.stateAT > 7) {
            text = "You are going too fast";
          } else {
            text = "You are going too slow";
          }
        } else if (isCoolDown) {
          if ((restMeasurement.stateAT >= Constants.HF_END1) ||
              (restMeasurement.heartBeatAmp <
                  (Constants.HRV_BEGIN_LOW + 2.5))) {
            text = "You are going too fast";
          } else if (restMeasurement.stateAT > Constants.HRV_BEGIN_MAX) {
            text = "You are going too slow";
          } else {
            text = "This is good";
          }
        }
      }
//                    (aAtdsCalc.Atds_getAmplitude() < (aAtdsCalc.HRV_BEGIN_LOW + 2.5)))// the athlete go to slo. Below warming up cooling down level.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToFast);
//                }
//                else if(aAtdsCalc.Atds_getAmplitude() > aAtdsCalc.HRV_BEGIN_MAX)
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_ToSlow);
//                }
//                else // the athlete is going ok.
//                {
//                    sTrainingStatus = mContext.getResources().getString(R.string.s_chro_State_Good);
//                }
//

    }
  }
}
