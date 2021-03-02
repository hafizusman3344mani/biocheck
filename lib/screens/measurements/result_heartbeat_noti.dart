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
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/db/entities/rest_measure_questionair.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HeartbeatResultNotities extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<HeartbeatResultNotities> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FocusNode _focusNode = FocusNode();
  var _textController = TextEditingController();
  List<RestQuestionnaire> maeasurementQuesList =
      List<RestQuestionnaire>.empty(growable: true);

  var hrController = Get.find<HRController>();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                child: Textview(DateFormat('dd MMM yyyy | hh:mm').format(DateTime.fromMillisecondsSinceEpoch(hrController.maeasurementModel.createdDate)), 14.0, FontWeight.w300,
                    AppColors.welcomeTextColor, TextAlign.right),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: AppValue.screenHeight(context) / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          child: getStarsWidget(
                              S.of(context).mentallyTitle,
                              maeasurementQuesList.isNotEmpty
                                  ? maeasurementQuesList[0].rating
                                  : 0)),
                      Flexible(
                          child: getStarsWidget(
                              S.of(context).physicalTitle,
                              maeasurementQuesList.isNotEmpty
                                  ? maeasurementQuesList[1].rating
                                  : 0)),
                      Flexible(
                          child: getStarsWidget(
                              S.of(context).sleepTitle,
                              maeasurementQuesList.isNotEmpty
                                  ? maeasurementQuesList[2].rating
                                  : 0)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          child: getStarsWidget(
                              S.of(context).muscleTitle,
                              maeasurementQuesList.isNotEmpty
                                  ? maeasurementQuesList[3].rating
                                  : 0)),
                      Flexible(
                        child: Container(),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
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
                      controller: _textController,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.end,
                      style: WidgetProps.textStyleInputFiled,
                      decoration: InputDecoration(
                          hintText: _textController.text.isNotEmpty
                              ? _textController.text
                              : S.of(context).notitieshint,
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
            )
          ],
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
            icon: GlobalResources.ic_check,
            iconColor: Colors.white,
            width: 35.47,
            height: 27.56,
            onTap: () {
              updateNotes();
            },
          ),
        ],
      ),
    );
  }

  Widget getStarsWidget(String title, double stars) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textview(title, 20.0, FontWeight.w300, AppColors.welcomeTextColor,
              TextAlign.left),
          RatingBar(
            enabled: false,
            initialRating: stars,
            minRating: 1,
            itemSize: 11.0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            updateOnDrag: false,
            tapOnlyMode: true,
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
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }

  getData() async {
    maeasurementQuesList =
        await hrController.getMeasurementQues(hrController.rmId);
    _textController.text = maeasurementQuesList[0].notes;
    setState(() {});
  }

  updateNotes() async{
    maeasurementQuesList.forEach((element)async {
      element.notes = _textController.text;
      await hrController.updateMeasurementQues(element);
    });
    Navigator.of(context).pop();
  }
}
