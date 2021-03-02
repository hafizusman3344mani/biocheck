import 'dart:async';

import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/material.dart';

import 'after_result_free_measure_noti.dart';


class FreeMeasureResult extends StatefulWidget {
  @override
  _FreeMeasureResultState createState() => _FreeMeasureResultState();
}

class _FreeMeasureResultState extends State<FreeMeasureResult>with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  double progress1 = 0.0;
  double progress2 = 0.0;
  double progress3 = 0.0;
  double progress4 = 0.0;
  double h1 = 51.0;
  double h2 = 0.0;

  @override
  void initState() {
    _controller = Animations.getSlidePageCOntroller(this);
    _offsetFloat =
        Animations.getSlidePageOffset(Offset.zero, Offset.zero, _controller);
    // TODO: implement initState
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        h1 = 35.0;
        h2 = 16.0;
        progress1 = AppValue.screenWidth(context) / 6;
        progress2 = AppValue.screenWidth(context) / 7;
        progress3 = AppValue.screenWidth(context) / 8;
        progress4 = AppValue.screenWidth(context) / 9;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _offsetFloat,
        child: Scaffold(
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
                  padding: EdgeInsets.only(right: 25.0),
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
          body: SingleChildScrollView(
            child: Container(
              height: AppValue.screenHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      getLevelsWidget(AppColors.parrotGreen, S.of(context).relaxTitle,
                          "2:59", progress1),
                      getLevelsWidget(AppColors.normalStrs, S.of(context).normalTitle,
                          "4:59", progress2),
                      getLevelsWidget(AppColors.lgStrs1, S.of(context).stress1Title,
                          "3:59", progress3),
                      getLevelsWidget(AppColors.redGradien,
                          S.of(context).stress2Title, "1:59", progress4),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: Textview(
                              S.of(context).valuesTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.right),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        height: AppValue.screenHeight(context) / 9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getValueWidget(S.of(context).heartbeatTitle, '63'),
                            getValueWidget(S.of(context).ampTitle, '79,2'),
                            getValueWidget(
                                S.of(context).BreathfreqTitle, '8 per min'),
                          ],
                        ),
                      ),
                    ],
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
                width: 24.0,
                height: 24.0,
                onTap: () {
                  WidgetProps.pushLeftToNextPage(
                      context: context,
                      enterPage: FreeMeasureAfterResultNotities(),
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
          width: 105.0,
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
      ),
    );
  }

  Widget getLevelsWidget(List<Color> colors, String title, String subTitle, double progress) {
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

  routeNext(Widget next) {
    setState(() {
      _offsetFloat = Animations.getSlidePageOffset(
          Offset.zero, Offset(-1.0, 0.0), _controller);
    });
    _controller.forward(from: 0.0);
    Timer(Duration(milliseconds: 00),(){
      Navigator.push(context, RoutePageSlideFromRight(builder: (context) => next,)).then((value) => _controller.reverse());
    });
  }

}
