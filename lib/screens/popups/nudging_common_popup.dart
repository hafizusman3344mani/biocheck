import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/screens/popups/common_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NudgePopup extends StatelessWidget {

  String title;
  String description;
  String icon;


  NudgePopup(this.title, this.description, this.icon);

  @override
  Widget build(BuildContext context) {
    return CommonPopup(getPopup(context), 5.0, 0.0);
  }

  Widget getPopup(BuildContext context)
  {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:35.0),
                child: Image.asset(icon),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Textview(title, 24.0, FontWeight.w600,
                  AppColors.dashboardTextColor, TextAlign.center),
            ],
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Textview(
                description,
                14.0,
                FontWeight.w600,
                AppColors.dashboardTextColor.withOpacity(0.5),
                TextAlign.center),
          ),
          Row(
            children: [
              Flexible(
                child: BottomBar(
                  gradient:
          WidgetProps.getAppGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.parrotGreen,
          )
                 ,
                  childs: [
                    GestureDetector(
                      onTap: (){


                      },
                      child: GetIcon(
                        height: 48.0,
                        width: 48.0,
                        color: Colors.white,
                        path: GlobalResources.ic_check,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
