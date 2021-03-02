import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstMeasurePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.45),
      body: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
          height: AppValue.screenHeight(context) / 1.5,
          margin: EdgeInsets.only(bottom: 100.0, left: 20.0, right: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: GetIcon(
                                path: GlobalResources.measureheartPath,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textview(
                                S.of(context).measuring1,
                                24.0,
                                FontWeight.w300,
                                AppColors.dashboardTextColor,
                                TextAlign.center),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 5.0, right: 5.0),
                          child: Column(
                            children: [
                              Textview2(
                                title: S.of(context).measuring1Desc,
                                color:
                                    AppColors.dashboardTextColor.withOpacity(0.7),
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                                textAlign: TextAlign.center,
                                lineHeight: 1.4,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                    gradient: WidgetProps.getAppGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.parrotGreen,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottomNavItem2(
                        icon: GlobalResources.ic_check,
                        iconColor: Colors.white,
                        height: 25.0,
                        width: 25.0,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
