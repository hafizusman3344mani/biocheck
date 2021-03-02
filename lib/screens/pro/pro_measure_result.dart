import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/after_measure_notities.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProMeasureResult extends StatefulWidget {
  @override
  _ProMeasureResultState createState() => _ProMeasureResultState();
}

class _ProMeasureResultState extends State<ProMeasureResult> {
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
              margin: EdgeInsets.only(top: 10.0,right: 15.0),
              child: Center(
                child: Textview('00:51:21', 40.0, FontWeight.normal,
                    AppColors.welcomeTextColor, TextAlign.right),
              ),
            )
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            height: AppValue.screenHeight(context) / 1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    children: [
                      getLevelsWidget(AppColors.lemoneYellow, S.of(context).proes1,
                          "05:50", AppValue.screenWidth(context) / 9),
                      getLevelsWidget(AppColors.parrotGreen, S.of(context).proes2,
                          "30:10", AppValue.screenWidth(context) / 1.5),
                      getLevelsWidget(AppColors.redGradien, S.of(context).proes3,
                          "09:13", AppValue.screenWidth(context) / 6.5),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Textview(
                              S.of(context).valuesTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.right),
                        ),
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
                                    child:
                                        SvgPicture.asset(GlobalResources.bikingPath),
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
