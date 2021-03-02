import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey;
  bool withDrawer;

  CustomAppBar(this._scaffoldKey,this.withDrawer);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: AppLogo(),
      actions: [
        withDrawer ?Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: ()
            {
              _scaffoldKey.currentState.openEndDrawer();
            },
            child: GetIcon(
              path:GlobalResources.ic_menu,
              height: 18.0,
              width: 18.0,
              color: AppColors.textColorMode,
            ),
          ),
        ):Container(),
      ],
    );
  }
}
