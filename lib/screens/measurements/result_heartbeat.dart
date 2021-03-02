import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/db/entities/rest_measure_entity.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:biocheck/screens/measurements/result_heartbeat_noti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeartbeatResult extends StatefulWidget {
  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<HeartbeatResult> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double progress1 = 0.0;
  double progress2 = 0.0;
  double progress3 = 0.0;
  double progress4 = 0.0;
  double h1 = 51.0;
  double h2 = 0.0;
  double marginLeft = 130.0;
  double marginRight = 0.0;

  var maeasurementModel = RestMeasurementEntity.fromClass();
  List<RestQuestionnaire> maeasurementQuesList =
      List<RestQuestionnaire>.empty(growable: true);

  var hrController = Get.find<HRController>();

  double avesumHR = 0.0;
  double avesumAMP = 0.0;
  double avesumADAM = 0.0;

  @override
  void initState() {
    // // TODO: implement initState
    // Timer(Duration(milliseconds: 800), () {
    //   setState(() {
    //     h1 = 35.0;
    //     h2 = 16.0;
    //     progress1 = AppValue.screenWidth(context) / 6;
    //     progress2 = AppValue.screenWidth(context) / 7;
    //     progress3 = AppValue.screenWidth(context) / 8;
    //     progress4 = AppValue.screenWidth(context) / 9;
    //   });
    // });
    // Timer(Duration(milliseconds: 800), () {
    //   setState(() {
    //     marginRight = 130.0;
    //     marginLeft = 0.0;
    //   });
    // });
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                onTap: () {},
                child: GetIcon(
                  path: GlobalResources.ic_calendar,
                  color: AppColors.dashboardTextColor,
                  width: 22.0,
                  height: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<HRController>(
        init: hrController,
        id: Constants.RESLUT_HEART_BEAT,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: AppValue.contentResultsPadding,
              height: AppValue.screenHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      getLevelsWidget(
                          AppColors.parrotGreen,
                          S.of(context).relaxTitle,
                          maeasurementModel.timeStressRelax ?? '',
                          progress1),
                      getLevelsWidget(
                          AppColors.normalStrs,
                          S.of(context).normalTitle,
                          maeasurementModel.timeStressNormal ?? '',
                          progress2),
                      getLevelsWidget(
                          AppColors.lgStrs1,
                          S.of(context).stress1Title,
                          maeasurementModel.timeStressLow ?? '',
                          progress3),
                      getLevelsWidget(
                          AppColors.redGradien,
                          S.of(context).stress2Title,
                          maeasurementModel.timeStressHeavy ?? '',
                          progress4),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Textview(
                              S.of(context).valuesTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.right),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        height: AppValue.screenHeight(context) / 9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getValueWidget(
                                S.of(context).heartbeatTitle,
                                maeasurementModel.hr == null
                                    ? ""
                                    : avesumHR.round().toString()),
                            getValueWidget(S.of(context).ampTitle, avesumAMP.roundToDouble().toString()),
                            getValueWidget(
                                S.of(context).BreathfreqTitle, avesumADAM.round().toString()+' per min'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Textview(
                            S.of(context).abilityToRecover,
                            10.0,
                            FontWeight.w300,
                            AppColors.welcomeTextColor,
                            TextAlign.right),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Image.asset(
                          GlobalResources.ic_arrow_twist,
                          width: 26.0,
                          height: 25.0,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(3.0),
                                  topLeft: Radius.circular(3.0)),
                              elevation: 4.0,
                              child: Container(
                                height: 45.0,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textview(
                                        S.of(context).mediocreTitle,
                                        21.0,
                                        FontWeight.w300,
                                        AppColors.welcomeTextColor,
                                        TextAlign.center),
                                    Textview(
                                        '',
                                        14.0,
                                        FontWeight.w300,
                                        AppColors.welcomeTextColor,
                                        TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                            Material(
                              child: AnimatedContainer(
                                child: Column(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 1500),
                                      margin: EdgeInsets.only(
                                          right: marginRight, left: marginLeft),
                                      height: 16.0,
                                      width: 8.0,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                duration: Duration(milliseconds: 300),
                                height: 16.0,
                                width: AppValue.screenWidth(context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(3.0),
                                      bottomLeft: Radius.circular(3.0)),
                                  gradient: WidgetProps.getAppGradient2(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomBar(
        gradient: WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.parrotGreen,
        ),
        childs: [
          BottomNavItem2(
            width: 24.0,
            height: 24.0,
            onTap: () {
              WidgetProps.pushLeftToNextPage(
                  context: context,
                  enterPage: HeartbeatResultNotities(),
                  exitPage: widget);
            },
            iconColor: Colors.white,
            icon: GlobalResources.ic_pencil,
          ),
          BottomNavItem2(
            width: 26.24,
            height: 25.16,
            onTap: () {
              WidgetProps.pushDownToNextPageFinishUntill(
                  context: context,
                  enterPage: DashboardMain(),
                  exitPage: widget);
            },
            iconColor: Colors.white,
            icon: GlobalResources.ic_home,
          ),
          BottomNavItem2(
            icon: GlobalResources.ic_mail,
            onTap: () {},
            width: 25.0,
            height: 19.0,
          ),
        ],
      ),
    );
  }

  Widget getValueWidget(String title, String value) {
    return Card(
      elevation: 4.0,
      child: Container(
        width: AppValue.screenWidth(context) / 3.7,
        height: 55.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textview(title, 14.0, FontWeight.w300, AppColors.welcomeTextColor,
                TextAlign.center),
            Textview(value, 14.0, FontWeight.w300, AppColors.welcomeTextColor,
                TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget getLevelsWidget(
      List<Color> colors, String title, String subTitle, double progress) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3.0),
                  topLeft: Radius.circular(3.0)),
              elevation: 4.0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: h1,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textview(title, 14.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.center),
                    Textview(subTitle, 14.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.center),
                  ],
                ),
              ),
            ),
            Material(
              child: AnimatedContainer(
                height: h2,
                width: progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(3.0),
                      bottomLeft: Radius.circular(3.0)),
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  ),
                ),
                duration: Duration(milliseconds: 1000),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getData() async {
    int sumHR = hrController.hrList.reduce((a, b) => a + b);
    double sumAMP = hrController.ampList.reduce((a, b) => a + b);
    int sumADAM = hrController.adamList.reduce((a, b) => a + b);

    avesumHR = sumHR/ hrController.hrList.length;
    avesumAMP = sumAMP/ hrController.ampList.length;
    avesumADAM = sumADAM/ hrController.adamList.length;
    maeasurementModel =
        await hrController.getMeasurementById(hrController.rmId);
    hrController.maeasurementModel = maeasurementModel;
    hrController.update([Constants.RESLUT_HEART_BEAT]);
    Timer(Duration(milliseconds: 1200), () {
      setProgress();
    });
  }

  void setProgress() {
    progress1 = getProgress(maeasurementModel.percStressRelax);
    progress2 = getProgress(maeasurementModel.percStressNormal);
    progress3 = getProgress(maeasurementModel.percStressLow);
    progress4 = getProgress(maeasurementModel.percStressHeavy);
    h1 = 35.0;
    h2 = 16.0;
    hrController.update([Constants.RESLUT_HEART_BEAT]);
  }

  double getProgress(int value) {
    if(mounted) {
      if (value >= 1 && value <= 30000) {
        return AppValue.screenWidth(context) * 0.03;
      } else if (value <= 60000 && value >= 30001) {
        return AppValue.screenWidth(context) * 0.06;
      } else if (value <= 90000 && value >= 60001) {
        return AppValue.screenWidth(context) * 0.10;
      } else if (value <= 120000 && value >= 90001) {
        return AppValue.screenWidth(context) * 0.15;
      } else if (value <= 150000 && value >= 120001) {
        return AppValue.screenWidth(context) * 0.20;
      } else if (value <= 180000 && value >= 150001) {
        return AppValue.screenWidth(context) * 0.50;
      } else if (value <= 210000 && value >= 180001) {
        return AppValue.screenWidth(context) * 0.55;
      } else if (value <= 240000 && value >= 210001) {
        return AppValue.screenWidth(context) * 0.66;
      } else if (value <= 270000 && value >= 240001) {
        return AppValue.screenWidth(context) * 0.77;
      } else if (value <= 300000 && value >= 270001) {
        return AppValue.screenWidth(context) * 0.88;
      } else if (value <= 355000 && value >= 300001) {
        return AppValue.screenWidth(context) * 0.90;
      } else if (value <= 360000 && value >= 355001) {
        return AppValue.screenWidth(context);
      } else {
        return 0.0;
      }
    }
  }
}
