import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/faded_widget2.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/common_functions.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/history/history_with_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dashboard2.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool toggleCal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(AppValue.screenWidth(context), 120.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: AppColors.commonAppbarColor,
              elevation: 0.0,
              title: Container(
                width: AppValue.screenWidth(context) / 1.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleCal = !toggleCal;
                        });
                      },
                      child: Container(
                        width: 33.0,
                        height: 33.0,
                        child: Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: GetIcon(
                              width: 16.0,
                              height: 11.0,
                              path: toggleCal
                                  ? GlobalResources.ic_calendarT
                                  : GlobalResources.ic_list,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Textview(S.of(context).History, 20.0, FontWeight.w300,
                        AppColors.welcomeTextColor, TextAlign.start),
                  ],
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: ()=>Navigator.of(context).pop(),
                    child: GetIcon(
                      height: 18.0,
                      width: 18.0,
                      color: AppColors.dashboardTextColor,
                      path: GlobalResources.ic_close,
                    ),
                  ),
                )
              ],
            ),
            toggleCal
                ? Container()
                : Container(
                    height: 55.0,
                    color: Colors.white,
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetIcon(
                            height: 18.0,
                            width: 18.0,
                            path: GlobalResources.ic_search,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textview(
                                S.of(context).Filter,
                                20.0,
                                FontWeight.normal,
                                AppColors.welcomeTextColor.withOpacity(0.6),
                                TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
      body: toggleCal
          ? HistoryCalendar()
          : FadeWidget2(
              milisec: 400,
              curve: Curves.easeIn,
              child: Container(
                color: AppColors.commonAppbarColor,
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return _getCommonListItem("27.07.2019", "20.45", index);
                  },
                ),
              ),
            ),
    );
  }

  Widget _getCommonListItem(String title, String subTitle, int index) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Container(
          height: AppValue.screenHeight(context) * .15,
          child: Card(
            elevation: 4.0,
            child: Scaffold(
              body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textview(title, 20.0, FontWeight.w300,
                                AppColors.welcomeTextColor, TextAlign.start),
                            Textview('CVP', 20.0, FontWeight.w300,
                                AppColors.welcomeTextColor, TextAlign.start),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textview(subTitle, 20.0, FontWeight.w300,
                                AppColors.welcomeTextColor, TextAlign.start),
                            Textview('1:08:43', 20.0, FontWeight.w300,
                                AppColors.welcomeTextColor, TextAlign.start),
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: GetIcon(
                        width: 52.0,
                        height: 52.0,
                        path: GlobalResources.bikingPath,
                      ),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: index % 2 == 0
                  ? Container(
                      height: 10.0,
                      decoration: BoxDecoration(
                        gradient: WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.parrotGreen,
                        ),
                      ),
                    )
                  : Container(
                      height: 10.0,
                      decoration: BoxDecoration(
                        gradient: WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.parrotGreen,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
