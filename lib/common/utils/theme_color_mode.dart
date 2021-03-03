import 'colors.dart';

class ColorResources {
  ColorResources._privateConstructor();

  static final ColorResources _instance = ColorResources._privateConstructor();

   bool _isDarkMode = false;

  bool get getMode => _isDarkMode;

  static ColorResources get instance => _instance;

  void setMode(bool val) {
    _isDarkMode = val;
  }
}
