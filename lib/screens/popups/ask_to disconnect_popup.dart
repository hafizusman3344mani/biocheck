import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/db/repository/user_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/authentication/login.dart';
import 'package:biocheck/screens/dashboard/dashboard1.dart';
import 'package:biocheck/screens/dashboard/dashboard2.dart';
import 'package:biocheck/controllers/infrastructure/plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DisconnectFromDevicePopup extends StatelessWidget {
  var connectionController = Get.find<ConnectionController>();
  var hrController = Get.find<HRController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.45),
      body: Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          height: AppValue.screenHeight(context) / 1.7,
          width: AppValue.screenWidth(context),
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: AppValue.screenHeight(context) / 3,
                  margin: EdgeInsets.only(
                      bottom: (AppValue.screenHeight(context) / 2) / 3.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GetIcon(
                        path: GlobalResources.measureheartPath,
                      ),
                      Flexible(
                        flex: 1,
                        child: Textview(
                            S.of(context).diconnectPopupTitle,
                            24.0,
                            FontWeight.w300,
                            AppColors.dashboardTextColor,
                            TextAlign.center),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Textview(
                              S.of(context).DisconnectFromScreen,
                              14.0,
                              FontWeight.w300,
                              AppColors.dashboardTextColor,
                              TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: HeroButton(
                        width: AppValue.screenWidth(context) / 2,
                        height: AppValue.customButtonHeight,
                        title: S.of(context).yes,
                        gradient: WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.redGradien,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await ConnectionRepo.instance.deleteConnection();
                          connectionController.connection = null;
                          WidgetProps.pushDownToNextPageFinishUntill(
                              context: context,
                              enterPage: DashboardFirst(),
                              exitPage: this);
                        },
                        radius: 0.0,
                        textColor: Colors.white,
                      ),
                    ),
                    Flexible(
                      child: HeroButton(
                        width: AppValue.screenWidth(context) / 2,
                        height: AppValue.customButtonHeight,
                        title: S.of(context).no,
                        gradient: WidgetProps.getAppGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.parrotGreen,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        radius: 0.0,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
