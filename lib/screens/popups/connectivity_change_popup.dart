import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConnectionPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.85),
      body: Center(
        child: Container(
          height: AppValue.screenHeight(context) / 1.5,
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:35.0),
                      child: Image.asset(GlobalResources.connectionPath),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textview(S.of(context).connectTitle, 24.0, FontWeight.w600,
                        AppColors.dashboardTextColor, TextAlign.center),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Textview(
                      S.of(context).connectDesc,
                      14.0,
                      FontWeight.w600,
                      AppColors.dashboardTextColor.withOpacity(0.5),
                      TextAlign.center),
                ),
                Row(
                  children: [
                    Flexible(
                      child: HeroButton(
                        width: AppValue.screenWidth(context) / 2,
                        height: AppValue.customButtonHeight,
                        title: S.of(context).restartTitle,
                        gradient:
                        WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.redGradien,
                        ),
                        onPressed: () {
                          ConnectivityPolar.restart;
                        },
                        radius: 0.0,
                        textColor: Colors.white,
                      ),
                    ),
                    Flexible(
                      child: HeroButton(
                        width: AppValue.screenWidth(context) / 2,
                        height: AppValue.customButtonHeight,
                        title: S.of(context).getOnTitle,
                        gradient:
                        WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.parrotGreen,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        radius: 0.0,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
