import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/widgets.dart';

class BottomBar2 extends StatelessWidget {
  final Gradient gradient;
  final List<Widget> childs;

  BottomBar2({this.gradient, this.childs});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValue.commonAppbarHeight,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(3.0),bottomLeft: Radius.circular(3.0),)
      ),
      child: Row(
        mainAxisAlignment: childs.length > 1
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: childs,
      ),
    );
  }
}
