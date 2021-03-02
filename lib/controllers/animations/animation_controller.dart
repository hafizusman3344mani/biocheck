import 'package:biocheck/common/constants.dart';
import 'package:flutter/widgets.dart';

class Animations {
  static AnimationController getSlidePageCOntroller(TickerProvider provider) {
    return AnimationController(
      vsync: provider,
      duration: Duration(milliseconds: 150),
    );
  }

  static AnimationController getSlideAnimationController(
      TickerProvider provider, int milisec) {
    return AnimationController(
      vsync: provider,
      duration: Duration(milliseconds: milisec),
    );
  }

  static AnimationController getAlignmentSlideAnimationController(
      TickerProvider provider, int sec) {
    return AnimationController(
      vsync: provider,
      duration: Duration(seconds: sec),
    );
  }

  static AnimationController getScaleAnimationController(
      TickerProvider provider,
      int milisec,
      double upperBound,
      double lowerBound) {
    return AnimationController(
        vsync: provider,
        lowerBound: lowerBound,
        upperBound: upperBound,
        duration: Duration(milliseconds: milisec));
  }

  static Tween<Offset> getSlideOffset(double x, double y) {
    return Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
  }

  static Animation<Offset> getSlidePageOffset(
      Offset x, Offset y, AnimationController parent) {
    return Tween<Offset>(begin: x, end: y).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.bounceIn,
      ),
    );
  }

  static AlignmentGeometryTween getAlignmentTween(
      AlignmentGeometry begin, AlignmentGeometry end) {
    return AlignmentGeometryTween(begin: begin, end: end);
  }

  static CurvedAnimation getPushupTween(AnimationController controller) {
    return CurvedAnimation(
      parent: controller,
      curve: Constants.backout,
    );
  }
}
