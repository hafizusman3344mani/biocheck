import 'package:biocheck/common/ui_widgets/common_dashboard.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InspirationSites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
        WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.parrotGreen,
        ),
      getList(context),
      Colors.white
    );
  }

  Widget getList(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return getListItem(index, context);
        },
      ),
    );
  }
  Widget getListItem(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: AppValue.screenHeight(context) / 4.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        image: DecorationImage(
          image: AssetImage(
            GlobalResources.reciepiePath1,
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
            padding: EdgeInsets.only(right: 10.0,left:10.0 ),
            height: 40.0,
            decoration: BoxDecoration(
              color: AppColors.dashboardTextColor.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview(
                  'Day '+(index+1).toString(),
                  16.0,
                  FontWeight.bold,
                  Colors.white,
                  TextAlign.right,
                ),
                Textview(
                  'Blauwe bessen en bananenbrood',
                  14.0,
                  FontWeight.normal,
                  Colors.white,
                  TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
