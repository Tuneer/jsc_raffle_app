import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../controller/user_preference/user_prefrence_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.isLogin().then((isLogin) {
      if (!isLogin) {
        Timer(const Duration(milliseconds: 2500),
            () => Get.offAndToNamed(RouteName.loginView));
      } else {
        Timer(const Duration(milliseconds: 2500), () => switchScreen());
      }
    });
  }

  void switchScreen() {
    userPreference.isLogin().then((value) {
      if (value) {
        Utils.switchScreenAfterLogin();
      }
    });
  }
}
