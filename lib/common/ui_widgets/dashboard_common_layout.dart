import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/widgets.dart';

class DashboardLayoutCommon extends StatelessWidget {
  List<Widget> childs;

  DashboardLayoutCommon(this.childs);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValue.screenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: childs,
      ),
    );
  }
}
