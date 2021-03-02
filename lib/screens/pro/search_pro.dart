import 'package:biocheck/common/ui_widgets/appbar2.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProSearch extends StatefulWidget {
  @override
  _ProSearchState createState() => _ProSearchState();
}

class _ProSearchState extends State<ProSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(AppValue.screenWidth(context), 120.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerItemsAppBar("PRO",false),
            Container(
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
                          S.of(context).Search,
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
      body: Container(
        color: AppColors.commonAppbarColor,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return _getCommonListItem("Maandag  - week 1", index);
          },
        ),
      ),
    );
  }

  Widget _getCommonListItem(String title, int index) {
    if (index % 2 == 0) {
      return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Container(
            height: AppValue.screenHeight(context) / 7.5,
            child: Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Textview(title, 20.0, FontWeight.normal,
                            AppColors.welcomeTextColor, TextAlign.start),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 39.0,
                      decoration: BoxDecoration(
                        gradient: WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.parrotGreen,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GetIcon(
                                height: 16.0,
                                width: 22.0,
                                path: GlobalResources.ic_heart_red,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Textview('121', 20.0, FontWeight.normal,
                                    Colors.white, TextAlign.start),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GetIcon(
                                height: 19.0,
                                width: 13.0,
                                path: GlobalResources.ic_location_marker,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Textview('10 km', 20.0, FontWeight.normal,
                                    Colors.white, TextAlign.start),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Container(
            height: AppValue.screenHeight(context) / 7.5,
            child: Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Textview(title, 20.0, FontWeight.normal,
                          AppColors.welcomeTextColor, TextAlign.start),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 35.0,
                      decoration: BoxDecoration(
                        gradient: WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.redGradien,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GetIcon(
                                height: 16.0,
                                width: 22.0,
                                path: GlobalResources.ic_heart_red,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Textview('121', 20.0, FontWeight.normal,
                                    Colors.white, TextAlign.start),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GetIcon(
                                height: 19.0,
                                width: 13.0,
                                path: GlobalResources.ic_location_marker,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Textview('10 km', 20.0, FontWeight.normal,
                                    Colors.white, TextAlign.start),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
