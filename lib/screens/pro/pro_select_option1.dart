import 'package:biocheck/common/ui_widgets/common_dashboard.dart';
import 'package:biocheck/common/ui_widgets/custom_innershadow_widget.dart';
import 'package:biocheck/common/ui_widgets/inner_shadow.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/popups/upgrade_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pro_measuring.dart';
import 'search_pro.dart';

class ProOptions1 extends StatefulWidget {
  @override
  _ProOptions1State createState() => _ProOptions1State();
}

class _ProOptions1State extends State<ProOptions1> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
        WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.startButtonPopup,
        ),
      Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          height: AppValue.screenHeight(context) / 1.5,
          child: Center(
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getOption1(S.of(context).marthSchema),
                  getOption2(S.of(context).halfMarthSchema),
                  getOption2(S.of(context).schema10),
                ],
              ),
            ),
          ),
        ),
      ),
      AppColors.dashboardTextColor.withOpacity(0.8),
    );
  }

  Widget getOption1(String title) {
    return GestureDetector(
      onTap: () {
        WidgetProps.goToNextPage(context, ProMeasurement());

      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:15.0,vertical: 10.0),
        child: Container(
          width: AppValue.screenWidth(context),
          height: 100.0,
          child: Material(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            elevation: 4.0,
            child:Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.only(left:15.0),
                child: Textview(
                  title,
                  25.0,
                  FontWeight.w300,
                  AppColors.dashboardTextColor,
                  TextAlign.left,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getOption2(String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return UpgradePopup();
          },
        );
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:15.0,vertical: 10.0),
        child:ShadowedWidget(
          height: 100.0,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFF8F8F8),
            ),

            child: Textview(
              title,
              25.0,
              FontWeight.w300,
              AppColors.dashboardTextColor.withOpacity(0.5),
              TextAlign.left,
            ),
          ),
        )
      ),
    );
  }
}
