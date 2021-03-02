import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/sinewave/wave.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/sine_loader.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/core/tts_controller.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:biocheck/db/entities/rest_measure_entity.dart';
import 'package:biocheck/db/repository/rest_measure_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/models/local/rest_measurement_model.dart';
import 'package:biocheck/screens/common/questionnaire.dart';
import 'package:biocheck/screens/free_measuring/free_measuring_noti.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscilloscope/oscilloscope.dart';

import 'rest_measure_detail.dart';

class RestMeasureent extends StatefulWidget {
  String title;

  RestMeasureent(this.title);

  @override
  _RestMeasureCalculationState createState() => _RestMeasureCalculationState();
}

class _RestMeasureCalculationState extends State<RestMeasureent>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController _controller;
  double marginLeft = 130.0;
  double marginRight = 0.0;
  double waves;
  String stress;
  var amp1 = 13.5;
  var amp2 = 15.5;
  var tts = Get.put(TTSController());
  Alignment align = Alignment.center;
  var restMeasurement = RestMeasure.fromClass();
  var speed = 0.05;
  var pop = false;

//  Stream apiStream = ConnectivityPolar.results();

  bool connection = false;
  bool location = false;
  int startTime = DateTime.now().millisecondsSinceEpoch;
  int endTime = 0;
  String rem = "06:00";
  String stressLevel = "";
  String title;

  int percStressRelax = 0;
  int percStressNormal = 0;
  int percStressLow = 0;
  int percStressHeavy = 0;

  int percStressRelax1 = 0;
  int percStressNormal1 = 0;
  int percStressLow1 = 0;
  int percStressHeavy1 = 0;
  var disposed = false;
  var isFinished = false;
  var isTimeStarted = false;
  var duration = Duration(minutes: 6);

  Stopwatch stopwatchRelax = new Stopwatch();
  Stopwatch stopwatchNormal = new Stopwatch();
  Stopwatch stopwatchLow = new Stopwatch();
  Stopwatch stopwatchHeavy = new Stopwatch();
  var hrController = Get.find<HRController>();

  bool run1 = true;
  bool run2 = false;
  bool run3 = false;
  bool run4 = false;
  var o1 = 1.0;
  var o2 = 0.0;
  var o3 = 0.0;
  var o4 = 0.0;

  int val = 0;
  String fMS = '';
  String sMS = '';
  String tMS = '';

  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;

  List<double> traceSine = List();
  List<double> traceCosine = List();
  double radians = 0.0;
  Timer _timer;
  Oscilloscope scopeTwo;

  List<int> dataaaa;
  int hr = 0;

  var svgSpeed = 2000;

  //thod to generate a Test  Wave Pattern Sets
  /// this gives us a value between +1  & -1 for sine & cosine
  _generateTrace(Timer t) {
    // generate our  values
    var sv = sin((radians * pi));
    var cv = cos((radians * pi));

    // Add to the growing dataset
    setState(() {
      traceSine.add(sv);
      traceCosine.add(cv);
    });

    // adjust to recyle the radian value ( as 0 = 2Pi RADS)
    radians += 0.05;
    if (radians >= 2.0) {
      radians = 0.0;
    }
  }

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(minutes: 6),
      vsync: this,
    );
    _controller.reverse(from: 1.0);
    hrController.hrList = [];
    hrController.ampList = [];
    hrController.adamList = [];
    hrController.isPop = false;
    Timer(Duration(milliseconds: 1900), () {
      title = S.of(context).FreeMeasure;
      setState(() {
        //marginRight = 0.0;
        //marginLeft = 0.0;
        stress = "Checking";
      });
      tts.speak(S.of(context).StartTraining);
    });
    checkConnection();
    //_timer = Timer.periodic(Duration(milliseconds: 60), _generateTrace);

    // hrController.characteristic.value.listen((event) {
    //
    //   print(event);
    // });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    //_timer.cancel();
    hrController.sub.cancel();
    hrController.subStreamBluetooth.cancel();
    hrController.characteristic.setNotifyValue(false);
    hrController.currentDevice.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scopeTwo = Oscilloscope(
      showYAxis: false,
      yAxisColor: Colors.transparent,
      padding: 20.0,
      backgroundColor: Colors.transparent,
      traceColor: Colors.black,
      yAxisMax: 1.0,
      yAxisMin: -1.0,
      dataSet: traceCosine,
    );

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
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size(
                AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: AppLogo(),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      await completeMeasurement();
                    },
                    child: GetIcon(
                      width: 25.0,
                      height: 18.0,
                      color: AppColors.themeRedColor,
                      path: GlobalResources.ic_close,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: GetBuilder<HRController>(
            init: hrController,
            builder: (_) {
              return mapData();
            },
          ),

          /// body:mapData(),
          bottomNavigationBar: BottomBar(
            gradient: WidgetProps.getAppGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.redGradien,
            ),
            childs: [
              Container(
                width: AppValue.screenWidth(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Textview2(
                      title: widget.title,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 21.0,
                      letterSpacing: 2.5,
                    ),
                    /*  widget.title, 21, FontWeight.w300,
                      Colors.white, TextAlign.center),*/
                    Container(
                      padding: EdgeInsets.only(right: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          WidgetProps.goToNextPage(
                            context,
                            RestMeasureDetail(),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GetIcon(
                            path: GlobalResources.ic_info,
                            height: 23.0,
                            width: 23.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  var cutOffYValue = 0.0;
  var yearTextStyle = TextStyle(fontSize: 12, color: Colors.black);

  Widget mapData() {
    print(hrController.HeartRate);
    if (hrController.snapshot != null) {
      Map dataString = json.decode(hrController.snapshot)["data"];
      if (dataString != null) {
        restMeasurement.heartBeat = dataString["HeartRate"] as int;
        restMeasurement.heartBeatMS1 = dataString["HeartRateMS1"] as int;
        restMeasurement.heartBeatMS2 = dataString["HeartRateMS2"] as int;
        restMeasurement.heartBeatAmp = dataString["HeartRateAMP"] as double;

        restMeasurement.heartBeatAmp = restMeasurement.heartBeatAmp != null
            ? restMeasurement.heartBeatAmp.toPrecision(1)
            : 0;
        //restMeasurement.heartBeatAmp = 96.1;
        //  restMeasurement.heartBeatAmp = 90.2;
        restMeasurement.adamFreq = dataString["AdemFreq"] as int;
        restMeasurement.breathFreq = dataString["BreathFreq"] as int;
        restMeasurement.stress = dataString["stress"] as int;
        hrController.hrList.add(restMeasurement.heartBeat);
        hrController.ampList.add(restMeasurement.heartBeatAmp);
        hrController.adamList.add(restMeasurement.breathFreq);

        // var s =(2*pi)*restMeasurement.adamFreq;
        // var k = (2*pi)/(2/3);
        // var t =3*pi*restMeasurement.heartBeatMS1;
        // var cv =  0.5*sin(((9*pi) - t));
        // var cv = sin((radians * restMeasurement.adamFreq/1000));
        // var cv = cos((((restMeasurement.adamFreq *pi
        // )/restMeasurement.heartBeatMS1)));

        var sv = sin((radians * pi));
        var cv = cos(radians * (restMeasurement.breathFreq) / pi);
        print(cv);
        // Add to the growing dataset

        // adjust to recyle the radian value ( as 0 = 2Pi RADS)
        radians += 0.05;
        if (radians >= 2.0) {
          radians = 0.0;
        }
        // print(cv);
        //print('Breath Value ====> ' + restMeasurement.breathFreq.toString());
        //print('Adam Value ====> ' + restMeasurement.adamFreq.toString());

        // Add to the growing dataset
        traceCosine.add(cv);

        // adjust to recyle the radian value ( as 0 = 2Pi RADS)

        setMS(restMeasurement.heartBeatMS1);

        hrController.hr.value = restMeasurement;
        amp1 = amp1 + 10;
        amp2 = amp2 + 10;
        if (restMeasurement.heartBeatAmp != null) {
          if (restMeasurement.heartBeatAmp >= 0 &&
              restMeasurement.heartBeatAmp <= 9) {
            stress = S.of(context).stress2Title;
            stopwatchHeavy.start();
            stopwatchRelax.stop();
            stopwatchLow.stop();
            stopwatchNormal.stop();
            align = Alignment.centerLeft;
            if (restMeasurement.heartBeatAmp >= 0 &&
                restMeasurement.heartBeatAmp <= 3.0) {
              marginRight = 0.0;
              marginLeft = 10.0;
            } else if (restMeasurement.heartBeatAmp > 3.0 &&
                restMeasurement.heartBeatAmp <= 6.0) {
              marginRight = 0.0;
              marginLeft = 20.0;
            } else if (restMeasurement.heartBeatAmp > 6.0 &&
                restMeasurement.heartBeatAmp <= 8.0) {
              marginRight = 0.0;
              marginLeft = 30.0;
            } else if (restMeasurement.heartBeatAmp > 8.0 &&
                restMeasurement.heartBeatAmp <= 9.0) {
              marginRight = 0.0;
              marginLeft = 50.0;
            }
          } else if (restMeasurement.heartBeatAmp > 9.0 &&
              restMeasurement.heartBeatAmp <= 39) {
            stress = S.of(context).stress1Title;
            stopwatchHeavy.stop();
            stopwatchRelax.stop();
            stopwatchLow.start();
            stopwatchNormal.stop();
            align = Alignment.center;

            if (restMeasurement.heartBeatAmp > 9.0 &&
                restMeasurement.heartBeatAmp <= 15.0) {
              marginRight = 240.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 15.0 &&
                restMeasurement.heartBeatAmp <= 19.0) {
              marginRight = 190.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 19.0 &&
                restMeasurement.heartBeatAmp <= 22.0) {
              marginRight = 165.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 22.0 &&
                restMeasurement.heartBeatAmp <= 27.0) {
              marginRight = 130.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 27.0 &&
                restMeasurement.heartBeatAmp <= 35.0) {
              marginRight = 90.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 35.0 &&
                restMeasurement.heartBeatAmp <= 39.0) {
              marginRight = 20.0;
              marginLeft = 0.0;
            }
          } else if (restMeasurement.heartBeatAmp > 39.0 &&
              restMeasurement.heartBeatAmp <= 69.0) {
            stress = S.of(context).normalTitle;
            stopwatchHeavy.stop();
            stopwatchRelax.stop();
            stopwatchLow.stop();
            stopwatchNormal.start();
            align = Alignment.center;
            if (restMeasurement.heartBeatAmp > 39.0 &&
                restMeasurement.heartBeatAmp <= 45.0) {
              marginRight = 0.0;
              marginLeft = 20.0;
            } else if (restMeasurement.heartBeatAmp > 45.0 &&
                restMeasurement.heartBeatAmp <= 51.0) {
              marginRight = 0.0;
              marginLeft = 40.0;
            } else if (restMeasurement.heartBeatAmp > 51.0 &&
                restMeasurement.heartBeatAmp <= 58.0) {
              marginRight = 0.0;
              marginLeft = 60.0;
            } else if (restMeasurement.heartBeatAmp > 58.0 &&
                restMeasurement.heartBeatAmp <= 64.0) {
              marginRight = 0.0;
              marginLeft = 80.0;
            } else if (restMeasurement.heartBeatAmp > 64.0 &&
                restMeasurement.heartBeatAmp <= 69.0) {
              marginRight = 0.0;
              marginLeft = 90.0;
            }
          } else {
            align = Alignment.centerRight;
            stress = S.of(context).relaxTitle;
            stopwatchHeavy.stop();
            stopwatchRelax.start();
            stopwatchLow.stop();
            stopwatchNormal.stop();

            if (restMeasurement.heartBeatAmp > 69.0 &&
                restMeasurement.heartBeatAmp <= 75.0) {
              marginRight = 75.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 75.0 &&
                restMeasurement.heartBeatAmp <= 80.0) {
              marginRight = 65.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 80.0 &&
                restMeasurement.heartBeatAmp <= 85.0) {
              marginRight = 60.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 85.0 &&
                restMeasurement.heartBeatAmp <= 91.0) {
              marginRight = 45.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 91.0 &&
                restMeasurement.heartBeatAmp <= 95.0) {
              marginRight = 36.0;
              marginLeft = 0.0;
            } else if (restMeasurement.heartBeatAmp > 95.0 &&
                restMeasurement.heartBeatAmp <= 98.0) {
              marginRight = 34.0;
              marginLeft = 0.0;
            } else {
              marginRight = 0.0;
              marginLeft = 0.0;
            }
          }
        }
      }
    }

    if (restMeasurement.heartBeat > 85) {
      svgSpeed = 500;
    } else if (restMeasurement.heartBeat > 75 &&
        restMeasurement.heartBeat <= 85) {
      svgSpeed = 1300;
    } else if (restMeasurement.heartBeat > 60 &&
        restMeasurement.heartBeat <= 75) {
      svgSpeed = 2000;
    }else
      {
        svgSpeed = 3000;
      }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 110.0,
            child: scopeTwo,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.0),
                        topLeft: Radius.circular(3.0)),
                    elevation: 4.0,
                    child: Container(
                      height: 57.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Textview(
                              S.of(context).timeTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                          getTimer(Duration(minutes: 6))
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 360000),
                      height: 16.0,
                      width: waves ?? AppValue.screenWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(3.0),
                            bottomLeft: Radius.circular(3.0)),
                        // gradient: WidgetProps.getAppGradient(
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        //   colors: AppColors.welcomeButton,
                        // ),
                      ),
                      child: LinearProgressIndicator(
                        value: _controller.value,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.dashboardTextColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.0),
                        topLeft: Radius.circular(3.0)),
                    elevation: 4.0,
                    child: Container(
                      height: 57.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Textview(
                              S.of(context).heartbeatTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                          Textview(
                              restMeasurement.heartBeat.isNull
                                  ? "0"
                                  : restMeasurement.heartBeat.toString(),
                              30.0,
                              FontWeight.normal,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.0),
                        topLeft: Radius.circular(3.0)),
                    elevation: 4.0,
                    child: Container(
                      height: 57.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Textview(
                              S.of(context).ampTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                          Textview(
                              restMeasurement.heartBeatAmp != null
                                  ? restMeasurement.heartBeatAmp
                                      .round()
                                      .toString()
                                  : "0",
                              30.0,
                              FontWeight.normal,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.0),
                        topLeft: Radius.circular(3.0)),
                    elevation: 4.0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 2500),
                      height: 57.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Textview(
                              stress ?? S.of(context).lgstrsTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                          Textview('', 30.0, FontWeight.normal,
                              AppColors.welcomeTextColor, TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 1500),
                          height: 16.0,
                          width: AppValue.screenWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(3.0),
                                bottomLeft: Radius.circular(3.0)),
                            gradient: WidgetProps.getAppGradient2(),
                          ),
                        ),
                        AnimatedAlign(
                          duration: Duration(milliseconds: 1200),
                          alignment: align,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1500),
                            margin: EdgeInsets.only(
                                right: marginRight, left: marginLeft),
                            height: 16.0,
                            width: 8.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  top: 40.0,
                  left: 75.0,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: opacity1,
                    child: Textview(
                        fMS == null ? "" : fMS.toString(),
                        12.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor,
                        TextAlign.center),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 0.0,
                  right: 20.0,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: opacity2,
                    child: Textview(
                        sMS == null ? "" : sMS.toString(),
                        12.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor,
                        TextAlign.center),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  right: 100.0,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: opacity3,
                    child: Textview(
                        tMS == null ? "" : tMS.toString(),
                        12.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor,
                        TextAlign.center),
                  ),
                ),
                Container(
                  height: AppValue.screenHeight(context) / 6,
                  width: AppValue.screenWidth(context),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: AnimatedOpacity(
                          opacity: o1,
                          duration: Duration(seconds: 4),
                          child: AnimatedDrawing.svg("assets/images/sssss.svg",
                              run: run1,
                              width: 100.0,
                              height: 60.0,
                              duration: new Duration(milliseconds: svgSpeed),
                              onFinish: () {
                            run1 = false;
                            run2 = true;
                            o1 = 0.0;
                            o2 = 1.0;
                            opacity3 = 0.0;
                            opacity1 = 1.0;
                          }),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedOpacity(
                          opacity: o2,
                          duration: Duration(seconds: 4),
                          child: AnimatedDrawing.svg(
                            "assets/images/sssss.svg",
                            run: run2,
                            width: 100.0,
                            height: 60.0,
                            duration: new Duration(milliseconds: svgSpeed),
                            onFinish: () {
                              run2 = false;
                              run3 = true;
                              o2 = 0.0;
                              o3 = 1.0;
                              opacity1 = 0.0;
                              opacity2 = 1.0;
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedOpacity(
                          opacity: o3,
                          duration: Duration(seconds: 4),
                          child: AnimatedDrawing.svg("assets/images/sssss.svg",
                              run: run3,
                              width: 100.0,
                              height: 60.0,
                              duration: new Duration(milliseconds: svgSpeed),
                              onFinish: () {
                            run3 = false;
                            run4 = true;
                            o3 = 0.0;
                            o4 = 1.0;
                            opacity2 = 0.0;
                            opacity3 = 1.0;
                          }),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedOpacity(
                          opacity: o4,
                          duration: Duration(seconds: 2),
                          child: AnimatedDrawing.svg("assets/images/sssss.svg",
                              run: run4,
                              width: 100.0,
                              height: 60.0,
                              duration: new Duration(milliseconds: svgSpeed),
                              onFinish: () {
                            run4 = false;
                            run1 = true;
                            o4 = 0.0;
                            o1 = 1.0;
                            opacity3 = 0.0;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkConnection() async {
    connection = await ConnectivityPolar.CheckBluetooth;
    location = await ConnectivityPolar.CheckLocation;
    // if (!connection || !location) {
    //   Timer(Duration(seconds: 1), () {
    //     showDialog(
    //       useRootNavigator: true,
    //       context: context,
    //       builder: (context) {
    //         return ConnectionPopup();
    //         //return NudgePopup(S.of(context).downCurveTitle,S.of(context).downCurveDes,GlobalResources.down_curvePath);
    //       },
    //     );
    //   });
    // }
  }

  format(Duration d) => d.toString().substring(2, 7);

  setMS(int ms) {
    if (val == 0) {
      fMS = ms.toString();
      val = 1;
      // opacity3 = 0.0;
      // opacity1 = 1.0;
    } else if (val == 1) {
      sMS = ms.toString();
      val = 2;
      // opacity1 = 0.0;
      // opacity2 = 1.0;
    } else if (val == 2) {
      tMS = ms.toString();
      val = 0;
      // opacity2 = 0.0;
      // opacity3 = 1.0;
    }
  }

  completeMeasurement() async {
    stopwatchHeavy.stop();
    stopwatchRelax.stop();
    stopwatchLow.stop();
    stopwatchNormal.stop();
    var restMeasureData = RestMeasurementEntity.fromClass();
    restMeasureData.completed = true;
    restMeasureData.amp = restMeasurement.heartBeatAmp;
    restMeasureData.hr = restMeasurement.heartBeat;
    restMeasureData.endTime = DateTime.now().millisecondsSinceEpoch;
    restMeasureData.startTime = startTime;
    restMeasureData.createdDate = startTime;
    restMeasureData.timeElapse = rem;
    restMeasureData.stressLevelString = stressLevel;
    restMeasureData.timeStressLow = format(stopwatchLow.elapsed);
    restMeasureData.timeStressNormal = format(stopwatchNormal.elapsed);
    restMeasureData.timeStressRelax = format(stopwatchRelax.elapsed);
    restMeasureData.timeStressHeavy = format(stopwatchHeavy.elapsed);

    restMeasureData.percStressLow = stopwatchLow
        .elapsed.inMilliseconds; //getTimeElapseParcentage(stopwatchLow);
    restMeasureData.percStressNormal = stopwatchNormal
        .elapsed.inMilliseconds; //;getTimeElapseParcentage(stopwatchNormal);
    restMeasureData.percStressRelax = stopwatchRelax
        .elapsed.inMilliseconds; //getTimeElapseParcentage(stopwatchRelax);
    restMeasureData.percStressHeavy = stopwatchHeavy
        .elapsed.inMilliseconds; //getTimeElapseParcentage(stopwatchHeavy);

    var ob = await RestMeasureRepo.instance.mapData(restMeasureData);
    hrController.rmId = ob.id;
    pop = true;
    disposed = true;
    WidgetProps.pushDownToNextPageRelace(
        context: context,
        enterPage: widget.title == title
            ? FreeMeasureResultNotities()
            : Qustionnaire(),
        exitPage: Container());
  }

  String getDurationValue(Stopwatch value) {
    print('${value.elapsed.inMinutes}');
    String elapsedTime = '${value.elapsed}';
    List<String> splitted = elapsedTime.split(":");
    String ss1 = splitted[1];
    String ss2 = splitted[2];
    List<String> splitted1 = ss2.split(".");
    String ss3 = splitted1[0];
    return ss1 + ":" + ss3;
  }

  Widget getTimer(Duration duration) {
    // print('sdfsdfsdfsdsfsdfsddzzzzzzzzzzzsfdyrdfgfhf');
    return CountdownFormatted(
      duration: duration,
      onFinish: () {
        // completeMeasurement();
      },
      builder: (BuildContext ctx, String remaining) {
        //  print(remaining);
        if (!isTimeStarted) {
          waves = 0.0;
          isTimeStarted = true;
        }
        // if (waves == null) {
        //   waves = AppValue.screenWidth(context);
        // }
        //
        //changeTimeSlide(remaining);
        // controller.updateAnimated();

        return Textview(remaining, 30.0, FontWeight.normal,
            AppColors.welcomeTextColor, TextAlign.center); // 01:00:00
      },
    );
  }

//   void connectToDevice() async {
//     // if(device.)
//
//     List<BluetoothService> services =
//         await hrController.currentDevice.discoverServices();
//     BluetoothCharacteristic characteristic;
//     hrController.services = services;
//     characteristic = services[0].characteristics[2];
//     print(characteristic.uuid);
//
//     BluetoothService service = services
//         .where((element) =>
//             element.uuid.toString().toUpperCase().substring(4, 8) == '180D')
//         .toList()
//         .first;
//     BluetoothCharacteristic character = service.characteristics
//         .where((element) =>
//             element.uuid.toString().toUpperCase().substring(4, 8) == '2A37')
//         .toList()
//         .first;
//     // services.forEach((service)  {
//     //   // do somethprint(value);ing with service
//     //
//     //   //print(service);
//     //   characteristic = services[0].characteristics[0];
//     //   print(characteristic.uuid);
//     //
//     // });
//     character.value.listen((event) {
//       print("kkkkk");
//       print(event);
//     });
//     character.setNotifyValue(true);
// //     setState(() {
// //
// //     });
// //     var descriptors = characteristic.descriptors;
// //     for(BluetoothDescriptor d in descriptors) {
// //       List<int> value = await d.read();
// //       print(value);
// //     }
//   }
}

class ShapesPainter extends CustomPainter {
  ShapesPainter({
    this.time,
    this.models,
  });

  static final List<Offset> offsets = <Offset>[];

  final Animation time;
  final List<SinusoidalModel> models;

  @override
  void paint(Canvas canvas, Size size) {
    offsets.clear();
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (double dx = 0.0; dx <= size.width; dx++) {
      offsets.add(Offset(dx, _getY(size, dx)));
    }
    canvas.drawPoints(PointMode.polygon, offsets, paint);
  }

  double _getY(Size size, double dx) {
    final y = models
        .map((model) => model.getY(dx, time.value))
        .reduce((current, next) => current + next);
    final amplitude = models
        .map((model) => model.amplitude)
        .reduce((current, next) => current + next);
    return y + amplitude;
  }

  @override
  bool shouldRepaint(ShapesPainter oldDelegate) => true;
}
