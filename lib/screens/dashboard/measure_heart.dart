import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/faded_widget.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/db/db_values.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/measurements/rest_measure.dart';
import 'package:biocheck/screens/popups/connectivity_change_popup.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MeasureHeartClick extends StatefulWidget {
  @override
  _MeasureHeartClickState createState() => _MeasureHeartClickState();
}

class _MeasureHeartClickState extends State<MeasureHeartClick> {
  bool isStart = false;
  double widthGradient;
  double opacity = 1.0;
  Gradient buttonGradient;
  Color textCol = AppColors.dashboardTextColor;
  Timer _timer;
  int _start = 10;
  bool enableButton = false;
  bool connection = false;
  bool location = false;
  var colorsStart = DBValues.instance.getUserEntity().IsDarkTheme
      ? AppColors.welcomeButton
      : AppColors.startButtonPopup;
  var next = false;
  var hrController = Get.find<HRController>();

  void startTimer() {
    Timer(Duration(seconds: 9), () {
      colorsStart = AppColors.parrotGreen;
      enableButton = true;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    buttonGradient = WidgetProps.getAppGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: AppColors.startButtonPopup,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HRController>(
      init: hrController,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (!next) {
              //ConnectivityPolar.disconnect;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent.withOpacity(0.65),
            body: Center(
              child: Container(
                  height: 595.0,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    child: !isStart
                        ? AnimatedOpacity(
                            duration: Duration(milliseconds: 4500),
                            curve: Curves.easeOut,
                            opacity: opacity,
                            child: Stack(
                              children: [
                                Center(
                                    child: SvgPicture.asset(
                                        GlobalResources.measureheartPath)),
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  left: 0.0,
                                  top: 300.0,
                                  child: GestureDetector(
                                    onTap: () async {
                                      connection = await ConnectivityPolar
                                          .CheckBluetooth;
                                      location =
                                          await ConnectivityPolar.CheckLocation;
                                      if (!connection || !location) {
                                        hrController.showNetworkChangePopup();
                                      } else {
                                        hrController.mType = Constants.REST;

                                        hrController.connectToDevice();

                                        startTimer();

                                        setState(() {
                                          buttonGradient =
                                              WidgetProps.getAppGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: AppColors.welcomeButton,
                                          );
                                          widthGradient = 10.0;
                                          Timer(Duration(milliseconds: 400),
                                              () {
                                            setState(() {
                                              textCol = Colors.white;
                                              opacity = 0.0;
                                            });
                                          });
                                          Timer(Duration(milliseconds: 650),
                                              () {
                                            setState(() {
                                              isStart = true;
                                            });
                                          });
                                          Timer(Duration(milliseconds: 750),
                                              () {
                                            setState(() {
                                              widthGradient =
                                                  AppValue.screenWidth(context);
                                            });
                                          });
                                        });
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0.0),
                                      child: Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 20.0),
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: AnimatedContainer(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        blurRadius: 15.0,
                                                        offset:
                                                            Offset(0.0, 2.75),
                                                      )
                                                    ],
                                                    gradient: buttonGradient,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0))),
                                                duration:
                                                    Duration(milliseconds: 600),
                                                width: widthGradient ??
                                                    AppValue.screenWidth(
                                                        context),
                                                height:
                                                    AppValue.customButtonHeight,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Textview2(
                                              title: 'Start',
                                              color: textCol,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18.0,
                                              textAlign: TextAlign.center,
                                              lineHeight: 1.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : startMeasuring(),
                  )),
            ),
          ),
        );
      },
    );
  }

  Widget startMeasuring() {
    return Container(
      // height: 595.0,
      decoration: BoxDecoration(
          color: AppColors.bodyColorMode,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Positioned(
            top: 57.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              margin: EdgeInsets.only(top: 35.0),
              child: Textview(S.of(context).waitingRoomPopupTitle, 24.0,
                  FontWeight.w300, AppColors.textColorMode, TextAlign.center),
            ),
          ),
          Positioned(
            top: 134.0,
            right: 0.0,
            left: 0.0,
            child: Textview2(
              title: S.of(context).waitingRoomPopupDesc,
              color: AppColors.textColorMode,
              fontWeight: FontWeight.w300,
              fontSize: 16.0,
              textAlign: TextAlign.center,
              lineHeight: 1.4,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            top: 300.0,
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            gradient: buttonGradient,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        duration: Duration(seconds: 10),
                        width: widthGradient ?? AppValue.screenWidth(context),
                        height: AppValue.customButtonHeight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Textview2(
                      title: S.of(context).waitingRoomPopupBtn1,
                      color: textCol,
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                      textAlign: TextAlign.center,
                      lineHeight: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () async {
                if (enableButton) {
                  connection = await ConnectivityPolar.CheckBluetooth;
                  location = await ConnectivityPolar.CheckLocation;
                  // if (!connection || !location) {
                  //   hrController.showNetworkChangePopup();
                  // } else {
                  //  if (hrController.startMeasuring == 1) {
                  next = true;
                  Navigator.pushReplacement(context, RoutePage(
                    builder: (context) {
                      return RestMeasureent(S.of(context).measuring);
                    },
                  ));
                  // } else {
                  //   hrController.showConnectionChangePopup();
                  // }
                  // }
                }
              },
              child: AnimatedContainer(
                height: 45.0,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)),
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colorsStart,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textview(
                        S.of(context).waitingRoomPopupBtn2,
                        18.0,
                        FontWeight.w300,
                        enableButton
                            ? Colors.white
                            : DBValues.instance.getUserEntity().IsDarkTheme
                                ? Colors.white
                                : AppColors.dashboardTextColor,
                        TextAlign.center)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
