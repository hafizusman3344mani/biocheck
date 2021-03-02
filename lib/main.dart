import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'common/constants.dart';
import 'common/preferences.dart';
import 'generated/l10n.dart';
import 'screens/startup/video_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    HomePage(),
  );
}

class HomePage extends StatefulWidget {
  static Future setLocale(BuildContext context, Locale newLocale) async {
    _HomePageState state = context.findAncestorStateOfType<_HomePageState>();
    await state.changeLanguage(newLocale);
  }

  static void setTheme(BuildContext context,int val) async {
    _HomePageState state = context.findAncestorStateOfType<_HomePageState>();
    state.changeTheme(val);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Locale _locale;
  ThemeData themeData=ThemeData(
    fontFamily: 'RobotoLight',
    // pageTransitionsTheme: PageTransitionsTheme(
    //   builders: {
    //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
  );


  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  changeTheme(int val) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
          theme: themeData,
          locale: _locale,
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            // 1
            S.delegate,
            // 2
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: VideoSplash(),
        );
  }
}
