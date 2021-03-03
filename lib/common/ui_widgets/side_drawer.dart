import 'dart:async';

import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/current_connection_screen.dart';
import 'package:biocheck/screens/drawerscreens/achievements.dart';
import 'package:biocheck/screens/drawerscreens/audio_settings.dart';
import 'package:biocheck/screens/drawerscreens/knowledge_bank.dart';
import 'package:biocheck/screens/drawerscreens/settings.dart';
import 'package:biocheck/screens/popups/ask_update_popup.dart';
import 'package:biocheck/screens/popups/logout_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'get_icon.dart';
import 'side_drawer_item.dart';
import 'textview.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  var marigLeft = 0.0;
  var marginRight = 20.0;

  var hrController = Get.find<HRController>();

  @override
  void initState() {
    Timer(Duration(milliseconds: 200), () {
      if (mounted)
        setState(() {
          marigLeft = 10.0;
          marginRight = 10.0;
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        //curve: Ease.backOut,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: AppColors.bodyColorMode,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),

        width: AppValue.screenWidth(context),
        margin: EdgeInsets.only(
            top: 30.0, left: marigLeft, right: marginRight, bottom: 10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20.0, top: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: GetIcon(
                    path: GlobalResources.ic_close,
                    color: AppColors.textColorMode.withOpacity(0.7),
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          WidgetProps.pushLeftToNextPage(
                              context: context,
                              enterPage: Settings(),
                              exitPage: widget);
                        },
                        child: Textview(
                            S.of(context).navigationOption1,
                            28.0,
                            FontWeight.normal,
                            AppColors.textColorMode,
                            TextAlign.end),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          WidgetProps.pushLeftToNextPage(
                              context: context,
                              enterPage: AudioSettings(),
                              exitPage: widget);
                        },
                        child: Textview(
                            S.of(context).navigationOption2,
                            28.0,
                            FontWeight.normal,
                            AppColors.textColorMode,
                            TextAlign.end),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Textview(
                            S.of(context).navigationOption3,
                            28.0,
                            FontWeight.normal,
                            AppColors.noAccTextColorMode,
                            TextAlign.end),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          WidgetProps.pushLeftToNextPage(
                              context: context,
                              enterPage: KnowledgeBank(),
                              exitPage: widget);
                        },
                        child: Textview(
                            S.of(context).navigationOption4,
                            28.0,
                            FontWeight.normal,
                            AppColors.textColorMode,
                            TextAlign.end),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          WidgetProps.pushLeftToNextPage(
                              context: context,
                              enterPage: Achievements(),
                              exitPage: widget);
                        },
                        child: Textview(
                            S.of(context).navigationOption5,
                            28.0,
                            FontWeight.normal,
                            AppColors.textColorMode,
                            TextAlign.end),
                      ),
                    ),
                    DrawerItem(S.of(context).navigationOption6, () {
                      showDialog(
                        useRootNavigator: true,
                        context: context,
                        builder: (context) {
                          return LogoutPopup();
                          //return NudgePopup(S.of(context).downCurveTitle,S.of(context).downCurveDes,GlobalResources.down_curvePath);
                        },
                      );
                    }),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: AppValue.screenWidth(context),
                  height: AppValue.screenHeight(context) * .30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0)),
                    gradient: WidgetProps.getAppGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.redGradien,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  RoutePage(
                                    builder: (context) {
                                      return ConnectionConfiguration();
                                    },
                                  ),
                                );
                              },
                              child: Textview(
                                  S.of(context).navigationOptionBottom1,
                                  30.0,
                                  FontWeight.normal,
                                  Colors.white,
                                  TextAlign.end),
                            ),
                            Textview(
                                S.of(context).navigationOptionBottom2,
                                12.0,
                                FontWeight.normal,
                                Colors.white,
                                TextAlign.end),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Textview(
                              S.of(context).navigationOptionBottom3,
                              12.0,
                              FontWeight.normal,
                              Colors.white,
                              TextAlign.end),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
