import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/utils/pushed_route.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'colors.dart';
import 'routepage.dart';

class WidgetProps {
  static var textStyleInputFiled = TextStyle(
      color: AppColors.welcomeTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 15.0);

  static EdgeInsets audioSettingsCommonPadding =
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0);

  static Widget divider = Container(
    height: 1.0,
    decoration: BoxDecoration(
      gradient: WidgetProps.getAppGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.welcomeButton,
      ),
    ),
  );

  static goToNextPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(RoutePage(
      builder: (context) => widget,
    ));
  }

  static pushUpToNextPage({BuildContext context, Widget enterPage,Widget exitPage}) {

    Navigator.push(
        context,
        CupertinoRoutePushUp(
            exitPage: exitPage,
            enterPage: enterPage));
  }

  static pushUpToNextPageRelace({BuildContext context, Widget enterPage,Widget exitPage}) {
    Navigator.pushReplacement(
        context,
        CupertinoRoutePushUp(
            exitPage: exitPage,
            enterPage: enterPage));
  }
  static pushUpToNextPageFinishUntill({BuildContext context, Widget enterPage,Widget exitPage}) {
    Navigator.of(context)
        .pushAndRemoveUntil(CupertinoRoutePushUp(
        exitPage: exitPage,
        enterPage: enterPage), (Route<dynamic> route) => false);
  }

  static pushLeftToNextPage({BuildContext context, Widget enterPage,Widget exitPage}) {

    Navigator.push(
        context,
        CupertinoRoutePushLeft(
            exitPage: exitPage,
            enterPage: enterPage));
  }

  static pushLeftToNextPageRelace({BuildContext context, Widget enterPage,Widget exitPage}) {
    Navigator.pushReplacement(
        context,
        CupertinoRoutePushLeft(
            exitPage: exitPage,
            enterPage: enterPage));
  }
  static pushLeftToNextPageFinishUntill({BuildContext context, Widget enterPage,Widget exitPage}) {
    Navigator.of(context)
        .pushAndRemoveUntil(CupertinoRoutePushLeft(
        exitPage: exitPage,
        enterPage: enterPage), (Route<dynamic> route) => false);
  }


  static pushDownToNextPage({BuildContext context, Widget enterPage,Widget exitPage}) {

    Navigator.push(
        context,
        CupertinoRoutePushDown(
            exitPage: exitPage,
            enterPage: enterPage));
  }

  static pushDownToNextPageRelace({BuildContext context, Widget enterPage,Widget exitPage}) {
    Navigator.pushReplacement(
        context,
        CupertinoRoutePushDown(
            exitPage: exitPage,
            enterPage: enterPage));
  }
  static pushDownToNextPageFinishUntill({BuildContext context, Widget enterPage,Widget exitPage}) {
    Navigator.of(context)
        .pushAndRemoveUntil(CupertinoRoutePushDown(
        exitPage: exitPage,
        enterPage: enterPage), (Route<dynamic> route) => false);
  }


  static LinearGradient getAppGradient(
      {List<Color> colors, Alignment begin, Alignment end}) {
    return LinearGradient(
      colors: colors,
      begin: begin ?? Alignment.topLeft,
      end: end ?? Alignment.bottomRight,
    );
  }
  static LinearGradient getAppGradient1() {
    return LinearGradient(
      begin: Alignment(-1.0, 0.0),
      end: Alignment(1.0, 0.0),
      colors: AppColors.lgStrs
    );
  }
  static LinearGradient getAppGradient2() {
    return LinearGradient(
        begin: Alignment(-1.0, 0.0),
        end: Alignment(1.0, 0.0),
        colors: [
          const Color(0xffc50000),
          const Color(0xffe6eb38),
          const Color(0xffffbc00),
          const Color(0xffb9e04a),
          const Color(0xff4bc576),
          const Color(0xff3dc27c),
        ]
    );
  }


  static hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static SizedBox space(double size) {
    return SizedBox(
      height: size,
    );
  }

  static PageLink getLink({
      Widget child, int finished, Widget goTo, LinkTransition transition}) {
    return PageLink(
      isFinished: finished,
      isSplashed: false,
      links: [
        PageLinkInfo(
          trigger: LinkTrigger.Tap,
          transition: transition,
          ease: Constants.backout,
          duration: 0.4,
          pageBuilder: () => goTo,
        ),
      ],
      child: child,
    );
  }
}
