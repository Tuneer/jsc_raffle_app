import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/styles/input_styles.dart';
import '../../../utils/device_info.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputUsernameWidget extends StatelessWidget {
  InputUsernameWidget({Key? key}) : super(key: key);

  final LoginViewModel loginVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceInfo(context).width! * 0.8,
      child: TextFormField(
        controller: loginVM.usernameController.value,
        keyboardType: TextInputType.text,
        maxLength: 30,
        validator: (value) {
          if (value!.isEmpty) {
            return 'username_val'.tr;
          }
        },
        decoration: InputStyle.inputDecorationTextField(
          hint: 'username_hint'.tr,
          prefixIcon: Icon(
            Icons.person_outline,
            color: AppColor.inputIconColor,
          ),
        ),
      ),
    );
  }
}
