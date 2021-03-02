import 'dart:async';
import 'dart:convert';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/AnimatedController.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/configuration_screen.dart';
import 'package:biocheck/screens/popups/set_band_name.dart';
import 'package:biocheck/service/btservice/bluetoothmanager.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:biocheck/models/local/bluetooth/bluetooth_model.dart';
import 'package:biocheck/models/local/bluetooth/common_data.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

// import 'package:location_permissions/location_permissions.dart';
//

class SelectBelt extends StatefulWidget {
  @override
  _SelectBeltState createState() => _SelectBeltState();
}

class _SelectBeltState extends State<SelectBelt> {
  bool isTimeUp = false;
  bool isDevicesShown = false;
  var hrController = Get.find<HRController>();
  FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();

  Stream scanApi = ConnectivityPolar.scanForDevice;

  List<BluetoothModel> bList = List<BluetoothModel>.empty(growable: true);
  bool showDevices = false;
  var scanModel = CommonData.fromData();
  BluetoothModel btModel;
  bool isPermitted = false;
  bool isOn = false;
  var controller = OpenFeatureAnimatedController();
  String aaa;
  Location location = Location();

  @override
  void initState() {
    Timer(Duration(seconds: 20), () {
      if (mounted) {
        setState(() {
          isTimeUp = true;
        });
      }
    });

    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        gg();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.bodyColorMode,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size(
              AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
          child: Container(),
        ),
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Positioned(
              right: 0.0,
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Textview3(
                        title: S.of(context).dashboard1TitleStep2,
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
                color: AppColors.bodyColorMode,
                height: AppValue.customButtonHeight,
              ),
            ),
            Positioned(
              bottom: 170.0,
              left: 0.0,
              right: 15.0,
              child: Container(
                color: AppColors.bodyColorMode,
                height: AppValue.screenHeight(context) / 5,
                child: !isTimeUp
                    ? Center(
                        child: Textview(
                            'Searching for devices......',
                            14.0,
                            FontWeight.normal,
                            AppColors.textColorMode,
                            TextAlign.right),
                      )
                    : (isTimeUp && devicesList.length == 0
                        ? Textview('No devices found.', 14.0, FontWeight.normal,
                            AppColors.dashboardTextColor, TextAlign.right)
                        : Container()),
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 0.0,
              right: 15.0,
              child: Container(

                height: AppValue.screenHeight(context) / 5,
                child: isPermitted
                    ? isOn
                        ? ListView.builder(
                            itemCount: devicesList.length,
                            itemBuilder: (context, index) {
                              return listWidget(index, context);
                            },
                          )
                        : GestureDetector(
                            onTap: () async {
                              bool on = await ConnectivityPolar.enable;
                              if (on) {
                                setState(() {
                                  isOn = true;
                                });
                                Timer(Duration(seconds: 1),(){
                                  getStarted();
                                });
                              }

                            },
                            child: Textview(
                                'Bluetooth turned off. Click to turn on',
                                14.0,
                                FontWeight.w600,
                                AppColors.noAccTextColor,
                                TextAlign.right),
                          )
                    : GestureDetector(
                        onTap: () async {
                          await location.requestPermission().then((value) {
                            print(value);
                            PermissionStatus st = value;
                            if (st == PermissionStatus.granted) {
                              ConnectivityPolar.initiateConnection;
                              setState(() {
                                isPermitted = true;
                              });
                              getStarted();
                              return location.hasPermission();
                            } else {
                              return location.requestPermission();
                            }
                          });
                        },
                        child: Textview(
                            'Location permission is not allowed. Click to allow',
                            14.0,
                            FontWeight.w600,
                            AppColors.noAccTextColor,
                            TextAlign.right),
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
          ],
        ),
        bottomNavigationBar: Container(
          height: AppValue.commonBottomAppbarHeight,
        ),
      ),
    );
  }

  Widget listWidget(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        //connectToDevice(devicesList[index]);
        flutterBlue.stopScan();

        showDialog(
          useRootNavigator: true,
          context: context,
          builder: (context) {
            return SetBeltName(devicesList[index]);
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Textview(
            devicesList[index].name.isNotEmpty
                ? devicesList[index].name
                : 'No name',
            14.0,
            FontWeight.normal,
            AppColors.noAccTextColor,
            TextAlign.right),
      ),
    );
  }

  Widget deviceStream(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      int type = json.decode(snapshot.data)["type"] as int;
      if (type == Constants.SCAN) {
        Map dataString = json.decode(snapshot.data)["data"];

        btModel = BluetoothModel.fromClass();
        if (dataString["name"].toString().isNotEmpty) {
          btModel.name = dataString["name"] as String;
          btModel.address = dataString["address"] as String;
          btModel.deviceId = dataString["deviceId"] as String;
          btModel.isConnectable = dataString["isConnectable"] as bool;
          btModel.rssi = dataString["rssi"] as int;
          //scanModel = json.decode(snapshot.data.toString());

          bList.add(btModel);
        }
      }
      return ListView.builder(
        itemCount: bList.length,
        itemBuilder: (context, index) {
          return listWidget(index, context);
        },
      );
    } else {
      return Center(
        child: Textview('', 14.0, FontWeight.normal,
            AppColors.dashboardTextColor, TextAlign.right),
      );
    }
  }

  void init() async {
    //aaa = await ConnectivityPolar.getAmplitude;
    await _checkGps();
    isOn = await FlutterBlue.instance.isOn;
    PermissionStatus status = await location.hasPermission();
    if (status == PermissionStatus.granted) {
      setState(() {
        isPermitted = true;
      });
      // The OS restricts access, for example because of parental controls.

    } else {
      await location.requestPermission().then((value) {
        print(value);
        PermissionStatus st = value;
        if (st == PermissionStatus.granted) {
          ConnectivityPolar.initiateConnection;
          setState(() {
            isPermitted = true;
          });
          getStarted();
          return location.hasPermission();
        } else {
          return location.requestPermission();
        }
      });
    }
    getStarted();

  }

  getStarted()
  {
    if(isPermitted && isOn)
    {
      getDevices();
    }
  }

  void gg() async {
    flutterBlue.stopScan();
    Navigator.of(context).pop();
  }

//explicit reference to the Location class
  Future _checkGps() async {
    if (!await location.serviceEnabled()) {
      location.requestService();
    }
  }

  _addDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      if (mounted)
        setState(() {
          devicesList.add(device);
        });
    }
  }

  void getDevices() {
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    flutterBlue.startScan();
  }

  void connectToDevice(BluetoothDevice device) async {
    BluetoothCharacteristic characteristic;
    await device.disconnect();
    await device.connect();
    List<BluetoothService> services = await device.discoverServices();

    hrController.services = services;
    characteristic = services[0].characteristics[2];
    print(characteristic.uuid);
  }
}
