import 'dart:async';

import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/faded_widget.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/authentication/login.dart';
import 'package:biocheck/screens/common/common_background_start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  BoxDecoration boxDecoration;
  List<Color> colors;
  bool isForward = true;
  bool isWelcome = true;
  bool willPop = false;
  var _opacity = 0.0;
  AlignmentGeometry _alignment = Alignment.center;

  @override
  void initState() {
    colors = AppColors.redGradien;
    boxDecoration = BoxDecoration(
        gradient: WidgetProps.getAppGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: AppColors.redGradien,
    ));
    Timer(Duration(milliseconds: 50), () {
      setState(() {
        _alignment= Alignment.bottomCenter;
      });
    });
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onNext();
        return false;
      },
      child: Stack(
        children: [
          Background(topColors: AppColors.redGradien, isWelcome: isWelcome),
          AnimatedAlign(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            onEnd: () {
              Navigator.of(context).pop();
            },
            alignment: _alignment,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppValue.horizontalMargin, vertical: 5.0),
              height: AppValue.screenHeight(context) / 1.55,
              width: AppValue.screenWidth(context),
              child: Material(
                elevation: 4.0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 50),
                  opacity: _opacity,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: AppValue.contentPadding,
                          child: Textview(
                              S.of(context).welcomeTitle,
                              20.0,
                              FontWeight.w600,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                        ),
                        Padding(
                          padding: AppValue.contentPadding,
                          child: Textview(
                              S.of(context).welcomeDescription,
                              13.0,
                              FontWeight.w300,
                              AppColors.welcomeTextColor,
                              TextAlign.center),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: AppValue.contentPadding,
                              child: HeroButton(
                                width: AppValue.screenWidth(context),
                                height: AppValue.customButtonHeight,
                                title: S.of(context).welcomeButtonTitle,
                                gradient: WidgetProps.getAppGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.bottomCenter,
                                  colors: AppColors.welcomeButton,
                                ),
                                onPressed: () {
                                  isForward = true;
                                  onNext();
                                },
                                radius: AppValue.customButtonRadius,
                                textColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: AppValue.contentPadding,
                              child: Textview(
                                  S.of(context).welcomeNoAccount,
                                  13.0,
                                  FontWeight.w300,
                                  AppColors.noAccTextColor,
                                  TextAlign.center),
                            ),
                            Padding(
                              padding: AppValue.contentPadding,
                              child: Column(
                                children: [
                                  Textview(
                                      S.of(context).welcomeTerms1,
                                      10.0,
                                      FontWeight.w300,
                                      AppColors.welcomeTextColor,
                                      TextAlign.center),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Textview(
                                          S.of(context).welcomeTerms2,
                                          10.0,
                                          FontWeight.w300,
                                          AppColors.noAccTextColor,
                                          TextAlign.center),
                                      Textview(
                                          S.of(context).welcomeTerms3,
                                          10.0,
                                          FontWeight.w300,
                                          AppColors.welcomeTextColor,
                                          TextAlign.center),
                                      Textview(
                                          S.of(context).welcomeTerms4,
                                          10.0,
                                          FontWeight.w300,
                                          AppColors.noAccTextColor,
                                          TextAlign.center),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 4.5,
                              width: AppValue.screenWidth(context) / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }

  void onNext() {
    setState(() {
      isWelcome = false;
      _alignment = Alignment.center;
      _opacity = 0.0;
    });
  }
}
