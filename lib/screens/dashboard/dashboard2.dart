import 'dart:async';

import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/dashboard2_options_widget.dart';
import 'package:biocheck/common/ui_widgets/side_drawer.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/pushed_route.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/open_feature_animation.dart';
import 'package:biocheck/screens/cronic_protocol/select_sport_type.dart';
import 'package:biocheck/screens/dashboard/inspiration_site.dart';
import 'package:biocheck/screens/free_measuring/select_free_measure_type.dart';
import 'package:biocheck/screens/freetraining/select_sport_type_free_taining.dart';
import 'package:biocheck/screens/popups/connectivity_change_popup.dart';
import 'package:biocheck/screens/pro/pro_select_option.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import 'chat/chat.dart';
import 'history/history.dart';
import 'measure_heart.dart';

class DashboardMain extends StatefulWidget {
  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var squareScaleA = 1.0;
  var _scaleHeart;
  AnimationController _controllerScaleHeart;
  var heartOpacity = 0.0;
  var rad = Offset(0.0, 0.0);
  Offset startOffset = const Offset(1, 0);
  Offset startOffsetVeritcal = const Offset(0, 1);
  double kDefaultDuration = .35;
  var connectionController = Get.find<ConnectionController>();

  /// var hrCOntroller = Get.put(HRController());
  bool connection = false;
  bool location = false;

  @override
  void initState() {
    /*_controllerScaleHeart = AnimationController(
        vsync: this,
        lowerBound: 1.0,
        upperBound: 2.0,
        duration: Duration(milliseconds: 650));*/
    _controllerScaleHeart = AnimationController(
        duration: const Duration(milliseconds: 650), vsync: this);
    _scaleHeart = Tween(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
        parent: _controllerScaleHeart,
        curve: Curves.linear,
        reverseCurve: Curves.easeOut));

    _controllerScaleHeart.addListener(() {
      setState(() {
        if (_controllerScaleHeart.value > 0.17) {
          heartOpacity = 0.0;
        } else {
          heartOpacity = 1.0;
        }
        squareScaleA = _controllerScaleHeart.value;
      });
    });

