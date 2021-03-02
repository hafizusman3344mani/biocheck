import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/free_measuring/free_measure_result.dart';
import 'package:flutter/material.dart';

class FreeMeasureResultNotities extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<FreeMeasureResultNotities>  {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize:
                Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: AppLogo(),
            ),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: AppValue.screenHeight(context) / 1.7,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(55.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textview(S.of(context).notities, 20.0, FontWeight.w300,
                              AppColors.welcomeTextColor, TextAlign.center),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 10,
                          focusNode: _focusNode,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          style: WidgetProps.textStyleInputFiled,
                          decoration: InputDecoration(
                            hintText: S.of(context).notitieshint,
                              counter: Offstage(),
                              border: InputBorder.none
                          ),
                          maxLength: 500,
                        ),
                      ),
                      // child: Textview(
                      //     S.of(context).notitie_heart_beat,
                      //     14.0,
                      //     FontWeight.w300,
                      //     AppColors.commonTextColorCronic.withOpacity(0.5),
                      //     TextAlign.left),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(
            gradient: WidgetProps.getAppGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.parrotGreen,
            ),
            childs: [

              BottomNavItem3(
                  transition: LinkTransition.PushUp,
                  isFinished: Constants.REPLACE,
                  width: 25.47,
                  height: 17.56,
                  iconColor: Colors.white,
                  onTap: FreeMeasureResult(),
                  icon: GlobalResources.ic_check),
            ],
          ),
    );
  }
}
