import 'package:biocheck/common/ui_widgets/common_bottom_bar2.dart';
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

class ScheduleToday extends StatefulWidget {
  @override
  _ScheduleTodayState createState() => _ScheduleTodayState();
}

class _ScheduleTodayState extends State<ScheduleToday> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.45),
      body:  Center(
        child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Textview2(
                      title: S.of(context).ScheduleToday,
                      color: AppColors.dashboardTextColor.withOpacity(0.8),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 30.0),
                    child: Column(
                      children: [
                        getLevelsWidget(
                            AppColors.welcomeButton, 'Warming up', "2",AppValue.screenWidth(context)/3),
                        getLevelsWidget(AppColors.lemoneYellow, 'Endurance 1', "4",AppValue.screenWidth(context)/9),
                        getLevelsWidget(AppColors.parrotGreen, 'Endurance 2', "3",AppValue.screenWidth(context)/1.5),
                        getLevelsWidget(AppColors.purpleBlue, 'Endurance 3', "1",AppValue.screenWidth(context)/6.5),
                        getLevelsWidget(
                            AppColors.welcomeButton, 'Cooling down', "2",AppValue.screenWidth(context)/3),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
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
                ],
              ),
            ),
          ),
      ),
    );
  }
  Widget getLevelsWidget(List<Color> colors, String title, String subTitle,double progress) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3.0),
                  topLeft: Radius.circular(3.0)),
              elevation: 4.0,
              child: Container(
                height: 30.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textview(title, 14.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.center),
                    Textview(subTitle+" min", 14.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.center),
                  ],
                ),
              ),
            ),
            Material(
              child: Container(
                height: 10.0,
                width: progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(3.0),
                      bottomLeft: Radius.circular(3.0)),
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
