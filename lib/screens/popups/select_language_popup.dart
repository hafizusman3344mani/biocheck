import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/preferences.dart';
import 'package:biocheck/common/ui_widgets/common_bottom_bar.dart';
import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SelectLanguagePopup extends StatelessWidget {
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
            height: MediaQuery.of(context).size.height / 1.7,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 300.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _getElevatedImage(GlobalResources.bn, 'nl', context),
                          _getElevatedImage(
                              GlobalResources.united, 'en', context),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _getElevatedImage(GlobalResources.bg, 'bg', context),
                          _getElevatedImage(GlobalResources.fr, 'fr', context),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(3.0),
                        bottomRight: Radius.circular(3.0)),
                    gradient: WidgetProps.getAppGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.redGradien,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: GetIcon(
                          path: GlobalResources.ic_close,
                          color: Colors.white,
                          height: 23.0,
                          width: 23.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getElevatedImage(String path, String lng, BuildContext context) {
    return GestureDetector(
      onTap: () async {
      if(lng=='nl' || lng=='en') {
        await SharedPref.save(Constants.appLocale, lng);
        Locale newLocale = Locale(lng);
        HomePage.setLocale(context, newLocale);
        Navigator.of(context).pop();
      }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 1.0,
        borderRadius: BorderRadius.circular(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Container(
            width: 100.0,
            height: 65.0,
            child: SvgPicture.asset(
              path,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
