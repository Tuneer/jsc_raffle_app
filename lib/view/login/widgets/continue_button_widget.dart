import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/routes/routes_name.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/alert_type.dart';
import '../../../utils/device_info.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class ContinueButtonWidget extends StatelessWidget {
  final formKey;

  ContinueButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final LoginViewModel loginVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
        buttonColor: AppColor.primaryButtonColor,
        textColor: AppColor.primaryButtonTextColor,
        width: DeviceInfo(context).shortestSide! * 0.5,
        title: 'continue'.tr.toUpperCase(),
        loading: loginVM.loading.value,
        onPress: () {
          if (formKey.currentState!.validate()) {
            var mobile = loginVM.usernameController.value.text ?? '';
            if (mobile == '' ||
                mobile.length < 10 ||
                mobile.startsWith("0") ||
                mobile.startsWith("1") ||
                mobile.startsWith("2") ||
                mobile.startsWith("3") ||
                mobile.startsWith("4") ||
                mobile.startsWith("5")) {
              Utils.snackBar(AlertType.error, 'alert'.tr, 'username_val'.tr);
              return;
            }

            //loginVM.loginSendOTPApi();

            Get.toNamed(RouteName.loginView,
                    arguments: [loginVM.usernameController.value.text])!
                .then((value) {});
          }
        }));
  }
}
