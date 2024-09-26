import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/device_info.dart';
import '../../../view_models/controller/login/login_view_model.dart';
import '../../../view_models/controller/user_preference/user_prefrence_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;

  LoginButtonWidget({Key? key, required this.formKey}) : super(key: key);

  UserPreference userPreference = UserPreference();
  final LoginViewModel loginVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
        buttonColor: AppColor.primaryButtonColor,
        textColor: AppColor.primaryButtonTextColor,
        width: DeviceInfo(context).shortestSide! * 0.4,
        title: 'login'.tr.toUpperCase(),
        loading: loginVM.loading.value,
        onPress: () {
          if (formKey.currentState!.validate()) {
            loginVM.loginApi();
          }
        }));
  }
}
