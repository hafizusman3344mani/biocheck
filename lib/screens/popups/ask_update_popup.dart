import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/popups/update_success_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AskUpdatePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.45),
      body: Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          height: 557.0,
          width: AppValue.screenWidth(context),
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Flexible(
                        child: HeroButton(
                          width: AppValue.screenWidth(context) / 2,
                          height: AppValue.customButtonHeight,
                          title: S.of(context).UpdatePopupNo,
                          gradient: WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.redGradien,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          radius: 0.0,
                          textColor: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: HeroButton(
                          width: AppValue.screenWidth(context) / 2,
                          height: AppValue.customButtonHeight,
                          title: S.of(context).UpdatePopupYes,
                          gradient: WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.parrotGreen,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return UpdateSuccessPopup();
                                //return NudgePopup(S.of(context).downCurveTitle,S.of(context).downCurveDes,GlobalResources.down_curvePath);
                              },
                            );

                          },
                          radius: 0.0,
                          textColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GetIcon(
                          path: GlobalResources.ic_ask_update,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 38.0),
                          child: Textview(
                              S.of(context).UpdatePopupTitle,
                              20.0,
                              FontWeight.w300,
                              AppColors.dashboardTextColor,
                              TextAlign.center),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Textview(
                                  'V.1.17.8a',
                                  13.0,
                                  FontWeight.w900,
                                  AppColors.dashboardTextColor,
                                  TextAlign.center),
                              Textview(
                                  ' - 16.11.2020',
                                  13.0,
                                  FontWeight.w300,
                                  AppColors.dashboardTextColor,
                                  TextAlign.center),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Textview(
                              S.of(context).UpdatePopupSubTitle,
                              13.0,
                              FontWeight.w300,
                              AppColors.dashboardTextColor,
                              TextAlign.center),
                        )
                      ],
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
}
