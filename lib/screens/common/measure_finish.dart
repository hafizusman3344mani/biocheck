
import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../cronic_protocol/cronic_protocol_measure_result.dart';

class MeasureFinish extends StatefulWidget {
  String title;
  String subTitle;
  String icon;
  List<Color> gradient;

  MeasureFinish(this.title, this.subTitle, this.icon, this.gradient);

  @override
  _MeasureFinishState createState() => _MeasureFinishState();
}

class _MeasureFinishState extends State<MeasureFinish> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size(
                AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: AppLogo(),
            ),
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              height: AppValue.screenHeight(context) / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Textview2(
                        title: widget.title,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                        textAlign: TextAlign.end,
                        color: AppColors.commonTextColorCronic,
                        lineHeight: 1.5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        height: 6.0,
                        width: AppValue.screenWidth(context) / 3,
                        decoration: BoxDecoration(
                          gradient: WidgetProps.getAppGradient(
                              colors: widget.gradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Textview(S.of(context).heighHeart, 14.0, FontWeight.w300,
                          AppColors.commonTextColorCronic, TextAlign.end),
                      Textview('198', 14.0, FontWeight.w300,
                          AppColors.commonTextColorCronic, TextAlign.end),
                      Textview(S.of(context).lowHeart, 14.0, FontWeight.w300,
                          AppColors.commonTextColorCronic, TextAlign.end),
                      Textview('97', 14.0, FontWeight.w300,
                          AppColors.commonTextColorCronic, TextAlign.end),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Center(
                      child: Textview(widget.subTitle, 14.0, FontWeight.w300,
                          AppColors.commonTextColorCronic, TextAlign.end),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              BottomBar(
                gradient: WidgetProps.getAppGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.gradient,
                ),
                childs: [
                  Container(
                    width: AppValue.screenWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BottomNavItem2(
                            width: 25.47,
                            height: 17.56,
                            onTap: () {
                              WidgetProps.pushUpToNextPageRelace(
                                  context: context,
                                  enterPage: CronicProtocolResult(),
                                  exitPage: widget);
                            },
                          iconColor: Colors.white,
                            icon: widget.icon,)
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 80.0,
                right: 0.0,
                bottom: 50.0,
                child: Image.asset(
                  GlobalResources.ic_arrow_twist,
                  width:42.0,
                  height: 42.0,
                ),
              ),
            ],
          ),
    );
  }
}
