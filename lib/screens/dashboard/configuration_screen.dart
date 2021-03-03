import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/loader.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'configuration_success.dart';

class BeltConfiguration extends StatefulWidget {
  @override
  _BeltConfigurationState createState() => _BeltConfigurationState();
}

class _BeltConfigurationState extends State<BeltConfiguration> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var hrController = Get.find<HRController>();
  var blue = FlutterBlue.instance;
  String id;
  var connectionController = Get.find<ConnectionController>();
  @override
  void initState() {
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(context, RoutePage(
        builder: (context) {
          return BeltConfigurationSuccess();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bodyColorMode,
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: CustomAppBar(_scaffoldKey, false),
      ),
      body: GetBuilder<HRController>(
        init: hrController,
        initState: (child) {
          id = Get.find<ConnectionController>().connection.ConnectionId;
          // getConnected();
           getDeviceInfo();
          connectToDevice(hrController.currentDevice);
        },
        builder: (_) {
          if (hrController.startMeasuring == 1) {
            Timer(Duration(milliseconds: 1200), () {
              Navigator.pushReplacement(context, RoutePage(
                builder: (context) {
                  return BeltConfigurationSuccess();
                },
              ));
            });
          }
          return Container(
            width: AppValue.screenWidth(context),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Positioned(
                  right: 20.0,
                  child: Container(
                    child: Column(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Textview3(
                              title: S.of(context).dashboard1TitleStep3,
                              color: AppColors.textColorMode,
                              textAlign: TextAlign.right,
                              fontSize: AppValue.screenCommonTitleSize,
                              fontWeight: FontWeight.w300,
                              lineHeight: 1.6,
                            ),
                            Textview3(
                              title: S.of(context).dashboard1TitleStep3a,
                              color: AppColors.textColorMode,
                              textAlign: TextAlign.right,
                              fontSize: AppValue.screenCommonTitleSize,
                              fontWeight: FontWeight.w300,
                              lineHeight: 1.6,
                            ),
                          ],
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
                  ),
                ),
                Positioned(
                  bottom: 120.0,
                  left: 0.0,
                  right: 15.0,
                  child: Loader(),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Container(
                      //  margin: EdgeInsets.only(right: 20.0),
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
                  right: 20.0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.0),
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
          );
        },
      ),
      bottomNavigationBar: Container(
        height: AppValue.commonBottomAppbarHeight,
      ),
    );
  }

  getConnected()async {
    bool result = await ConnectivityPolar.pairToDevice(id);
    print('error free');

  }
  void getDeviceInfo() async {
    await connectionController.getConnection();
    setState(() {});
  }

  void go()async{

    await connectionController.getConnection();

  }

  void connectToDevice(BluetoothDevice device) async {
    // if(device.)

   // BluetoothCharacteristic characteristic;
    await device.disconnect();
    await device.connect();
//     List<BluetoothService> services = await device.discoverServices();
//
//     hrController.services = services;
//     characteristic = services[0].characteristics[2];
//     print(characteristic.uuid);
//
//     BluetoothService service = services.where((element) => element.uuid.toString().toUpperCase().substring(4, 8) == '180D').toList().first;
//     BluetoothCharacteristic character = service.characteristics.where((element) => element.uuid.toString().toUpperCase().substring(4, 8) == '2A37').toList().first;
//     // services.forEach((service)  {
//     //   // do somethprint(value);ing with service
//     //
//     //   //print(service);
//     //   characteristic = services[0].characteristics[0];
//     //   print(characteristic.uuid);
//     //
//     // });
//     character.value.listen((event) {
//       print("kkkkk");
//     print(event);
//     });
//     character.setNotifyValue(true);
// //     setState(() {
// //
// //     });
// //     var descriptors = characteristic.descriptors;
// //     for(BluetoothDescriptor d in descriptors) {
// //       List<int> value = await d.read();
// //       print(value);
// //     }
  }
}
