import 'package:biocheck/common/ui_widgets/common_bottom_bar2.dart';
import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateSuccessPopup extends StatelessWidget {
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: BottomBar2(
                      gradient: WidgetProps.getAppGradient(
                          colors: AppColors.parrotGreen,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      childs: [
                        GestureDetector(
                          child: GetIcon(
                            width: 35.47,
                            height: 27.56,
                            path: GlobalResources.ic_check,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
                          path: GlobalResources.ic_update_success,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 38.0),
                          child: Textview(
                              S.of(context).UpdatePopupSuccess,
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
                            '- breathing guidance in rest measurement',
                            13.0,
                            FontWeight.w300,
                            AppColors.dashboardTextColor,
                            TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0),
                          child: Textview(
                            '- Achievements',
                            13.0,
                            FontWeight.w300,
                            AppColors.dashboardTextColor,
                            TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0),
                          child: Textview(
                           '- bug fixes',
                            13.0,
                            FontWeight.w300,
                            AppColors.dashboardTextColor,
                            TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0),
                          child: Textview(
                            '- new layout',
                            13.0,
                            FontWeight.w300,
                            AppColors.dashboardTextColor,
                            TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0),
                          child: Textview(
                            '- added calendar function',
                            13.0,
                            FontWeight.w300,
                            AppColors.dashboardTextColor,
                            TextAlign.center,
                          ),
                        ),
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
