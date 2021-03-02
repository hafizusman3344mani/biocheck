import 'package:biocheck/common/ui_widgets/common_dashboard.dart';
import 'package:biocheck/common/ui_widgets/custom_innershadow_widget.dart';
import 'package:biocheck/common/ui_widgets/inner_shadow.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/popups/upgrade_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'pro_select_option1.dart';

class ProOptions extends StatefulWidget {
  @override
  _ProOptionsState createState() => _ProOptionsState();
}

class _ProOptionsState extends State<ProOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height:  AppValue.screenHeight(context) / 1.1,
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        elevation: 0.0,
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getOption1(GlobalResources.bikingPath),
                  getOption2(GlobalResources.runningPath),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Textview(
                    S.of(context).goProTitle,
                    24.0,
                    FontWeight.w300,
                    AppColors.dashboardTextColor,
                    TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getOption1(String image) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return UpgradePopup();
            },
          );
        },
        child: ShadowedWidget(
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFF7F7F7),
            ),
            child: SvgPicture.asset(image),
          ),
          width: 120.0,
          height: 100.0,
        ));
  }

  Widget getOption2(String image) {
    return GestureDetector(
      onTap: () {
        WidgetProps.goToNextPage(context, ProOptions1());
      },
      child: Container(
        width: 120.0,
        height: 100.0,
        child: Card(
          elevation: 4.0,
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
