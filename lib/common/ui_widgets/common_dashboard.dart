import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Dashboard extends StatefulWidget {
  Gradient gradient;
  Widget body;
  Color iconColor;

  Dashboard(this.gradient, this.body, this.iconColor);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: CustomAppBar(_scaffoldKey, true),
      ),
      body: widget.body,
      bottomNavigationBar: BottomBar(
        gradient: widget.gradient,
        childs: [
          BottomNavItem2(
            iconColor: widget.iconColor,
            icon: GlobalResources.ic_home,
            onTap: () {
              WidgetProps.goToNextPage(
                context,
                DashboardMain(),
              );
            },
            height: 24.16,
            width: 26.24,
          ),
        ],
      ),
      endDrawer: SideDrawer(),
    );
  }
}
