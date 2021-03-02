import 'dart:async';
import 'dart:convert';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/loader44.dart';
import 'package:biocheck/common/utils/loader_detail.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/models/local/rest_measurement_model.dart';
import 'package:biocheck/screens/popups/connectivity_change_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class RestMeasureDetail extends StatefulWidget {
  RestMeasureDetail();

  @override
  _RestMeasureCalculationState createState() => _RestMeasureCalculationState();
}

class _RestMeasureCalculationState extends State<RestMeasureDetail>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  double height = 50.0;
  bool isDiconn = false;
  var restMeasurement = RestMeasure.fromClass();
  var hrController = Get.find<HRController>();

  double heightFirst1 = 73.74;
  double heightFirst2 = 66.87;

  String img1 = 'assets/images/Path 131.svg';
  String img2 = 'assets/images/Path 132.svg';

  int cur = 1;
  var svgSpeed = 5000;

  _buildCard({
    Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: svgSpeed),
      height: height,
      width: double.infinity,
      child: WaveWidget(
        config: config,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 15,
        waveFrequency: 2.0,
        wavePhase: 15.0,
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;

  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  void initState() {
    if (mounted) {
      restMeasurement = hrController.hr.value;
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
      );

      _offsetFloat = Tween<Offset>(begin: Offset(0.0, -0.2), end: Offset.zero)
          .animate(_controller);

      _offsetFloat.addListener(() {
        setState(() {});
      });
      forward();

      Timer(Duration(milliseconds: 1200), () {
        if (mounted) {
          height = height + AppValue.screenHeight(context);
          _controller.forward();
        }
      });
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (mounted) {
            Timer(Duration(seconds: 3), () {
              if (mounted) {
                height = 50.0;
                _controller.reverse();
              }
            });
          }
        } else if (status == AnimationStatus.dismissed) {
          if (mounted) {
            Timer(Duration(seconds: 4), () {
              if (mounted) {
                height = AppValue.screenHeight(context);
                _controller.forward();
              }
            });
          }
        }
      });
    }
    super.initState();
  }

  forward() {
    Timer(Duration(milliseconds: 1200), () {
      heightFirst1 = AppValue.screenHeight(context) * .3;
      heightFirst2 = AppValue.screenHeight(context) * .3;
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: AppLogo(),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: GetIcon(
                  color: AppColors.themeRedColor,
                  path: GlobalResources.ic_close,
                  width: 25.0,
                  height: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      //body: Loader44(),
      body: GetBuilder<HRController>(
          init: hrController,
          builder: (_) {
            return Container(
              color: Colors.transparent,
              height: AppValue.screenHeight(context),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildCard(

                    config: CustomConfig(
                      gradients: [
                        [Color(0xff32394B),Color(0xff32394B)],
                        [Color(0xff32394B),Color(0xff32394B)],
                        [Color(0xff32394B),Color(0xff32394B)],
                        [Color(0xff32394B),Color(0xff32394B)]
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: [0.20, 0.13, 0.21, 0.30],

                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                  ),

                  buildBody(),
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomBar(
        gradient: WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.redGradien,
        ),
        childs: [
          Container(
              width: AppValue.screenWidth(context),
              child: Center(
                child: Textview2(
                  title: S.of(context).measuring,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 21.0,
                  letterSpacing: 2.5,
                ),
              )),
        ],
      ),
    );
  }

  Widget mapData() {
    // if (restMeasurement.heartBeat > 85) {
    //   svgSpeed = 500;
    // } else if (restMeasurement.heartBeat > 75 &&
    //     restMeasurement.heartBeat <= 85) {
    //   svgSpeed = 3300;
    // } else if (restMeasurement.heartBeat > 60 &&
    //     restMeasurement.heartBeat <= 75) {
    //   svgSpeed =5000;
    // }else
    // {
    //   svgSpeed = 3000;
    // }

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GetIcon(
                height: 30.0,
                width: 30.0,
                color: Colors.white,
                path: GlobalResources.ic_heart_filled2,
              ),
              Textview(
                  restMeasurement.heartBeat == null
                      ? "0"
                      : restMeasurement.heartBeat.toString(),
                  21,
                  FontWeight.bold,
                  Colors.white,
                  TextAlign.center),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GetIcon(
                  height: 18.0,
                  width: 18.0,
                  color: Colors.white,
                  path: GlobalResources.ic_open_graph_filled,
                ),
              ),
              Textview(
                  restMeasurement.heartBeatAmp != 0
                      ? restMeasurement.heartBeatAmp.toString()
                      : "0",
                  21,
                  FontWeight.bold,
                  Colors.white,
                  TextAlign.center),
            ],
          ),
        ],
      ),
    );
  }

  buildBody() {
    // if (hrController.snapshot!=null) {
    //   restMeasurement= hrController.hr.value ;//=restMeasurement;
    //   int type = json.decode(hrController.snapshot)["type"] as int;
    //   if (type == Constants.HR) {
    //     Map dataString = json.decode(hrController.snapshot)["data"];
    //     if (dataString != null) {
    //       restMeasurement.heartBeat =
    //       dataString["HeartRate"] as int;
    //       restMeasurement.heartBeatMS1 =
    //       dataString["HeartRateMS1"] as int;
    //       restMeasurement.heartBeatMS2 =
    //       dataString["HeartRateMS2"] as int;
    //       restMeasurement.heartBeatAmp =
    //       dataString["HeartRateAMP"] as double;
    //     }
    //   } else if (type == Constants.DISCONNECT) {
    //     isDiconn = true;
    //     if (!hrController.isPop) {
    //       Timer(Duration(seconds: 1), () {
    //         hrController.showConnectionChangePopup();
    //       });
    //     }
    //   } else if (type == Constants.POWEROFF) {
    //     // showDialog(
    //     //   useRootNavigator: true,
    //     //   context: context,
    //     //   builder: (context) {
    //     //     return ConnectionPopup();
    //     //     //return NudgePopup(S.of(context).downCurveTitle,S.of(context).downCurveDes,GlobalResources.down_curvePath);
    //     //   },
    //     // );
    //
    //   } else if (type == Constants.POWERON ||
    //       type == Constants.CONNECT) {
    //     if (isDiconn) {
    //       Navigator.of(context).pop();
    //     }
    //   } else {}
    // }
    return mapData();
  }
}
