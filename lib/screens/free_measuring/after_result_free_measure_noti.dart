import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';

class FreeMeasureAfterResultNotities extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<FreeMeasureAfterResultNotities> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

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
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Center(
                child: Textview('25 juli 2019 | 07:33', 14.0, FontWeight.w300,
                    AppColors.welcomeTextColor, TextAlign.right),
              ),
            ),
          ],
        ),
      ),
      body:  Center(
        child: Container(
          margin: EdgeInsets.only(left:10.0,right: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Textview(S.of(context).notities, 20.0, FontWeight.w300,
                  AppColors.welcomeTextColor, TextAlign.right),
              /*Textview(
                          S.of(context).notitie_heart_beat,
                          14.0,
                          FontWeight.w300,
                          AppColors.commonTextColorCronic,
                          TextAlign.right),*/
              SingleChildScrollView(
                child: TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.end,
                  style: WidgetProps.textStyleInputFiled,
                  decoration: InputDecoration(
                      hintText: S.of(context).notitieshint,
                      counter: Offstage(),
                      border: InputBorder.none
                  ),
                  maxLength: 500,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  height: 6.0,
                  width: AppValue.screenWidth(context) / 3,
                  decoration: BoxDecoration(
                    gradient: WidgetProps.getAppGradient(
                        colors: AppColors.parrotGreen,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Textview(S.of(context).FTWork, 20.0, FontWeight.w300,
                    AppColors.commonTextColorCronic, TextAlign.right),
              )
            ],
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
          BottomNavItem2(
            icon: GlobalResources.ic_check,
            iconColor: Colors.white,
            width: 35.47,
            height: 27.56,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
