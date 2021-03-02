import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../common/after_measure_notities.dart';

class CronicProtocolResult extends StatefulWidget {
  @override
  _CronicProtocolResultState createState() => _CronicProtocolResultState();
}

class _CronicProtocolResultState extends State<CronicProtocolResult> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(AppValue.screenWidth(context), 75.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: AppLogo(),
          actions: [
            Container(
              height: 66.0,
              margin: EdgeInsets.only(top: 10.0, right: 15.0),
              child: Center(
                child: Textview('00:51:21', 40.0, FontWeight.normal,
                    AppColors.welcomeTextColor, TextAlign.right),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: AppValue.screenHeight(context),
          margin: AppValue.contentResultsPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 6.0,
                color: Colors.grey.withOpacity(0.5),
                width: AppValue.screenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 12.0,
                      width: 30.0,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      height: 12.0,
                      width: 200.0,
                      color: Colors.greenAccent,
                    ),
                    Flexible(
                      child: Container(
                        height: 12.0,
                        width: 100.0,
                        color: Color(0xff180B98),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              getLevelsWidget(
                  AppColors.welcomeButton,
                  'Warming up / cooling down',
                  "2:59",
                  AppValue.screenWidth(context) / 3),
              getLevelsWidget(AppColors.lemoneYellow, 'Endurance 1', "4:59",
                  AppValue.screenWidth(context) / 9),
              getLevelsWidget(AppColors.parrotGreen, 'Endurance 2', "3:59",
                  AppValue.screenWidth(context) / 1.5),
              getLevelsWidget(AppColors.purpleBlue, 'Endurance 3', "1:59",
                  AppValue.screenWidth(context) / 6.5),
              getLevelsWidget(AppColors.redGradien, 'Intensive', "1:59",
                  AppValue.screenWidth(context) / 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                child: Textview(
                    S.of(context).valuesTitle,
                    20.0,
                    FontWeight.w300,
                    AppColors.welcomeTextColor,
                    TextAlign.right),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getValueWidget(S.of(context).heartbeatTitle, '63'),
                          getValueWidget(S.of(context).ampTitle, '79,2'),
                          getValueWidget(
                              S.of(context).BreathfreqTitle, '25 per min'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getValueWidget(
                              S.of(context).audioSettingsSpeed, '13 km/h'),
                          getValueWidget(
                              S.of(context).audioSettingsDistance, '5,2 km'),
                          Flexible(
                            flex: 1,
                            child: Card(
                              elevation: 4.0,
                              child: Container(
                                height: 55.0,
                                width: 105.0,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                alignment: Alignment.center,
                                child: Center(
                                  child: SvgPicture.asset(
                                      GlobalResources.bikingPath),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        gradient: WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.parrotGreen,
        ),
        childs: [
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
            width: 27,
            height: 5.34,
            onTap: () {
              WidgetProps.pushLeftToNextPage(
                  context: context,
                  enterPage: AftermeasureNotities(),
                  exitPage: widget);
            },
            iconColor: Colors.white,
            icon: GlobalResources.ic_more_dots,
          ),
          BottomNavItem2(
            width: 16.56,
            height: 23.66,
            icon: GlobalResources.ic_location_marker,
            onTap: () {},
            iconColor: Colors.white,
          ),
          BottomNavItem2(
            width: 25.28,
            height: 18.96,
            icon: GlobalResources.ic_mail,
            onTap: () {},
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget getLevelsWidget(
      List<Color> colors, String title, String subTitle, double progress) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3.0),
                  topLeft: Radius.circular(3.0)),
              elevation: 4.0,
              child: Container(
                height: 30.0,
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
              child: Container(
                height: 10.0,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getValueWidget(String title, String value) {
    return Flexible(
      flex: 1,
      child: Card(
        elevation: 4.0,
        child: Container(
          height: 55.0,
          width: 105.0,
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
      ),
    );
  }
}
