import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final bool isOutline;
  final bool isFilled;
  final bool isStraight;

  Dot({this.radius,
    this.color,
    this.isFilled,
    this.isOutline,
    this.isStraight});

  @override
  Widget build(BuildContext context) {
    return newWid();
  }


  Widget newWid() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 200),
        width: this.radius,
        height: isStraight ? 2.0 :this.radius,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1.0),
          color: isFilled ? this.color : Colors.white,
          borderRadius: isStraight ? BorderRadius.circular(0.0) : BorderRadius
              .circular(30.0),
          shape: BoxShape.rectangle,
        ),
      ),
    );


    /*Widget newWid() {
    if (isFilled) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: this.radius,
          height: this.radius,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
      );
    } else if (isOutline) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: this.radius,
          height: this.radius,
          decoration: BoxDecoration(
            border: Border.all(color:this.color,width: 1.0),
            shape: BoxShape.circle,
          ),
        ),
      );
    }else
      {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: this.radius,
            height: 2,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: this.color,
            ),
          ),
        );
      }
  }*/
  }
}
