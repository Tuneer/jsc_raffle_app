import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/login/user_model.dart';
import '../../../repository/login_repository/login_repository.dart';
import '../../../utils/alert_type.dart';
import '../../../utils/utils.dart';
import '../user_preference/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginApi() async {
    loading.value = true;

    Map data = {
      'UserName': usernameController.value.text,
      'Password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;

      if (value.webUserId == "null") {
        Utils.showAlert(AlertType.error, 'app_name'.tr,
            'The user name or password provided is incorrect.');
      } else {
        UserModel user = value;

        userPreference.saveLogin(user).then((value) {
          Utils.switchScreenAfterLogin();
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.showAlert(AlertType.error, 'alert'.tr, error.toString());
    });
  }
}
