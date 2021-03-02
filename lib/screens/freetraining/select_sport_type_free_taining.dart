import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/measurement_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FTSelectSportType extends StatefulWidget {
  @override
  _FTSelectSportTypeState createState() => _FTSelectSportTypeState();
}

class _FTSelectSportTypeState extends State<FTSelectSportType> {
  var scrollController = ScrollController();
  var heightCard;
  var selectedOpt = '';

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: heightCard ?? AppValue.screenHeight(context),
        curve: Curves.elasticInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 700),
                opacity: selectedOpt == '' ? 1.0 : 0.0,
                child: Textview2(
                  title: S.of(context).selYrSport,
                  color: AppColors.dashboardTextColor.withOpacity(0.8),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                height: AppValue.screenHeight(context),
                child: ListView(
                  controller: scrollController,
                  children: [
                    /*    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 700),
                          opacity: selectedOpt == '' ? 1.0 : 0.0,
                          child: Textview2(
                            title: S.of(context).selYrSport,
                            color: AppColors.dashboardTextColor.withOpacity(0.8),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),*/
                    // WidgetProps.space(10.0),
                    getItem(GlobalResources.cvpvakPath,
                        S.of(context).CVPOPTBicycles),
                    getItem(GlobalResources.cvpwakPath,
                        S.of(context).CVPOPTRunning),
                    getItem(GlobalResources.cvppersonPath,
                        S.of(context).CVPOPTToWalk),
                    getItem(
                        GlobalResources.cvprecPath, S.of(context).CVPOPTRowing),
                    getItem(GlobalResources.cvpsktPath,
                        S.of(context).CVPOPTIceskating),
                    getItem(GlobalResources.cvpcrossPath,
                        S.of(context).CVPOPTCrossTrainer),
                    WidgetProps.space(10.0),
                    // AnimatedOpacity(
                    //   duration: Duration(milliseconds: 700),
                    //   opacity: selectedOpt == '' ? 1.0 : 0.0,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 20.0),
                    //       child: GetIcon(
                    //         path: GlobalResources.ic_home,
                    //         width: 26.0,
                    //         height: 26.0,
                    //         color: AppColors.dashboardTextColor,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: GetIcon(
                  path: GlobalResources.ic_home,
                  width: 26.0,
                  height: 26.0,
                  color: AppColors.dashboardTextColor,
                ),
              ),
            )
          ],
        ),
      );
  }

  Widget getItem(String image, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOpt = text;
          heightCard = AppValue.screenHeight(context) / 1.1;
        });
        Timer(Duration(milliseconds: 1500), () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) =>
                  MeasurementOptions(Constants.FREE_TRAINING),
            ),
          );
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 700),
        opacity: selectedOpt == '' ? 1.0 : (selectedOpt == text ? 1.0 : 0.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: 124.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: 10.0),
                height: 31.0,
                decoration: BoxDecoration(
                  color: AppColors.dashboardTextColor.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                ),
                child: Textview(
                  text,
                  13.0,
                  FontWeight.normal,
                  Colors.white,
                  TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
