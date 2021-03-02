import 'dart:async';

import 'package:biocheck/common/ui_widgets/faded_widget.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/measurements/rest_measure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'select_free_measure_type.dart';

class FreeMeasureHeartClick extends StatefulWidget {
  @override
  _MeasureHeartClickState createState() => _MeasureHeartClickState();
}

class _MeasureHeartClickState extends State<FreeMeasureHeartClick> {
  bool isStart = false;
  double widthGradient;
  double opacity = 1.0;
  Gradient buttonGradient;
  Color textCol = AppColors.dashboardTextColor;
  bool enableButton = false;

  var colorsStart = AppColors.startButtonPopup;

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
    return  Container(
        height: 595.0,
        // margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child:  AnimatedOpacity(
          duration: Duration(milliseconds: 4500),
          curve: Curves.easeOut,
          opacity: opacity,
          child: Stack(
            children: [
              Center(
                  child:
                  SvgPicture.asset(GlobalResources.measureheartPath)),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                top: 300.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, RoutePage(builder: (_)
                    {
                      return FreeMeasureType();
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 20.0),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 15.0,
                                      offset: Offset(0.0, 2.75),
                                    )
                                  ],
                                  gradient: buttonGradient,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0))),
                              duration: Duration(milliseconds: 600),
                              width: widthGradient ??
                                  AppValue.screenWidth(context),
                              height: AppValue.customButtonHeight,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
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
    );
  }
}
