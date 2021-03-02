import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/loader.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ConnectionConfiguration extends StatefulWidget {
  @override
  _BeltConfigurationState createState() => _BeltConfigurationState();
}

class _BeltConfigurationState extends State<ConnectionConfiguration> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var connectionController = Get.find<ConnectionController>();
  var hrController = Get.find<HRController>();
  @override
  void initState() {
    getDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize:
        Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: CustomAppBar(_scaffoldKey, false),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Textview3(
                    title: S.of(context).currentConnectionTitle,
                    color: AppColors.dashboardTextColor,
                    textAlign: TextAlign.right,
                    fontSize: AppValue.screenCommonTitleSize,
                    fontWeight: FontWeight.w300,
                    lineHeight: 1.6,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            top: 0.0,
            left: 40.0,
            right: 40.0,
            child: Container(
              height: AppValue.customButtonHeight,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            top: 200.0,
            right: 0.0,
            child: Container(
              height: 48.0,
              alignment: Alignment.centerRight,
              width: 48.0,
              margin: EdgeInsets.only(right: 45.0),
              child: GetIcon(
                path: GlobalResources.ic_check,
                width: 48.0,
                height: 48.0,
                color: Colors.greenAccent,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            top: 350.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Container(
                margin: EdgeInsets.only(right: 20.0,left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        hrController.showDisconnectPopup();
                      },
                      child: GetIcon(
                        path: GlobalResources.ic_disco,
                        width: 48.0,
                        height: 48.0,
                      ),
                    ),
                     Textview(
                          connectionController.connection!=null?
                          connectionController.connection.ConnectedDeviceName != null
                              ? connectionController
                              .connection.ConnectedUserDeviceName +
                              " - " +
                              connectionController.connection.ConnectedDeviceName
                              : "":"",
                          14.0,
                          FontWeight.bold,
                          AppColors.noAccTextColor,
                          TextAlign.end),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            BottomBar(
              gradient: WidgetProps.getAppGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.parrotGreen,
              ),
              childs: [
                BottomNavItem2(
                    width: 26.24,
                    height: 25.16,
                    onTap: () async {
                      Navigator.of(context).pop();
                    },
                    icon: GlobalResources.ic_home),
              ],
            ),

          ],
        ),
      /*   body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 1000),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          height: AppValue.screenHeight(context) / 1.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 40.0),
                child: Textview(
                    S.of(context).configurationSuccessTitle,
                    AppValue.screenCommonTitleSize,
                    FontWeight.w300,
                    AppColors.dashboardTextColor,
                    TextAlign.end),
              ),
              Container(
                margin: EdgeInsets.only(right:45.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Textview('Success', 14.0, FontWeight.w600,
                          AppColors.dashboardTextColor, TextAlign.end),
                    ),
                    GetIcon(
                      path:GlobalResources.ic_check,
                      width: 48.0,
                      height: 48.0,
                      color: Colors.greenAccent,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Textview('Patje - Sigma R1 1234567', 14.0, FontWeight.bold,
                    AppColors.dashboardTextColor, TextAlign.end),
              )
            ],
          ),
        ),
      ),*/
    );
  }

  Widget listWidget(int index) {
    return GestureDetector(
      onTap: () {
        // showDialog(
        //   useRootNavigator: true,
        //   context: context,
        //   builder: (context) {
        //     return CommonPopup(SetBeltName(), 5.0, 200.0);
        //   },
        // );

        /*Navigator.of(context).push(PageRouteBuilder(
            opaque: true,
            pageBuilder: (BuildContext context, _, __) =>
                CommonPopup(SetBeltName(), 5.0)));*/
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Textview("Sigma R1 1234567", 14.0, FontWeight.w900,
            AppColors.noAccTextColor, TextAlign.right),
      ),
    );
  }

  void getDeviceInfo() async {
    await connectionController.getConnection();
    setState(() {});
  }
}
