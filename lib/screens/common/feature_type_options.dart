import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/common_dashboard.dart';
import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'measurement_options.dart';

class FeatureTypeOptions extends StatefulWidget {
  int measuringFeature;

  FeatureTypeOptions(this.measuringFeature);

  @override
  _FeatureTypeOptionsState createState() => _FeatureTypeOptionsState();
}

class _FeatureTypeOptionsState extends State<FeatureTypeOptions>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var opacity = 1.0;
  var opacityMain = 1.0;
  var squareScaleB = 1.0;
  double height;
  double marginH = 15.0;
  double marginV = 15.0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInQuint);
    controller.forward(from: 1.0);
    controller.addListener(() {
      setState(() {
        squareScaleB = controller.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dashboard(
      WidgetProps.getAppGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.startButtonPopup,
      ),
      AnimatedOpacity(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        opacity: opacityMain,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutQuint,
          height: height ?? AppValue.screenHeight(context) / 1.4,
          margin: EdgeInsets.symmetric(horizontal: marginH, vertical: marginV),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            elevation: 4.0,
            child: AnimatedOpacity(
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 400),
              opacity: opacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getOption(GlobalResources.bikingPath),
                      getOption(GlobalResources.runningPath),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getOption(GlobalResources.crosstrainerPath),
                      getOption(GlobalResources.walkingPath),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getOption(GlobalResources.rowingPath),
                      getOption(GlobalResources.skatingPath),
                    ],
                  ),
                  Textview(S.of(context).selYrSport, 24.0, FontWeight.w300,
                      AppColors.dashboardTextColor, TextAlign.center),
                ],
              ),
            ),
          ),
        ),
      ),
      AppColors.dashboardTextColor.withOpacity(0.8),
    );

  }

  Widget getOption(String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          opacity = 0.0;
          marginH = 0.0;
          marginV = 0.0;
          height = AppValue.screenHeight(context);
        });
        Timer(Duration(milliseconds: 350), () {
          Navigator.of(context).push(RoutePage(
            builder: (context) {
              return MeasurementOptions(widget.measuringFeature);
            },
          )).then((value) {
            setState(() {
              opacity = 1.0;
              opacity = 1.0;
              marginH = 15.0;
              marginV = 15.0;
              height = AppValue.screenHeight(context)/1.4;
            });
          });
        });
      },
      child: Container(
        width: 120.0,
        height: 100.0,
        child: Card(
          elevation: 4.0,
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
