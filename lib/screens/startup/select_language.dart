import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/preferences.dart';
import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/infrastructure/common/startup.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/main.dart';
import 'package:biocheck/screens/authentication/login.dart';
import 'package:biocheck/screens/common/common_background_start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  AlignmentGeometry _alignment = Alignment.center;
  double opacityFlags = 1.0;
  double opacityWelcome = 1.0;
  double opacityLogin = 1.0;
  bool isForward = true;
  bool isWelcome = false;
  bool isPop = false;

  var duration = 500;

  var startupController = Get.put(StartupController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartupController>(
      init: startupController,
      builder: (_) {
        return KeyboardVisibilityProvider(
          child: WillPopScope(
          onWillPop: () async {
            print('asdasdasdas');
            if (startupController.isWelcomeScreen) {
              opacityWelcome = 0.0;
              isWelcome = false;
              _alignment = Alignment.center;
              isPop = true;
              isForward = true;
              startupController.updateBuilder();
            } else if (startupController.isLogin) {
              isWelcome = true;
              opacityLogin = 0.0;
              _alignment = Alignment.bottomCenter;
              isPop = true;
              isForward = true;
              startupController.updateBuilder();
            } else {}
            return false;
          },
          child: Stack(
            children: [
              Background(topColors: AppColors.redGradien, isWelcome: isWelcome),
              buildBody(),
            ],
          ),
        ));
      },
    );
  }

  Widget buildBody() {
    return Stack(
      children: [
        AnimatedAlign(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
          onEnd: () {
            if (isForward) {
              if (startupController.isWelcomeScreen && isPop) {
                startupController.isLanguage = true;
                startupController.isWelcomeScreen = false;
                opacityFlags = 1.0;
                isForward = false;
                startupController.updateBuilder();
              } else if (startupController.isWelcomeScreen && !isPop) {
                startupController.isLogin = true;
                startupController.isWelcomeScreen = false;
                opacityLogin = 1.0;
                isForward = false;
                startupController.updateBuilder();
              } else if (startupController.isLogin && isPop) {
                startupController.isLogin = false;
                startupController.isWelcomeScreen = true;
                opacityWelcome = 1.0;
                isForward = false;
                startupController.updateBuilder();
              } else if (startupController.isLanguage && !isPop) {
                startupController.isLanguage = false;
                startupController.isWelcomeScreen = true;
                opacityWelcome = 1.0;
                startupController.updateBuilder();
              } else {
                startupController.isLanguage = false;
                startupController.isWelcomeScreen = true;
                startupController.updateBuilder();
              }
            }
          },
          alignment: _alignment,
          child: Container(
            height: AppValue.screenHeight(context) / AppValue.cardHeight,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
                horizontal: AppValue.horizontalMargin, vertical: 5.0),
            child: Material(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        child(),
      ],
    );
  }

  Widget child() {
    if (startupController.isLanguage) {
      return languagePage();
    } else if (startupController.isLogin) {
      return loginPage();
    } else {
      return welcomePage();
    }
  }

  //////////////////The Card Pages that dynamically comes into play//////////////////////////////

  //region SelectLanguage Area
  Widget languagePage() {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOpacity(
          opacity: opacityFlags,
          curve: AppValue.opacityCurve,
          duration: Duration(milliseconds: AppValue.opacityDuration),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getElevatedImage(GlobalResources.bn, 'nl'),
                  _getElevatedImage(GlobalResources.united, 'en'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getElevatedImage(GlobalResources.bg, 'bg'),
                  _getElevatedImage(GlobalResources.fr, 'fr'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getElevatedImage(String path, String lng) {
    return GestureDetector(
      onTap: () async {
        if(lng=='nl' || lng=='en') {
          await SharedPref.save(Constants.appLocale, lng);
          //Get.find<LocaleController>().setlocale();
          //Get.find<LocaleController>().updateLocale();

          Locale newLocale = Locale(lng);
          HomePage.setLocale(context, newLocale);
          onFlagSelect();
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Container(
            width: 100.0,
            height: 65.0,
            child: SvgPicture.asset(
              path,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  onFlagSelect() {
    isWelcome = true;
    isForward = true;
    opacityFlags = 0.0;
    isPop = false;
    _alignment = Alignment.bottomCenter;
    startupController.updateBuilder();

/*    setState(() {

    });
    Navigator.of(context)
        .push(
      RoutePage(
        builder: (context) => Welcome(),
      ),
    )
        .then((value) {
      opacityFlags = 1.0;
      isForward = false;
      startupController.updateBuilder();
    });*/
  }

  //endregion

  //region WelcomePage Area

  Widget welcomePage() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        opacity: opacityWelcome,
        curve: AppValue.opacityCurve,
        duration: Duration(milliseconds: AppValue.opacityDuration),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.6,
          margin: EdgeInsets.symmetric(
              horizontal: AppValue.horizontalMargin + 5, vertical: 5.0),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      onWelcomeClick();
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
                  margin: EdgeInsets.only(bottom: 10.0),
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
          ),
        ),
      ),
    );
  }

  onWelcomeClick() {
    isWelcome = false;
    isForward = true;
    opacityWelcome = 0.0;
    isPop = false;
    _alignment = Alignment.center;
    startupController.updateBuilder();
  }

  //endregion

  //region LoginPageArea

  Widget loginPage() {
    return AnimatedOpacity(
      opacity: opacityLogin,
      curve: AppValue.opacityCurve,
      duration: Duration(milliseconds: AppValue.opacityDuration),
      child: Login(),
    );
  }
//endregion

}
