import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'get_icon.dart';
import 'textview.dart';

class DrawerItemsAppBar extends StatelessWidget {
  String title;
  bool centerTitle;
  DrawerItemsAppBar(this.title,this.centerTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.commonAppbarColor,
      elevation: 0.0,
      title: Textview(title,20.0,FontWeight.w300,AppColors.welcomeTextColor,TextAlign.start),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child:  GetIcon(
              height: 18.0,
              width: 18.0,
              color: AppColors.dashboardTextColor,
              path: GlobalResources.ic_close,
            ),
          ),
        )
      ],
    );
  }
}
