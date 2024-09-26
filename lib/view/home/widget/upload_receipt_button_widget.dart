import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/alert_type.dart';
import '../../../utils/device_info.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/home/home_view_model.dart';
import '../../../view_models/controller/user_preference/user_prefrence_view_model.dart';

class UploadReceiptButtonWidget extends StatelessWidget {
  final formKey;

  UploadReceiptButtonWidget({super.key, required this.formKey});

  UserPreference userPreference = UserPreference();
  final HomeViewModel homeVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
        buttonColor: AppColor.primaryButtonColor,
        textColor: AppColor.primaryButtonTextColor,
        width: DeviceInfo(context).shortestSide! * 0.6,
        title: 'upload'.tr.toUpperCase(),
        loading: homeVM.loading.value,
        onPress: () {
          if (formKey.currentState!.validate()) {
            if (homeVM.file.value == null) {
              Utils.showAlert(
                  AlertType.error, 'app_name'.tr, 'Please choose an image!');
              return;
            }

            homeVM.fileUpload(homeVM.file.value, homeVM.fileName.value,
                homeVM.specialInstructionsController.value.text ?? 'NA');
          }
        }));
  }
}
