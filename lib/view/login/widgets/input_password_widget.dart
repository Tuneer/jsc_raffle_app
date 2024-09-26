import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/styles/input_styles.dart';
import '../../../utils/device_info.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);

  final LoginViewModel loginVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceInfo(context).width! * 0.8,
      child: TextFormField(
        controller: loginVM.passwordController.value,
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'password_val'.tr;
          }
        },
        decoration: InputStyle.inputDecorationTextField(
          hint: 'password_hint'.tr,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: AppColor.inputIconColor,
          ),
        ),
      ),
    );
  }
}
