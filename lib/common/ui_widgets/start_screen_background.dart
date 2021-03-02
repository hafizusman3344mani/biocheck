import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundScreen1 extends StatelessWidget {
  final Gradient screenGradient;
  final Widget body;

  BackgroundScreen1({this.screenGradient, this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(gradient: screenGradient),
              height: MediaQuery.of(context).size.height / 2,
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ],
        ),
       Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0)),),
            height: MediaQuery.of(context).size.height/ 1.4,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
                vertical: AppValue.verticalMargin,
                horizontal: AppValue.horizontalMargin),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Center(
                child: body,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
      ],
    );
  }
}
