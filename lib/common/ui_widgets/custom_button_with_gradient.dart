import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroButton extends StatelessWidget {
  String title;
  Function onPressed;
  Gradient gradient;
  Color textColor;
  double height;
  double width;
  double radius;

  HeroButton({
      this.title, this.onPressed, this.gradient, this.height, this.width, this.radius,this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient:gradient ,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 18.0,fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
