import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/preferences.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/db/repository/user_repo.dart';
import 'package:biocheck/screens/common/common_background_start_screen.dart';
import 'package:biocheck/screens/dashboard/dashboard1.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:biocheck/screens/startup/select_language.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../main.dart';
import 'start_info_pages.dart';

class VideoSplash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<VideoSplash> {
  VideoPlayerController _controller;
  bool isUser = false;
  bool connected = false;
  bool found = false;
  var btIntance = FlutterBlue.instance;
  HRController hrController;

  Connection connection;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/into1.mp4');
    scanMode();
    _controller.addListener(() {
      if (_controller.value.duration == _controller.value.position) {
        goToScreen();
      }
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    // Timer(Duration(milliseconds: 8100), () {
    //   goToScreen();
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    btIntance.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(
          topColors: AppColors.redGradien,
          isWelcome: false,
        ),
        Center(
          child: Container(
            height: AppValue.screenHeight(context) / AppValue.cardHeight,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: AppValue.horizontalMargin,
                right: AppValue.horizontalMargin),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    height:
                        AppValue.screenHeight(context) / AppValue.cardHeight,
                    child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void goToScreen() async {
    String locale = await SharedPref.read(Constants.appLocale);
    if (locale != null) {
      await HomePage.setLocale(context, Locale(locale));
    }

    if (isUser) {
      if (connection != null) {
        List<BluetoothDevice> list = await btIntance.connectedDevices;

        if (list != null || list.isNotEmpty) {
          list.forEach((element) {
            if (element.id.id == connection.ConnectionId) {
              connected = true;
              hrController.currentDevice = element;
            }
          });
        } else {

        }
        if(hrController.currentDevice!=null)
        {
          Navigator.of(context).pushReplacement(
            RoutePage(
              builder: (context) => DashboardMain(),
            ),
          );
        }else
          {
            Navigator.of(context).pushReplacement(
              RoutePage(
                builder: (context) => DashboardFirst(),
              ),
            );
          }
      } else {
        Navigator.of(context).pushReplacement(
          RoutePage(
            builder: (context) => DashboardFirst(),
          ),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        RoutePage(
          builder: (context) => SelectLanguage(),
        ),
      );
    }
  }

  void scanMode() async {
    isUser = await UserRepo.instance.getUser();
    if (isUser) {
      connection = await ConnectionRepo.instance.getConnection();
      hrController = Get.find<HRController>();

      bool isOn = await btIntance.isOn;

      if(isOn)
        {
          btIntance.scanResults.listen((List<ScanResult> results) {
            for (ScanResult result in results) {
              if (connection != null) {
                if (result.device.id.id == connection.ConnectionId) {
                  found = true;
                  hrController.currentDevice = result.device;
                  btIntance.stopScan();
                }
              }
            }
          });
          btIntance.startScan();
        }else{

      }

    }
  }
}
