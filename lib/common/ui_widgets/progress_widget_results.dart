import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // return getLevelsWidget();
  }


  Widget getLevelsWidget(List<Color> colors, String title, String subTitle,double progress) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
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
                height: 57.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textview(title, 20.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.center),
                    Textview(subTitle, 30.0, FontWeight.normal,
                        AppColors.welcomeTextColor, TextAlign.center),
                  ],
                ),
              ),
            ),
            Material(
              child: Container(
                height: 16.0,
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
      ),
    );
  }
}
