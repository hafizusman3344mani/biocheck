import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/appbar.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/ratingbar/rating_bar.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';
import 'package:biocheck/db/repository/rest_measure_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/measurements/result_heartbeat.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Qustionnaire extends StatefulWidget {
  @override
  _QustionnaireState createState() => _QustionnaireState();
}

class _QustionnaireState extends State<Qustionnaire> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var qnts = [];
  FocusNode _focusNode = FocusNode();
  var _textController = TextEditingController();

  double rating1 = 3.0;
  double rating2 = 3.0;
  double rating3 = 3.0;
  double rating4 = 3.0;

  @override
  void initState() {
    // TODO: implement initState
    Get.find<HRController>().startMeasuring=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    qnts = [
      S.of(context).QNT1,
      S.of(context).QNT2,
      S.of(context).QNT3,
      S.of(context).QNT4,
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size(AppValue.screenWidth(context), AppValue.dashboardAppbarHeight),
        child: CustomAppBar(_scaffoldKey, false),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: qnts.length,
          itemBuilder: (context, index) {
            return getQuestionnaireItem(index);
          },
        ),
      ),
      bottomNavigationBar: BottomBar(
        gradient: WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.parrotGreen,
        ),
        childs: [
          BottomNavItem2(
            width: 35.47,
            height: 27.56,
            iconColor: Colors.white,
            icon: GlobalResources.ic_check,
            onTap: () {
              next();
            },
          ),
        ],
      ),
    );
  }

  Widget getQuestionnaireItem(int index) {
    if (index == 3) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            height: AppValue.screenHeight(context) / 4,
            child: Card(
              elevation: 4.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textview(qnts[index], 20.0, FontWeight.normal,
                        AppColors.welcomeTextColor, TextAlign.center),
                    RatingBar(
                      enabled: true,
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glow: false,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
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
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: AppValue.screenHeight(context) / 3,
            child: Card(
              elevation: 4.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textview("Notities", 20.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.center),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          /*Textview(
                        S.of(context).notitie_heart_beat,
                        14.0,
                        FontWeight.w300,
                        AppColors.commonTextColorCronic,
                        TextAlign.right),*/
                          SingleChildScrollView(
                            child: TextFormField(
                              controller: _textController,
                              minLines: 1,
                              maxLines: 10,
                              focusNode: _focusNode,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.center,
                              style: WidgetProps.textStyleInputFiled,
                              decoration: InputDecoration(
                                  hintText: S.of(context).notitieshint,
                                  counter: Offstage(),
                                  border: InputBorder.none),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        margin: EdgeInsets.all(10.0),
        height: AppValue.screenHeight(context) / 4,
        child: Card(
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textview(qnts[index], 20.0, FontWeight.normal,
                    AppColors.welcomeTextColor, TextAlign.center),
                RatingBar(
                  enabled: true,
                  initialRating: 3,
                  minRating: 1,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  glow: false,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
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
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                    if (index == 0) {
                      rating1 = rating;
                    } else if (index == 1) {
                      rating2 = rating;
                    } else if (index == 2) {
                      rating3 = rating;
                    } else {
                      rating4 = rating;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  next() async {
    for (int i = 0; i < 4; i++) {
      var data = RestQuestionnaire.fromClass();
      data.mId = Get.find<HRController>().rmId;
      data.notes = _textController.text;
      data.qID = i + 1;
      data.qIDString = qnts[i];
      if (i == 0) {
        data.rating = rating1;
      } else if (i == 1) {
        data.rating = rating2;
      } else if (i == 1) {
        data.rating = rating3;
      } else {
        data.rating = rating4;
      }
      await RestMeasureRepo.instance.mapQuesData(data);
    }
    WidgetProps.pushUpToNextPageRelace(
        context: context, enterPage: HeartbeatResult(), exitPage: widget);
  }
}
