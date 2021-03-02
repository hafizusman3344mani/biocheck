import 'package:flutter/material.dart';

import '../constants.dart';

class CupertinoRoutePushUp extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  CupertinoRoutePushUp({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Constants.backout,
                  reverseCurve: Curves.linearToEaseOut,
                ),
              ),
              child: enterPage,
            );
          },
          transitionDuration: Duration(milliseconds: Constants.pushTime),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(0, -1.0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.linearToEaseOut,
                      reverseCurve: Constants.backout,
                    ),
                  ),
                  child: exitPage,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Constants.backout,
                      reverseCurve: Curves.linearToEaseOut,
                    ),
                  ),
                  child: enterPage,
                )
              ],
            );
          },
        );
}

class CupertinoRoutePushDown extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  CupertinoRoutePushDown({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return enterPage;
          },
          transitionDuration: Duration(milliseconds: Constants.pushTime),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, -1.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.linearToEaseOut,
                      reverseCurve: Constants.backout,
                    ),
                  ),
                  child: exitPage,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, -1.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Constants.backout,
                      reverseCurve: Curves.linearToEaseOut,
                    ),
                  ),
                  child: enterPage,
                )
              ],
            );
          },
        );
}

class CupertinoRoutePushLeft extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  CupertinoRoutePushLeft({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return enterPage;
          },
          transitionDuration: Duration(milliseconds: Constants.pushTime),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(-1.0, 0.0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Constants.backout,
                      reverseCurve: Constants.backout,
                    ),
                  ),
                  child: exitPage,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Constants.backout,
                      reverseCurve: Curves.linearToEaseOut,
                    ),
                  ),
                  child: enterPage,
                )
              ],
            );
          },
        );
}
class CupertinoRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  CupertinoRoute({this.exitPage, this.enterPage})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) {
      return enterPage;
    },
    transitionDuration: Duration(milliseconds: 2500),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      return Stack(
        children: <Widget>[
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: const Offset(-0.1, 0.0),
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.easeInToLinear,
              ),
            ),
            child: Container(color: Colors.black54,),
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Constants.backout,
                reverseCurve: Curves.easeInToLinear,
              ),
            ),
            child: enterPage,
          )
        ],
      );
    },
  );
}
