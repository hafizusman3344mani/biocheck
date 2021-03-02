import 'package:biocheck/common/ui_widgets/app_logo.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/ratingbar/rating_bar.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/live_graph.dart';
import 'package:flutter/material.dart';

class AftermeasureNotities extends StatefulWidget {
  @override
  NotitiesState createState() => NotitiesState();
}

class NotitiesState extends State<AftermeasureNotities> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: AppLogo(),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Center(
                child: Textview('25 juli 2019 | 07:33', 14.0, FontWeight.normal,
                    AppColors.welcomeTextColor, TextAlign.right),
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Flexible(
      //         child: Container(
      //           margin: EdgeInsets.all(10.0),
      //           height: AppValue.screenHeight(context) / 2,
      //           padding: EdgeInsets.symmetric(horizontal: 10.0),
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             children: [
      //               Textview("Notities", 20.0, FontWeight.w300,
      //                   AppColors.welcomeTextColor, TextAlign.right),
      //               Textview(S.of(context).notitiesDes, 14.0, FontWeight.w300,
      //                   AppColors.welcomeTextColor.withOpacity(0.7), TextAlign.right),
      //               Container(
      //                 height: 6.0,
      //                 width: AppValue.screenWidth(context)/3,
      //                 decoration: BoxDecoration(
      //                   gradient: WidgetProps.getAppGradient(
      //                       colors: AppColors.parrotGreen,
      //                       begin: Alignment.topLeft,
      //                       end: Alignment.bottomRight),
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(5.0),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left:10.0,right: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Textview(S.of(context).notities, 20.0, FontWeight.w300,
                  AppColors.welcomeTextColor, TextAlign.right),
              /*Textview(
                          S.of(context).notitie_heart_beat,
                          14.0,
                          FontWeight.w300,
                          AppColors.commonTextColorCronic,
                          TextAlign.right),*/
              SingleChildScrollView(
                child: TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.end,
                  style: WidgetProps.textStyleInputFiled,
                  decoration: InputDecoration(
                      hintText: S.of(context).notitieshint,
                      counter: Offstage(),
                      border: InputBorder.none
                  ),
                  maxLength: 500,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  height: 6.0,
                  width: AppValue.screenWidth(context) / 3,
                  decoration: BoxDecoration(
                    gradient: WidgetProps.getAppGradient(
                        colors: AppColors.parrotGreen,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        gradient:
        WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.parrotGreen,
        ),
        childs: [
          BottomNavItem2(
            width: 13,
            height: 25,
            icon: GlobalResources.ic_left_errow,
            onTap: () {
              Navigator.of(context).pop();
            },
            iconColor: Colors.white,
          ),
          BottomNavItem2(
            width: 25,
            height: 25,
            icon: GlobalResources.ic_open_graph,
            onTap: () {
              WidgetProps.goToNextPage(context, DataGraph());
            },
            iconColor: Colors.white,
          ),
          BottomNavItem2(
            width: 23,
            height: 25,
            icon: GlobalResources.ic_share,
            onTap: () {

            },
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget getStarsWidget(String title, int stars) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Textview(title, 14.0, FontWeight.normal, AppColors.welcomeTextColor,
              TextAlign.center),
          RatingBar(
            initialRating: stars.toDouble(),
            minRating: 1,
            itemSize: 20.0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            updateOnDrag: false,
            tapOnlyMode: true,
            glow: false,
            enabled: false,
            itemCount: 5,
            ratingWidget:
            RatingWidget(
              full: GetIcon(
                path: GlobalResources.ic_star,
                color: Colors.amber,
              ),
              half: GetIcon(
                path: GlobalResources.ic_star,
                color: Colors.amber,
              ),
              empty: GetIcon(
                path: GlobalResources.ic_star,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }
}
