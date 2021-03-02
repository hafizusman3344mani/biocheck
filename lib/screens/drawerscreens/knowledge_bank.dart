import 'package:biocheck/common/ui_widgets/expandable_view.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KnowledgeBank extends StatefulWidget {
  @override
  _KnowledgeBankState createState() => _KnowledgeBankState();
}

class _KnowledgeBankState extends State<KnowledgeBank>
    with SingleTickerProviderStateMixin {
  bool shareWithWifi = false;

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
              title: Textview(S.of(context).navigationOption4, 20.0,
                  FontWeight.w300, AppColors.welcomeTextColor, TextAlign.start),
              automaticallyImplyLeading: false,
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
            Container(
              height: 55.0,
              color: Colors.white,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetIcon(
                      path: GlobalResources.ic_search,
                      width: 18.0,
                      height: 18.0,
                      color: AppColors.welcomeTextColor.withOpacity(0.6),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
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
        margin: EdgeInsets.only(top:20.0),
        color: AppColors.commonAppbarColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getExpandableText(S.of(context).KB1Title, S.of(context).KB1Desc,"1"),
              _getExpandableText(S.of(context).KB2Title, S.of(context).KB2Desc,"2"),
              _getExpandableText(S.of(context).KB3Title, S.of(context).KB3Desc,"3"),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  child: Container(
                    height: 80.0,
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: WidgetProps.getAppGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.redGradien,
                          ),
                        ),
                        child: Center(
                          child: GetIcon(
                            path: GlobalResources.ic_help,
                            width: 35.0,
                            height: 35.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getExpandableText(String title, String subTitle,String srNo) {

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          elevation: 3.0,
          child: Container(
            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.only(bottom: 10.0,),
            child: ExpandablePanel(
              header: Textview2(
                title: title,
                color: AppColors.calenderDateTextColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
              collapsed: Text(
                smallSentence(subTitle),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.calenderDateTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300),
              ),
              expanded: Text(
                subTitle,
                softWrap: true,
                style: TextStyle(
                    color: AppColors.calenderDateTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                height: 1.5),
              ),
              srNo: srNo,
            ),
          ),
        ),
      ),
    );
  }

  String smallSentence(String bigSentence){
    if(bigSentence.length > 40){
      return bigSentence.substring(0,40) + '...';
    }
    else{
      return bigSentence;
    }
  }
}
