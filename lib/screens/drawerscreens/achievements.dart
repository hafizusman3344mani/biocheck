import 'dart:async';

import 'package:biocheck/common/models/acievement_model.dart';
import 'package:biocheck/common/ui_widgets/appbar2.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  var achievments = List<AchievementModel>();

  @override
  Widget build(BuildContext context) {
    buildList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(AppValue.screenWidth(context), 120.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerItemsAppBar(S.of(context).navigationOption5, false),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Textview(
                  S.of(context).achievementTitle,
                  14.0,
                  FontWeight.normal,
                  AppColors.acheivementsTextColor.withOpacity(0.6),
                  TextAlign.right),
            ),
          ],
        ),
      ),
      body: Material(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Card(
            elevation: 4.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: WidgetProps.getAppGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.parrotGreen,
                ),
              ),
              child: ListView.builder(
                itemCount: achievments.length,
                itemBuilder: (context, index) {
                  return _getCommonListItem(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCommonListItem(int index) {
    if (index == 15) {
      return Column(
        children: [
          _getAchievement(achievments[index].title,
              achievments[index].descrption, achievments[index].image),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: Container(
                height: AppValue.screenHeight(context) * .17,
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
                      child: Icon(
                        Icons.help_outline_sharp,
                        color: Colors.white,
                        size: 48.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return _getAchievement(achievments[index].title,
          achievments[index].descrption, achievments[index].image);
    }
  }

  Widget _getAchievement(String title, String subTitle, String image) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
        child: Container(
          height: AppValue.screenHeight(context) * .17,
          child: Card(
            elevation: 4.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SvgPicture.asset(
                            image,
                            height: 36.0,
                            width: 36.0,
                          ),
                        ),
                        Textview(title, 14.0, FontWeight.w300,
                            AppColors.acheivementsTextColor, TextAlign.end),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Textview(subTitle, 14.0, FontWeight.w300,
                        AppColors.acheivementsTextColor, TextAlign.end),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buildList() {
    achievments.add(AchievementModel(S.of(context).Achievement1Title,
        S.of(context).Achievement1Desc, GlobalResources.ach_crown));
    achievments.add(AchievementModel(S.of(context).Achievement2Title,
        S.of(context).Achievement2Desc, GlobalResources.ach_page));
    achievments.add(AchievementModel(S.of(context).Achievement3Title,
        S.of(context).Achievement3Desc, GlobalResources.ach_clock));
    achievments.add(AchievementModel(S.of(context).Achievement4Title,
        S.of(context).Achievement4Desc, GlobalResources.ach_balance));
    achievments.add(AchievementModel(S.of(context).Achievement5Title,
        S.of(context).Achievement5Desc, GlobalResources.ach_recovery));
    achievments.add(AchievementModel(S.of(context).Achievement6Title,
        S.of(context).Achievement6Desc, GlobalResources.ach_santa_claus));
    achievments.add(AchievementModel(S.of(context).Achievement7Title,
        S.of(context).Achievement7Desc, GlobalResources.ach_analysis));
    achievments.add(AchievementModel(S.of(context).Achievement8Title,
        S.of(context).Achievement8Desc, GlobalResources.ach_start));
    achievments.add(AchievementModel(S.of(context).Achievement9Title,
        S.of(context).Achievement9Desc, GlobalResources.ach_goal_1));
    achievments.add(AchievementModel(S.of(context).Achievement16Title,
        S.of(context).Achievement16Desc, GlobalResources.ach_road));
    achievments.add(AchievementModel(S.of(context).Achievement10Title,
        S.of(context).Achievement10Desc, GlobalResources.ach_allinc));
    achievments.add(AchievementModel(S.of(context).Achievement11Title,
        S.of(context).Achievement11Desc, GlobalResources.ach_superhero));
    achievments.add(AchievementModel(S.of(context).Achievement12Title,
        S.of(context).Achievement12Desc, GlobalResources.ach_focus));
    achievments.add(AchievementModel(S.of(context).Achievement13Title,
        S.of(context).Achievement13Desc, GlobalResources.ach_monthy_calander));
    achievments.add(AchievementModel(S.of(context).Achievement14Title,
        S.of(context).Achievement14Desc, GlobalResources.ach_military_rank));
    achievments.add(AchievementModel(S.of(context).Achievement15Title,
        S.of(context).Achievement15Desc, GlobalResources.ach_worldlove));
  }
}
