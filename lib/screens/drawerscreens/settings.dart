import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/appbar2.dart';
import 'package:biocheck/common/ui_widgets/switch/xlive_switch.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/theme_color_mode.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/popups/select_language_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool shareWithWifi = false;
  bool darkMode = false;
  bool focusMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.commonAppbarHeight),
        child: DrawerItemsAppBar(S.of(context).navigationOption1, false),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textview(
                        S.of(context).settingsLastTested,
                        16.0,
                        FontWeight.bold,
                        AppColors.welcomeTextColor,
                        TextAlign.end),
                    Textview(187.toString(), 26.0, FontWeight.normal,
                        AppColors.noAccTextColor, TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            _getCommonListItem(S.of(context).settingsCVP, 51.toString()),
            _getCommonListItem(
                S.of(context).settingsFollowed, S.of(context).Vitality),
            _getCommonListItem(S.of(context).settingsAccountEnd, '12.12.2019'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                height: AppValue.screenHeight(context) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textview(
                        S.of(context).settingsZeroCheck,
                        16.0,
                        FontWeight.bold,
                        AppColors.welcomeTextColor,
                        TextAlign.end),
                    Textview(
                        S.of(context).settingsZeroCheckTitle,
                        15.0,
                        FontWeight.w600,
                        AppColors.noAccTextColor,
                        TextAlign.end),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Textview(
                          S.of(context).settingsZeroCheckDescription,
                          15.0,
                          FontWeight.normal,
                          AppColors.welcomeTextColor.withOpacity(0.6),
                          TextAlign.end),
                    ),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                height: AppValue.screenHeight(context) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textview(
                        S.of(context).settingsBreathing,
                        16.0,
                        FontWeight.bold,
                        AppColors.welcomeTextColor,
                        TextAlign.end),
                    Textview(
                        S.of(context).settingsBreathingTitle,
                        15.0,
                        FontWeight.w600,
                        AppColors.noAccTextColor,
                        TextAlign.end),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Textview(
                            S.of(context).settingsBreathingDescription,
                            15.0,
                            FontWeight.normal,
                            AppColors.welcomeTextColor.withOpacity(0.6),
                            TextAlign.end),
                      ),
                    ),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                height: AppValue.screenHeight(context) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textview(
                        S.of(context).settingsLanguage,
                        16.0,
                        FontWeight.bold,
                        AppColors.welcomeTextColor,
                        TextAlign.end),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SelectLanguagePopup();
                            //return NudgePopup(S.of(context).downCurveTitle,S.of(context).downCurveDes,GlobalResources.down_curvePath);
                          },
                        );
                      },
                      child: Textview(
                          S.of(context).settingsLanguageTitleLink,
                          15.0,
                          FontWeight.w600,
                          AppColors.noAccTextColor,
                          TextAlign.end),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Textview(
                            S.of(context).settingsLanguageDesc,
                            15.0,
                            FontWeight.normal,
                            AppColors.welcomeTextColor.withOpacity(0.6),
                            TextAlign.end),
                      ),
                    ),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding: WidgetProps.audioSettingsCommonPadding,
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        XlivSwitch(
                          value: darkMode,
                          onChanged: (value) {
                            setState(() {
                              darkMode = !darkMode;
                              ColorResources.instance.setMode(!ColorResources.instance.getMode);
                              AppColors.setProp();
                              HomePage.setTheme(context, 0);
                              focusMode = !darkMode;
                             // HomePage.setTheme(context, Constants.DARK);
                            });
                          },
                        ),
                        Textview(
                            S.of(context).DarkModeTitle,
                            19.0,
                            FontWeight.bold,
                            AppColors.welcomeTextColor,
                            TextAlign.end),
                      ],
                    ),
                    Textview(
                        S.of(context).DarkModeDesc,
                        15.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor
                            .withOpacity(darkMode ? 0.6 : 0.2),
                        TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding: WidgetProps.audioSettingsCommonPadding,
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        XlivSwitch(
                          value: focusMode,
                          onChanged: (value) {
                            setState(() {
                              focusMode = !focusMode;
                              darkMode = !focusMode;
                              //HomePage.setTheme(context, Constants.FOCUS);
                            });
                          },
                        ),
                        Textview(
                            S.of(context).FocusModeTitle,
                            19.0,
                            FontWeight.bold,
                            AppColors.welcomeTextColor,
                            TextAlign.end),
                      ],
                    ),
                    Textview(
                        S.of(context).FocusModeDesc,
                        15.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor
                            .withOpacity(focusMode ? 0.6 : 0.2),
                        TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        XlivSwitch(
                          value: shareWithWifi,
                          onChanged: (value) {
                            setState(() {
                              shareWithWifi = !shareWithWifi;
                            });
                          },
                        ),
                        Textview(
                            S.of(context).settingsUploadToggle,
                            16.0,
                            FontWeight.bold,
                            AppColors.welcomeTextColor,
                            TextAlign.end),
                      ],
                    ),
                    Flexible(
                      child: Textview(
                          S.of(context).settingsUploadToggleDescription,
                          15.0,
                          FontWeight.normal,
                          AppColors.welcomeTextColor
                              .withOpacity(shareWithWifi ? 0.6 : 0.2),
                          TextAlign.end),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: AppValue.screenWidth(context),
              height: AppValue.screenHeight(context) * .30,
              color: AppColors.commonAppbarColor.withOpacity(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      GlobalResources.logoPath,
                      width: 76.0,
                      height: 76.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textview('BioCheck', 16.0, FontWeight.bold,
                            AppColors.welcomeTextColor, TextAlign.start),
                        Textview('1.47.37 (251473700)', 13.0, FontWeight.normal,
                            AppColors.welcomeTextColor, TextAlign.start)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                height: AppValue.screenHeight(context) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textview(S.of(context).SendDebug, 16.0, FontWeight.bold,
                        AppColors.welcomeTextColor, TextAlign.end),
                    GestureDetector(
                      onTap: () {},
                      child: Textview(
                          S.of(context).SendDebugValue,
                          15.0,
                          FontWeight.w600,
                          AppColors.noAccTextColor,
                          TextAlign.end),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Textview(
                            S.of(context).SendDebugDesc,
                            15.0,
                            FontWeight.normal,
                            AppColors.welcomeTextColor.withOpacity(0.6),
                            TextAlign.end),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCommonListItem(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Container(
        height: AppValue.screenHeight(context) * .15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Textview(title, 16.0, FontWeight.bold, AppColors.welcomeTextColor,
                TextAlign.end),
            Textview(subTitle, 26.0, FontWeight.normal,
                AppColors.welcomeTextColor, TextAlign.end),
            WidgetProps.divider,
          ],
        ),
      ),
    );
  }
}
