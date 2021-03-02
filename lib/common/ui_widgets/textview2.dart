import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Textview2 extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign textAlign;
  double letterSpacing;
  double lineHeight;

  Textview2(
      {this.title,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.lineHeight,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return  Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          letterSpacing: letterSpacing,
          height: lineHeight,
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize,
        ),
    );
  }
}
class Textview3 extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign textAlign;
  double letterSpacing;
  double lineHeight;

  Textview3(
      {this.title,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.textAlign,
        this.lineHeight,
        this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValue.screenWidth(context),
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          letterSpacing: letterSpacing,
          height: lineHeight,
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}