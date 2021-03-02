import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Background extends StatelessWidget {
  List<Color> topColors;
  bool isWelcome;

  Background({this.topColors, this.isWelcome});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: topColors,
                  ),
                ),
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ],
        ),
        Positioned(
          top: 35.0,
          left: AppValue.horizontalMargin - 2.0,
          right: AppValue.horizontalMargin - 2.0,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: isWelcome ? 1.0 : 0.0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        GlobalResources.welcomeBannerPath,
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(5.0)),
              height: AppValue.screenHeight(context) / 3.7,
              width: AppValue.screenWidth(context),
            ),
          ),
        )
      ],
    );
  }
}
