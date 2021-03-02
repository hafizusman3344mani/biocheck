import 'package:get/get.dart';

class StartupController extends GetxController {
  bool isLanguage = true;
  bool isWelcomeScreen = false;
  bool isLogin = false;
  bool isStartupWalkThrough = false;

  bool isSlideDown = false;

  // StartupController()
  // {
  //   Get.put(LocaleController());
  // }

  setIsLanguage() {
    isLanguage = true;
    isWelcomeScreen = false;
    isLogin = false;
    isStartupWalkThrough = false;
  }

  setIsWalkThrough() {
    isLanguage = false;
    isWelcomeScreen = false;
    isLogin = false;
    isStartupWalkThrough = true;
  }

  setIsWelcome() {
    isLanguage = false;
    isWelcomeScreen = true;
    isLogin = false;
    isStartupWalkThrough = false;
  }

  setIsLogin() {
    isLanguage = false;
    isWelcomeScreen = false;
    isLogin = true;
    isStartupWalkThrough = false;
  }

  updateBuilder() {
    update();
  }
}
