import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/faded_widget.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/controllers/infrastructure/core/tts_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/measure_finish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FreeTrainingMeasure extends StatefulWidget {
  String title;
  Widget heading;

  FreeTrainingMeasure(this.title, this.heading);

  @override
  _FreeTrainingMeasureState createState() => _FreeTrainingMeasureState();
}

class _FreeTrainingMeasureState extends State<FreeTrainingMeasure>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(milliseconds: 1200), () {
      Get.find<TTSController>().speak(S.of(context).StartTraining);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeWidget(
          curve: Curves.easeIn,
          milisec: 200,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: PreferredSize(
              preferredSize: Size(AppValue.screenWidth(context), 55.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: AppLogo(),
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Textview(
                            S.of(context).timeTrain + '0:05:12',
                            24.0,
                            FontWeight.w300,
                            AppColors.welcomeTextColor,
                            TextAlign.center),
                      ),
                    ],
                  ),
                  Container(
                    height: 90.0,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetIcon(
                              path: GlobalResources.ic_heart_red,
                              width: 49.0,
                              height: 42.0,
                            ),
                            Textview("134", 53.0, FontWeight.w900,
                                AppColors.welcomeTextColor, TextAlign.center),
                          ],
                        ),
                      ),
                    ),
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
                            gradient:
                            WidgetProps.getAppGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: AppColors.purpleBlue,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 3000),
                          alignment: Alignment.centerLeft,
                          height: 80.0,
                          width: AppValue.screenWidth(context) / 1.8,
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: AppColors.dashboardTextColor, width: 2.0)),

                            /*borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(3.0),
                                topLeft: Radius.circular(3.0)),*/
                            color: AppColors.endurance2,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Textview(S.of(context).Endurance, 24.0, FontWeight.w900,
                              Colors.white, TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                 /* Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: 80.0,
                        width: AppValue.screenWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5.0),
                              topRight: Radius.circular(5.0)),
                          color: AppColors.endurance2,
                        ),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 3000),
                          height: 79.0,
                          width: AppValue.screenWidth(context) / 2.5,
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: AppColors.dashboardTextColor,
                                    width: 2.0)),
                            gradient: WidgetProps.getAppGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: AppColors.purpleBlue,
                            ),
                          ),
                        ),
                      ),
                      Textview(S.of(context).Endurance, 24.0, FontWeight.normal,
                          Colors.white, TextAlign.center),
                    ],
                  ),*/
                  Flexible(
                    child: Container(
                      height: AppValue.screenHeight(context) / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getValueWidget(S.of(context).ampTitle, '11,4'),
                                getValueWidget(
                                    S.of(context).BreathfreqTitle + 'p/m',
                                    '24'),
                              ],
                            ),
                          ),
                          Container(
                            child: SvgPicture.asset(
                              GlobalResources.runningPath,
                              width: 92.22,
                              height: 92.22,
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getValueWidget(
                                    S.of(context).audioSettingsDistance,
                                    '10,7'),
                                getValueWidget(
                                    S.of(context).audioSettingsSpeed, '12'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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

                      Textview('V R I J E  T R.', 21, FontWeight.normal,
                          Colors.white, TextAlign.center),
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
                          icon: GlobalResources.ic_stop),
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
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Textview(header, 14.0, FontWeight.w300, AppColors.welcomeTextColor,
                  TextAlign.center),
              Textview(value, 40.0, FontWeight.normal, AppColors.welcomeTextColor,
                  TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
