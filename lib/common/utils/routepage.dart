import 'package:biocheck/common/ui_widgets/custom_curves.dart';
import 'package:flutter/material.dart';

class RoutePage<T> extends MaterialPageRoute<T> {
  RoutePage({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

class RoutePageSlideFromRight<T> extends MaterialPageRoute<T> {
  RoutePageSlideFromRight({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new SlideTransition(
      position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(animation),
      child: child,
    );
  }
}

class RoutePageSlideFromBottom<T> extends MaterialPageRoute<T> {
  RoutePageSlideFromBottom({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    Curve backOut = BackOutCurve();
    var curve = backOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));


    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

class RoutePageSlideFromTop<T> extends MaterialPageRoute<T> {
  RoutePageSlideFromTop({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    var begin = Offset(0.0, -1.0);
    var end = Offset.zero;
    Curve backOut = BackOutCurve();
    var curve = backOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

class RoutePageFaded<T> extends MaterialPageRoute<T> {
  RoutePageFaded({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
      child: child,
    );
  }
}
