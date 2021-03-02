import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/dashboard2_options_widget.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/infrastructure/common/AnimatedController.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tweenme/tween_easing.dart';

class OpenWithAnimation extends StatefulWidget {
  String title;
  Gradient gradient;
  Widget naigateTo;
  bool opaque;
  AlignmentDirectional aligned;

  OpenWithAnimation(
      this.title, this.aligned, this.gradient, this.naigateTo, this.opaque);

  @override
  _OpenWithAnimationState createState() => _OpenWithAnimationState();
}

class _OpenWithAnimationState extends State<OpenWithAnimation> {
  double height = 134.5;
  Widget currWidget;
  String title;
  bool isNext = false;
  var divColor=Colors.transparent;
  bool isHideFeature = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var animatedController = Get.put(OpenFeatureAnimatedController());

  @override
  void initState() {
    title = widget.title;
    Timer(Duration(milliseconds: 50), () {
      widget.aligned = AlignmentDirectional.center;
      setState(() {});
    });
    Timer(Duration(milliseconds: 800), () {
      //widget.gradient = WidgetProps.getAppGradient(colors: [Colors.white,Colors.white,Colors.white]);
      isHideFeature =true;
      height = AppValue.screenHeight(context) / 1.1;
      divColor = Colors.white;
      title = '';
      setState(() {});
    });
    Timer(Duration(milliseconds: 1400), () {
      if (mounted) {
        //   if (widget.opaque) {
        //     Navigator.of(context).pushReplacement(PageRouteBuilder(
        //       opaque: false,
        //       pageBuilder: (BuildContext context, _, __) =>
        //       widget.naigateTo,
        //     ));
        //   } else {
        //     Navigator.pushReplacement(
        //         context,
        //         RoutePage(
        //           builder: (context) => widget.naigateTo,
        //         ));
        //   }
        // }
      }
    });
    Timer(Duration(milliseconds: 800), () {
      height = AppValue.screenHeight(context) / 1.1;
      title = '';
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isNext) {
      currWidget = widget.naigateTo;
    } else {
      currWidget = Hero(
        tag: widget.title,
        child: AnimatedContainer(
          curve: Ease.easeOut,
          onEnd: () {
            // Timer(Duration(milliseconds: 100),()
            // {
            //   if (!widget.opaque) {
            //     final route = RoutePage(
            //       builder: (context) => widget.naigateTo,
            //     );
            //     Navigator.pushReplacement(context, route);
            //   } else {
            //     Navigator.of(context).pushReplacement(
            //       PageRouteBuilder(
            //         opaque: false,
            //         pageBuilder: (BuildContext context, _, __) => widget.naigateTo,
            //       ),
            //     )
            //   }
            // });
            //Navigator.of(context).pop();

            Timer(Duration(milliseconds: 100), () {
              if (widget.title == S.of(context).dashboard2InspirationOption) {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        widget.naigateTo,
                  ),
                );
              } else {
                setState(() {
                  isNext = true;
                });
              }
            });

            // showGeneralDialog(
            //   context: context,
            //   barrierColor: Colors.black12.withOpacity(0.6),
            //   // background color
            //   barrierDismissible: false,
            //   // should dialog be dismissed when tapped outside
            //   barrierLabel: "Dialog",
            //   // label for barrier
            //   transitionDuration: Duration(milliseconds: 300),
            //   // how long it takes to popup dialog after button click
            //   pageBuilder: (_, __, ___) { // your widget implementation
            //     return widget.naigateTo;
            //   },
            // );
          },
          height: height,
          duration: Duration(milliseconds: 400),
          child: !isHideFeature?Feature(widget.gradient, title, Colors.white, () {}, false):Container(),
        ),
      );
    }
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size(
              AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
          child: CustomAppBar(_scaffoldKey, true),
        ),
        body: GetBuilder<OpenFeatureAnimatedController>(
          init: animatedController,
          builder: (_) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 1200),
              curve: Curves.elasticInOut,
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Center(
                child: Material(
                    color: divColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    elevation: 50.0,
                    child: AnimatedSwitcher(
                      switchInCurve: Ease.backOut,
                        switchOutCurve: Ease.easeOut,
                        child: currWidget,
                        duration: Duration(milliseconds: 600),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }),
                ),
              ),
            );
          },
        ),
        // bottomNavigationBar: GestureDetector(
        //   onTap: () {
        //     Navigator.of(context).pop();
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 20.0),
        //     child: GetIcon(
        //       path: GlobalResources.ic_home,
        //       width: 26.0,
        //       height: 26.0,
        //       color: AppColors.dashboardTextColor,
        //     ),
        //   ),
        // ),
        endDrawer: SideDrawer());
  }
}
