import 'package:biocheck/common/utils/colors.dart';
import 'package:flutter/widgets.dart';

import 'textview.dart';

class DrawerItem extends StatelessWidget {
  String title;
  Function onTap;

  DrawerItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Textview(title, 28.0, FontWeight.normal,
            AppColors.textColorMode, TextAlign.end),
      ),
    );
  }
}
