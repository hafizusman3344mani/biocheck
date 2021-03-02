import 'dart:async';

import 'package:biocheck/controllers/animations/ripple_effect_for_icon_press.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
import 'get_icon.dart';
import 'next.dart';

class BottomNavItem extends StatelessWidget {
  final Function onTap;
  final Color iconColor;
  final IconData icon;

  BottomNavItem(this.onTap, this.iconColor, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 48.0,
        color: iconColor,
      ),
    );
  }
}

class BottomNavItem2 extends StatelessWidget {
  final Function onTap;
  final Color iconColor;
  final String icon;
  double width;
  double height;

  BottomNavItem2(
      {this.onTap, this.iconColor, this.icon, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Splash(
      onTap: onTap,
      child: GetIcon(
        height: height,
        width: width,
        path: icon,
        color: iconColor,
      ),
    );
  }
}

class BottomNavItem3 extends StatelessWidget {
  final Widget onTap;
  final Color iconColor;
  final String icon;
  double width;
  double height;
  final int isFinished;
  final LinkTransition transition;

  BottomNavItem3(
      {this.onTap,
      this.iconColor,
      this.icon,
      this.height,
      this.width,
      this.isFinished,
      this.transition});

  @override
  Widget build(BuildContext context) {
    return PageLink(
      isFinished: isFinished,
      links: [
        PageLinkInfo(
          trigger: LinkTrigger.Tap,
          transition: transition,
          ease: Constants.backout,
          duration: 0.4,
          pageBuilder: () => onTap,
        ),
      ],
      isSplashed: true,
      child: GetIcon(
        height: height,
        width: width,
        path: icon,
        color: iconColor,
      ),
    );
  }


}
