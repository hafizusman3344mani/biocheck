import 'dart:async';
import 'dart:typed_data';

import 'package:biocheck/common/models/startup_slider_model.dart';
import 'package:biocheck/common/tts_file.dart';
import 'package:biocheck/common/ui_widgets/faded_widget2.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/page_indicator/custom_effect.dart';
import 'package:biocheck/common/ui_widgets/page_indicator/show_indicator.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/infrastructure/core/tts_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/common_background_start_screen.dart';
import 'package:biocheck/screens/dashboard/dashboard1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StartupGuide extends StatefulWidget {
  @override
  _StartupGuideState createState() => _StartupGuideState();
}

class _StartupGuideState extends State<StartupGuide> {
  final controller = PageController();
  final ttsController = Get.put(TTSController());
  List<SliderModel> pagesData;
  var currentIndexPage = 0.0;
  ShapeBorder shape = CircleBorder();
  List<Color> cGradient = AppColors.redGradien;

  var radius = 25.0;
  bool isPlayed = false;

  @override
  Widget build(BuildContext context) {
    if (!isPlayed) {
      speak();
    }
    pagesData = [];
    pagesData.add(SliderModel(
        S.of(context).slider1Title,
        S.of(context).slider1Description,
        GlobalResources.slider1ImagePath,
        AppColors.redGradien,
        false));
    pagesData.add(SliderModel(
        S.of(context).slider2Title,
        S.of(context).slider2Description,
        GlobalResources.slider2ImagePath,
        AppColors.parrotGreen,
        false));
    pagesData.add(SliderModel(
        S.of(context).slider3Title,
        S.of(context).slider3Description,
        GlobalResources.slider3ImagePath,
        AppColors.welcomeButton,
        false));
    return Scaffold(
      body: Stack(
        children: [
          Background(
            isWelcome: false,
            topColors: AppColors.parrotGreen,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white,
              ),
              height: AppValue.screenHeight(context) / 1.25,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  left: AppValue.horizontalMargin,
                  right: AppValue.horizontalMargin),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                elevation: 4.0,
                child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: pagesData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndexPage = index.toDouble();
                      cGradient = pagesData[index].gradient;
                    });
                  },
                  itemBuilder: (context, pageIndex) {
                    return Container(
                      child: Stack(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Positioned(
                            right: 0.0,
                            left: 0.0,
                            top: 69.0,
                            child: SvgPicture.asset(
                              pagesData[pageIndex].image,
                              height: 165.0,
                              width: 163,
                            ),
                          ),
                          Positioned(
                            right: 0.0,
                            left: 0.0,
                            top: 284.0,
                            child: Textview(
                                pagesData[pageIndex].title,
                                21.0,
                                FontWeight.w300,
                                AppColors.dashboardTextColor,
                                TextAlign.center),
                          ),
                          Positioned(
                            right: 0.0,
                            left: 0.0,
                            top: 360.0,
                            child: Textview2(
                              title: pagesData[pageIndex].description,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                              color: AppColors.dashboardTextColor,
                              lineHeight: 1.8,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30.0),
              width: AppValue.screenWidth(context),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  ShowIndicator(
                    controller: controller,
                    count: 3,
                    effect: BubbleEffect(),
                  ),
                  Positioned(
                    right: 15.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getBottomButton(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomButton() {
    if (currentIndexPage > 1) {
      return GestureDetector(
        onTap: () => proceed(),
        behavior: HitTestBehavior.translucent,
        child: GetIcon(
          path: GlobalResources.ic_check,
          color: AppColors.dashboardTextColor,
          width: 28.0,
          height: 28.0,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => proceed(),
        behavior: HitTestBehavior.translucent,
        child: FadeWidget2(
          milisec: 600,
          curve: Curves.easeInOutCirc,
          child: Textview(
            S.of(context).sliderScreenButton,
            20.0,
            FontWeight.normal,
            AppColors.welcomeTextColor,
            TextAlign.justify,
          ),
        ),
      );
    }
  }

  proceed() {
    Navigator.of(context).pushReplacement(RoutePageSlideFromRight(
      builder: (context) => DashboardFirst(),
    ));
  }

  void speak() async {
    isPlayed = true;
    await ttsController.speak(S.of(context).FirstTimeLogin);
  }
}
