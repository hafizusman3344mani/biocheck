
import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'dashboard2.dart';

class BeltConfigurationSuccess extends StatefulWidget {
  @override
  _BeltConfigurationState createState() => _BeltConfigurationState();
}

class _BeltConfigurationState extends State<BeltConfigurationSuccess> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var connectionController = Get.find<ConnectionController>();

  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      if (mounted) {
        Navigator.pushReplacement(context, RoutePage(
          builder: (context) {
            return DashboardMain();
          },
        ));
      }
    });

    getDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColorMode,
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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Textview(
                    S.of(context).dashboard1Title1,
                    13.0,
                    FontWeight.w300,
                    AppColors.bodyColorMode,
                    TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Textview3(
                    title: S.of(context).dashboard1TitleStep4,
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
          Positioned(
            bottom: 120.0,
            left: 40.0,
            right: 40.0,
            child: Container(
              height: AppValue.customButtonHeight,
            ),
          ),
          Positioned(
            bottom: 120.0,
            left: 0.0,
            right: 15.0,
            child: Container(
              margin: EdgeInsets.only(right: 45.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: Textview('Success', 14.0, FontWeight.w600,
                        AppColors.textColorMode, TextAlign.end),
                  ),
                  GetIcon(
                    path: GlobalResources.ic_check,
                    width: 48.0,
                    height: 48.0,
                    color: Colors.greenAccent,
                  )
                ],
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
                  AppColors.bodyColorMode,
                  TextAlign.right,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: Textview(
                  connectionController.connection.ConnectedDeviceName != null
                      ? connectionController
                              .connection.ConnectedUserDeviceName +
                          " - " +
                          connectionController.connection.ConnectedDeviceName
                      : "",
                  14.0,
                  FontWeight.bold,
                  AppColors.noAccTextColorMode,
                  TextAlign.end),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: AppValue.commonBottomAppbarHeight,
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
