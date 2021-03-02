import 'package:biocheck/common/ui_widgets/appbar2.dart';
import 'package:biocheck/common/ui_widgets/switch/xlive_switch.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AudioSettings extends StatefulWidget {
  @override
  _AudioSettingsState createState() => _AudioSettingsState();
}

class _AudioSettingsState extends State<AudioSettings> {
  bool audioToggle = false;
  bool audioSettingsZoneChange = false;
  bool audioSettingsZone = false;
  bool audioSettingsTime = false;
  bool audioSettingsHeartbeat = false;
  bool audioSettingsSpeed = false;
  bool audioSettingsDistance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.commonAppbarHeight),
        child: DrawerItemsAppBar(S.of(context).navigationOption2,false),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding:WidgetProps.audioSettingsCommonPadding,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        XlivSwitch(
                          value: audioToggle,
                          onChanged: (value) {
                            setState(() {
                              audioToggle = !audioToggle;
                            });
                          },
                        ),
                        Textview(
                            S.of(context).audioSettingsOnOff,
                            19.0,
                            FontWeight.bold,
                            AppColors.welcomeTextColor,
                            TextAlign.end),
                      ],
                    ),
                    Textview(
                        S.of(context).audioSettingsGuidance,
                        15.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor
                            .withOpacity(audioToggle ? 0.6 : 0.2),
                        TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding:WidgetProps.audioSettingsCommonPadding,
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Textview(S.of(context).audioSettingsInterval, 19.0, FontWeight.bold, AppColors.welcomeTextColor,
                            TextAlign.end),
                        Textview(S.of(context).audioSettingsClickHere1, 14.0, FontWeight.normal,
                            AppColors.noAccTextColor, TextAlign.end),
                      ],
                    ),
                    Textview("5 minuten", 26.0, FontWeight.normal,
                        AppColors.welcomeTextColor, TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding:WidgetProps.audioSettingsCommonPadding,
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
                          value: audioSettingsZoneChange,
                          onChanged: (value) {
                            setState(() {
                              audioSettingsZoneChange = !audioSettingsZoneChange;
                            });
                          },
                        ),
                        Textview(
                            S.of(context).audioSettingsZoneChange,
                            19.0,
                            FontWeight.bold,
                            AppColors.welcomeTextColor,
                            TextAlign.end),
                      ],
                    ),
                    Textview(
                        S.of(context).audioSettingsZoneChangeHear,
                        15.0,
                        FontWeight.normal,
                        AppColors.welcomeTextColor
                            .withOpacity(audioSettingsZoneChange ? 0.6 : 0.2),
                        TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
             Padding(
               padding:WidgetProps.audioSettingsCommonPadding,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10.0),
                      child: Textview(
                          S.of(context).audioSettingsInfoDuring,
                          19.0,
                          FontWeight.bold,
                          AppColors.welcomeTextColor,
                          TextAlign.end),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10.0),
                      child: Textview(
                          S.of(context).audioSettingsInfoTypeSelect,
                          15.0,
                          FontWeight.normal,
                          AppColors.welcomeTextColor
                              .withOpacity(0.6),
                          TextAlign.end),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                XlivSwitch(
                                  value: audioSettingsZone,
                                  onChanged: (value) {
                                    setState(() {
                                      audioSettingsZone = !audioSettingsZone;
                                    });
                                  },
                                ),
                                Textview(
                                    S.of(context).audioSettingsZone,
                                    19.0,
                                    FontWeight.bold,
                                    AppColors.welcomeTextColor.withOpacity(0.7),
                                    TextAlign.end),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                XlivSwitch(
                                  value: audioSettingsTime,
                                  onChanged: (value) {
                                    setState(() {
                                      audioSettingsTime = !audioSettingsTime;
                                    });
                                  },
                                ),
                                Textview(
                                    S.of(context).audioSettingsTime,
                                    19.0,
                                    FontWeight.bold,
                                    AppColors.welcomeTextColor.withOpacity(0.7),
                                    TextAlign.end),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                XlivSwitch(
                                  value: audioSettingsHeartbeat,
                                  onChanged: (value) {
                                    setState(() {
                                      audioSettingsHeartbeat = !audioSettingsHeartbeat;
                                    });
                                  },
                                ),
                                Textview(
                                    S.of(context).audioSettingsHeartbeat,
                                    19.0,
                                    FontWeight.bold,
                                    AppColors.welcomeTextColor.withOpacity(0.7),
                                    TextAlign.end),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                XlivSwitch(
                                  value: audioSettingsSpeed,
                                  onChanged: (value) {
                                    setState(() {
                                      audioSettingsSpeed = !audioSettingsSpeed;
                                    });
                                  },
                                ),
                                Textview(
                                    S.of(context).audioSettingsSpeed,
                                    19.0,
                                    FontWeight.bold,
                                    AppColors.welcomeTextColor.withOpacity(0.7),
                                    TextAlign.end),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                XlivSwitch(
                                  value: audioSettingsDistance,
                                  onChanged: (value) {
                                    setState(() {
                                      audioSettingsDistance = !audioSettingsDistance;
                                    });
                                  },
                                ),
                                Textview(
                                    S.of(context).audioSettingsDistance,
                                    19.0,
                                    FontWeight.bold,
                                    AppColors.welcomeTextColor.withOpacity(0.7),
                                    TextAlign.end),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:10.0),
                            child: WidgetProps.divider,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:WidgetProps.audioSettingsCommonPadding,
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Textview(S.of(context).audioSettingsIntervalAT, 19.0, FontWeight.bold, AppColors.welcomeTextColor,
                            TextAlign.end),
                        Textview(S.of(context).audioSettingsClickHere1, 14.0, FontWeight.normal,
                            AppColors.noAccTextColor, TextAlign.end),
                      ],
                    ),
                    Textview("20 seconden", 26.0, FontWeight.normal,
                        AppColors.welcomeTextColor, TextAlign.end),
                    WidgetProps.divider,
                  ],
                ),
              ),
            ),
            Padding(
              padding:WidgetProps.audioSettingsCommonPadding,
              child: Container(
                height: AppValue.screenHeight(context) * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Textview(S.of(context).audioSettingsIntervalAT, 19.0, FontWeight.bold, AppColors.welcomeTextColor,
                            TextAlign.end),
                        Textview(S.of(context).audioSettingsClickToOpenSpeech, 14.0, FontWeight.normal,
                            AppColors.noAccTextColor, TextAlign.end),
                      ],
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

  Widget getCommonToggle(String string,bool toggle)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          XlivSwitch(
            value: toggle,
            onChanged: (value) {
              setState(() {
                toggle = !toggle;
              });
            },
          ),
          Textview(
              string,
              19.0,
              FontWeight.bold,
              AppColors.welcomeTextColor.withOpacity(0.7),
              TextAlign.end),
        ],
      ),
    );
  }
}
