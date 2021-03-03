import 'dart:async';
import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'to_connect_initiate_screen.dart';

class DashboardFirst extends StatefulWidget {
  @override
  _DashboardFirstState createState() => _DashboardFirstState();
}

class _DashboardFirstState extends State<DashboardFirst> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var hrController = Get.find<HRController>();

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColorMode,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: CustomAppBar(_scaffoldKey, true),
      ),
      body: Container(
        color: AppColors.bodyColorMode,
        height: AppValue.screenHeight(context),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAli qgnment: CrossAxisAlignment.end,
          children: [
            Positioned(
              right: 0.0,
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: Textview(
                        S.of(context).dashboard1Title1,
                        13.0,
                        FontWeight.w300,
                        AppColors.textColorMode,
                        TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Textview3(
                        title: S.of(context).dashboard1Title2,
                        color: AppColors.textColorMode,
                        textAlign: TextAlign.right,
                        fontSize: AppValue.screenCommonTitleSize,
                        fontWeight: FontWeight.w300,
                        lineHeight: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 120.0,
              left: 40.0,
              right: 40.0,
              child: Container(
                height: AppValue.customButtonHeight,
                child: HeroButton(
                  width: AppValue.screenWidth(context) / 1.4,
                  height: AppValue.customButtonHeight,
                  title: S.of(context).dashboard1LargeButton,
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppColors.welcomeButton,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      RoutePage(
                        builder: (context) {
                          return ConnectInitiate();
                        },
                      ),
                    );
                  },
                  radius: AppValue.customButtonRadius,
                  textColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: Textview(
                    S.of(context).dashboard1Title3,
                    10.0,
                    FontWeight.w300,
                    AppColors.textColorMode,
                    TextAlign.right,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomBar(
            gradient: WidgetProps.getAppGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.redGradien,
            ),
            childs: [
              BottomNavItem2(
                  width: 26.24,
                  height: 25.16,
                  onTap: () async {
                    Connection connection =
                        await ConnectionRepo.instance.getConnection();

                    if (connection != null) {
                      Timer(
                        Duration(milliseconds: 170),
                        () {
                          WidgetProps.goToNextPage(
                            context,
                            DashboardMain(),
                          );
                        },
                      );
                    } else {
                      hrController.showConnectionChangePopup();
                    }
                  },
                  icon: GlobalResources.ic_home),
            ],
          ),
          Positioned(
            left: 80.0,
            right: 0.0,
            bottom: 50.0,
            child: Image.asset(
              GlobalResources.ic_arrow_twist,
              width: 42.0,
              height: 42.0,
            ),
          )
        ],
      ),
      endDrawer: SideDrawer(),
    );
  }

  init()async{
    await Permission.storage.request();
  }
}
