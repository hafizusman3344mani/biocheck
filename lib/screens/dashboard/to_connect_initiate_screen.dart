import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/dashboard_common_layout.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'select_belt_screen.dart';

class ConnectInitiate extends StatefulWidget {
  @override
  _DashboardFirstState createState() => _DashboardFirstState();
}

class _DashboardFirstState extends State<ConnectInitiate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(
        RoutePage(
          builder: (context) {
            return SelectBelt();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColorMode,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: Container()
      ),
      body: Container(
        color: AppColors.bodyColorMode,
        height: AppValue.screenHeight(context),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAli qgnment: CrossAxisAlignment.end,
          children: [
            Positioned(
              right: 0.0,
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: Textview(
                        S.of(context).dashboard1Title1,
                        13.0,
                        FontWeight.w300,
                        AppColors.bodyColorMode,
                        TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Textview3(
                        title: S.of(context).dashboard1Title2,
                        color: AppColors.textColorMode,
                        textAlign: TextAlign.right,
                        fontSize: AppValue.screenCommonTitleSize,
                        fontWeight: FontWeight.w300,
                        lineHeight: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 120.0,
              left: 40.0,
              right: 40.0,
              child: Container(
                height: AppValue.customButtonHeight,
                child: HeroButton(
                  width: AppValue.screenWidth(context) / 1.4,
                  height: AppValue.customButtonHeight,
                  title: S.of(context).dashboard1LargeButton,
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppColors.parrotGreen,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      RoutePage(
                        builder: (context) {
                          return ConnectInitiate();
                        },
                      ),
                    );
                  },
                  radius: AppValue.customButtonRadius,
                  textColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: Textview(
                    S.of(context).dashboard1Title3,
                    10.0,
                    FontWeight.w300,
                    AppColors.bodyColorMode,
                    TextAlign.right,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:Container(
        height: AppValue.commonBottomAppbarHeight,)
    );
  }
}
