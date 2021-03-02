import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class FadeWidget extends StatefulWidget {
  Widget child;
  int milisec;
  Curve curve;

  FadeWidget({this.child,this.milisec,this.curve});

  @override
  _FadeWidgetState createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: widget.milisec),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: widget.curve??Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: widget.child,
      );
    //);
  }
}
