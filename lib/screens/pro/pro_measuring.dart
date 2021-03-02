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
import 'package:biocheck/controllers/infrastructure/core/tts_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/pro/search_pro.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pro_measure_result.dart';

class ProMeasurement extends StatefulWidget {
  ProMeasurement();

  @override
  _ProMeasurementState createState() => _ProMeasurementState();
}

class _ProMeasurementState extends State<ProMeasurement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double marginLeft = 130.0;
  double marginRight = 0.0;
  double position = 0.0;

  @override
  void initState() {

    Timer(Duration(milliseconds: 800), () {
      setState(() {
        position = 170.0;
        marginRight = 130.0;
        marginLeft = 0.0;
        Get.find<TTSController>().speak(S.of(context).StartTraining);
      });
    });
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
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Textview(
                          S.of(context).remaining + '8.3',
                          24.0,
                          FontWeight.w300,
                          AppColors.welcomeTextColor,
                          TextAlign.center),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.only(top: 15.0),
                      alignment: Alignment.centerLeft,
                      duration: Duration(milliseconds: 3000),
                      height: 11.0,
                      width: AppValue.screenWidth(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.dashboardTextColor),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 3000),
                        height: 11.0,
                        width: AppValue.screenWidth(context) / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          color: AppColors.dashboardTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 109.0,
                      child: Material(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.0),
                            topRight: Radius.circular(3.0)),
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
                    Material(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0)),
                      elevation: 4.0,
                      child: Container(
                        width: AppValue.screenWidth(context),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: 16.0,
                                    width: AppValue.screenWidth(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3.0)),
                                      gradient: LinearGradient(
                                        begin: Alignment(1.0, 0.0),
                                        end: Alignment(-1.0, 0.0),
                                        colors: [
                                          const Color(0xff3dc27c),
                                          const Color(0xffe6eb38),
                                          const Color(0xffffbc00),
                                          const Color(0xffc50000)
                                        ],
                                        stops: [0.0, 0.355, 0.72, 1.0],
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    height: 16.0,
                                    width: AppValue.screenWidth(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(3.0),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment(-1.0, 0.0),
                                        end: Alignment(1.0, 0.0),
                                        colors: [
                                          const Color(0xff3dc27c),
                                          const Color(0xff4bc576),
                                          const Color(0xffb9e04a),
                                          const Color(0xffe6eb38),
                                          const Color(0xffffbc00),
                                          const Color(0xffc50000)
                                        ],
                                        stops: [
                                          0.0,
                                          0.01,
                                          0.261,
                                          0.355,
                                          0.72,
                                          1.0
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getPostionedRight()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textview('128', 24.0, FontWeight.w300,
                          AppColors.welcomeTextColor, TextAlign.start),
                      Textview('131', 24.0, FontWeight.w300,
                          AppColors.welcomeTextColor, TextAlign.start),
                      Textview('134', 24.0, FontWeight.w300,
                          AppColors.welcomeTextColor, TextAlign.start),
                    ],
                  ),
                ),
              ],
            ),
            Textview('12,2 km/h', 24.0, FontWeight.w300,
                AppColors.welcomeTextColor, TextAlign.start),
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
                          enterPage: ProMeasureResult());
                    },
                    icon: GlobalResources.ic_play),

                GestureDetector(
                  onTap: () {
                    WidgetProps.goToNextPage(context, ProSearch());
                  },
                  child: Textview('P R O', 21, FontWeight.normal, Colors.white,
                      TextAlign.center),
                ),

                BottomNavItem2(
                    height: 23.0,
                    width: 25.0,
                    onTap: () {
                      WidgetProps.pushUpToNextPageRelace(
                          context: context,
                          enterPage: ProMeasureResult(),
                          exitPage: widget);
                    },
                    icon: GlobalResources.ic_stop),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getValueWidget(String header, String value) {
    return Card(
      elevation: 4.0,
      child: Container(
        height: 90.0,
        width: 110.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textview(header, 14.0, FontWeight.normal,
                AppColors.welcomeTextColor, TextAlign.center),
            Textview(value, 40.0, FontWeight.normal, AppColors.welcomeTextColor,
                TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget getPostioned() {
    return AnimatedPositioned(
      left: 0.0,
      duration: Duration(milliseconds: 1500),
      child: Container(
        height: 16.0,
        width: 8.0,
        color: Colors.white,
      ),
    );
  }

  Widget getPostionedRight() {
    return AnimatedPositioned(
      right: position,
      duration: Duration(milliseconds: 1500),
      child: Container(
        height: 16.0,
        width: 8.0,
        color: Colors.white,
      ),
    );
  }
}
