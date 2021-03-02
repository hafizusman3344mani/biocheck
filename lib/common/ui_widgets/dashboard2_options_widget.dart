import 'package:biocheck/common/ui_widgets/custom_innershadow_widget.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/theme_color_mode.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'inner_shadow.dart';
import 'textview2.dart';

class Feature extends StatelessWidget {
  final Gradient _gradient;
  final String title;
  final Color titleColor;
  final Function onTap;
  final bool isDisabled;

  Feature(
      this._gradient, this.title, this.titleColor, this.onTap, this.isDisabled);

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: GestureDetector(
          onTap: onTap,
          child: ColorResources.instance.getMode
              ? ShadowedWidget2(
                  height: 134.5,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.bodyColorMode,
                    ),
                    child: Textview2(
                        color: AppColors.featureTextColorMode,
                        lineHeight: 1.7,
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w300,
                        fontSize: 21,
                        title: title),
                  ),
                )
              : ShadowedWidget(
                  height: 134.5,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.bodyColorMode,
                    ),
                    child: Textview2(
                        color: AppColors.featureTextColorMode,
                        lineHeight: 1.7,
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w300,
                        fontSize: 21,
                        title: title),
                  ),
                ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: AppValue.screenWidth(context),
              height: 134.5,
              decoration: BoxDecoration(
                gradient: _gradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Textview2(
                        color: titleColor,
                        lineHeight: 1.7,
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w300,
                        fontSize: 21,
                        title: title)),
              ),
            ),
          ),
        ),
      );
    }
  }
}
