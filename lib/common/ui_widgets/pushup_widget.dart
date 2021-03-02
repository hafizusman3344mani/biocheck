import 'package:biocheck/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PushupWidget extends StatefulWidget {

  Widget child;


  PushupWidget({this.child});

  @override
  _PushupWidgetState createState() => _PushupWidgetState();
}

class _PushupWidgetState extends State<PushupWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Constants.backout));

    _offsetFloat.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        _controller.reverse();
        return true;
      },
      child: SlideTransition(
        position: _offsetFloat,
        child: widget.child,
      ),
    );
  }

}
