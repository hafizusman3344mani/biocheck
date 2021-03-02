import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatelessWidget {
  final Gradient gradient;
  final List<Widget> childs;

  BottomBar({this.gradient, this.childs});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValue.commonBottomAppbarHeight,
      decoration: BoxDecoration(gradient: gradient),
      child: Row(
        mainAxisAlignment: childs.length>1? MainAxisAlignment.spaceAround:MainAxisAlignment.center,
        children: childs,
      ),
    );
  }
}
