import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpgradePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.65),
      body: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
            height: AppValue.screenHeight(context) / 1.5,
            margin: EdgeInsets.only(bottom: 100.0, left: 20.0,right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(top:15.0,right: 15.0),
                            child: GetIcon(
                              path: GlobalResources.ic_close,
                              height: 26.0,
                              width: 26.0,
                              color: AppColors.dashboardTextColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: GetIcon(
                                path: GlobalResources.ic_lock,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textview(
                                S.of(context).upgradeTitle,
                                24.0,
                                FontWeight.w300,
                                AppColors.dashboardTextColor,
                                TextAlign.center),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                          child: Column(
                            children: [
                               Textview2(
                                  title: S.of(context).upgradeDescription,
                                  color: AppColors.dashboardTextColor.withOpacity(0.5),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  textAlign: TextAlign.center,
                                  lineHeight: 1.4,
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Textview2(
                                    title: S.of(context).upgradeLinkStart,
                                    color: AppColors.dashboardTextColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    textAlign: TextAlign.justify,
                                    lineHeight: 1.4,
                                  ),
                                  Textview2(
                                    title: S.of(context).upgradeLink,
                                    color: AppColors.noAccTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    textAlign: TextAlign.justify,
                                    lineHeight: 1.4,
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),

                      ],
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
