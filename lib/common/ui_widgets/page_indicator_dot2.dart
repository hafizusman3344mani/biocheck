import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dot2 extends StatelessWidget {
  final double radius;
  final Color color;
  final bool isOutline;
  final bool isFilled;
  final bool isStraight;

  Dot2({this.radius,
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
        height: this.radius,
        decoration: BoxDecoration(
          color: isFilled ? this.color : Colors.grey.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