    _controllerScaleHeart.forward();
    _controllerScaleHeart.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerScaleHeart.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controllerScaleHeart.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerScaleHeart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectionController>(
      id: "DB2",
      initState: (child) async {
        //ConnectivityPolar.initiateConnection;
        await connectionController.getConnection();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.bodyColorMode,
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size(
                AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
            child: CustomAppBar(_scaffoldKey, true),
          ),
          body: Container(
            color: AppColors.bodyColorMode,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                Hero(
                  tag: S.of(context).dashboard2ProtocolOption,
                  child: Feature(
                      WidgetProps.getAppGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.parrotGreen,
                      ),
                      S.of(context).dashboard2ProtocolOption,
                      Colors.white, () {
                    WidgetProps.goToNextPage(
                      context,
                      OpenWithAnimation(
                          S.of(context).dashboard2ProtocolOption,
                          AlignmentDirectional.topCenter,
                          WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.parrotGreen,
                          ),
                          CVPSelectSportType(),
                          true),
                    );
                  }, false),
                ),
                // OpenContainerWrapper(
                //   id: 1,
                //   closedChild:  Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Material(
                //       elevation: 4.0,
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(5.0),
                //       ),
                //       // child: InkWell(
                //       //   onTap:()=> Navigator.of(context).push(PageRouteBuilder(
                //       //     pageBuilder: (BuildContext context, Animation<double> animation,
                //       //         Animation<double> secondaryAnimation) {
                //       //       return CVPSelectSportType();
                //       //     },
                //       //   ),
                //       //   ),
                //         child:
                //         Container(
                //           width: AppValue.screenWidth(context),
                //           height: 134.5,
                //           decoration: BoxDecoration(
                //             gradient:   WidgetProps.getAppGradient(
                //                       begin: Alignment.topLeft,
                //                       end: Alignment.bottomRight,
                //                       colors: AppColors.parrotGreen,
                //                     ),
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(5.0),
                //             ),
                //           ),
                //           child: Align(
                //             alignment: Alignment.centerRight,
                //             child: Container(
                //                 margin: EdgeInsets.symmetric(horizontal: 15.0),
                //                 child: Textview2(
                //                     color:  Colors.white,
                //                     lineHeight: 1.7,
                //                     textAlign: TextAlign.right,
                //                     fontWeight: FontWeight.w300,
                //                     fontSize: 21,
                //                     title: S.of(context).dashboard2ProtocolOption,)),
                //           ),
                //         ),
                //     //  ),
                //     ),
                //   ),
                //   openChild: CVPSelectSportType(),
                // ),

                Hero(
                  tag: S.of(context).dashboard2FreeTrainingOption,
                  child: Feature(
                      WidgetProps.getAppGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.parrotGreen,
                      ),
                      S.of(context).dashboard2FreeTrainingOption,
                      Colors.white, () {
                    WidgetProps.goToNextPage(
                      context,
                      OpenWithAnimation(
                          S.of(context).dashboard2FreeTrainingOption,
                          AlignmentDirectional.topCenter,
                          WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.parrotGreen,
                          ),
                          FTSelectSportType(),
                          //FeatureTypeOptions(Constants.FREE_TRAINING),
                          true),
                    );
                  }, false),
                ),
                Hero(
                  tag: S.of(context).dashboard2FreeMeasureOption,
                  child: Feature(
                      WidgetProps.getAppGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.parrotGreen,
                      ),
                      S.of(context).dashboard2FreeMeasureOption,
                      Colors.white, () {
                    final route = RoutePage(
                      builder: (context) => OpenWithAnimation(
                          S.of(context).dashboard2FreeMeasureOption,
                          AlignmentDirectional.topCenter,
                          WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.parrotGreen,
                          ),
                          FreeMeasureType(),
                          //FreeMeasureType(),
                          true),
                    );
                    Navigator.push(context, route);
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return UpgradePopup();
                    //   },
                    // );
                  } /*() {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              FreeMeasuring(),
                        ),
                      );
                    }*/
                      , true),
                ),
                /* Feature(
                      WidgetProps.getAppGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.redGradien,
                      ),
                      S.of(context).dashboard2Zerocheck,
                      Colors.white, () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return UpgradePopup();
                      },
                    );
                  }, true),*/
                Hero(
                  tag: S.of(context).dashboard2PersonalOption,
                  child: Feature(
                      WidgetProps.getAppGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.parrotGreen,
                      ),
                      S.of(context).dashboard2PersonalOption,
                      Colors.white, () {
                    final route = RoutePage(
                      builder: (context) => OpenWithAnimation(
                          S.of(context).dashboard2PersonalOption,
                          AlignmentDirectional.topCenter,
                          WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.parrotGreen,
                          ),
                          ProOptions(),
                          //FreeMeasureType(),
                          true),
                    );
                    Navigator.push(context, route);
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return UpgradePopup();
                    //   },
                    // );
                  } /*() {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              FreeMeasuring(),
                        ),
                      );
                    }*/
                      , true),
                ),
                Hero(
                  tag: S.of(context).dashboard2InspirationOption,
                  child: Feature(
                      WidgetProps.getAppGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.parrotGreen,
                      ),
                      S.of(context).dashboard2InspirationOption,
                      Colors.white, () {
                    final route = RoutePage(
                      builder: (context) => OpenWithAnimation(
                          S.of(context).dashboard2InspirationOption,
                          AlignmentDirectional.bottomCenter,
                          WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.parrotGreen,
                          ),
                          InspirationSites(),
                          false),
                    );
                    Navigator.push(context, route);

                    /*WidgetProps.goToNextPage(
                          context,
                          OpenWithAnimation(
                              S.of(context).dashboard2PersonalOption,
                              AlignmentDirectional.bottomCenter,
                              WidgetProps.getAppGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: AppColors.parrotGreen,
                              ),
                              InspirationSites(),
                              false));*/
                  }, false),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: AppValue.commonBottomAppbarHeight,
            decoration: BoxDecoration(
                gradient: WidgetProps.getAppGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.redGradien,
            )),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Textview2(
                    title: S.of(context).HeartIconText,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 11.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem2(
                        width: 27.9,
                        height: 23.66,
                        onTap: () {
                          Timer(Duration(milliseconds: 170), () {
                            WidgetProps.pushUpToNextPage(
                                context: context,
                                enterPage: Chat(),
                                exitPage: widget);
                          });
                          ;
                        },
                        icon: GlobalResources.ic_chat),
                    Transform.scale(
                      scale: _scaleHeart.value,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          AnimatedOpacity(
                            opacity: heartOpacity,
                            curve: Curves.easeInOutQuint,
                            duration: Duration(milliseconds: 550),
                            child: BottomNavItem2(
                                width: 94.42,
                                height: 94.42,
                                iconColor: Colors.white70.withOpacity(0.7),
                                onTap: () {},
                                icon: GlobalResources.ic_heart_filled),
                          ),
                          BottomNavItem2(
                              width: 54.42,
                              height: 54.42,
                              onTap: () async {
                                Timer(Duration(milliseconds: 170), () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              MeasureHeartClick(),
                                    ),
                                  );
                                });
                              },
                              icon: GlobalResources.ic_heart_filled),
                        ],
                      ),
                    ),
                    BottomNavItem2(
                        width: 21.88,
                        height: 24.62,
                        onTap: () {
                          Timer(Duration(milliseconds: 170), () {
                            /*Navigator.push(
                            context,
                            CupertinoRoute(
                                exitPage: widget, enterPage: History()))*/
                            ;
                            WidgetProps.pushUpToNextPage(
                                context: context,
                                enterPage: History(),
                                exitPage: widget);
                          });
                        },
                        icon: GlobalResources.ic_calendar),
                  ],
                ),
              ],
            ),
          ),
          endDrawer: SideDrawer(),
        );
      },
    );
  }
}
