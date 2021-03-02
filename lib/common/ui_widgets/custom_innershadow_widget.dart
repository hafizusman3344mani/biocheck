import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'inner_shadow.dart';
import 'textview2.dart';

class ShadowedWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  ShadowedWidget({this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEBEBEB).withOpacity(0.4),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: InnerShadow(
        blur: 2,
        color: Colors.white.withOpacity(0.9),
        offset:  Offset(-6.0, -6.0),
        child: Container(
          child: InnerShadow(
            blur: 2,
            color: Colors.grey.withOpacity(0.15),
            offset:  Offset(6.0, 6.0),
            child: child,
          ),
        ),
      ),
    );
  }
}


class ShadowedWidget2 extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  ShadowedWidget2({this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.bodyColorMode.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: InnerShadow(
        blur: 2,
        color: Colors.grey.withOpacity(0.15),
        offset:  Offset(-6.0, -6.0),
        child: Container(
          child: InnerShadow(
            blur: 2,
            color:Colors.black.withOpacity(0.7) ,
            offset:  Offset(6.0, 6.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
