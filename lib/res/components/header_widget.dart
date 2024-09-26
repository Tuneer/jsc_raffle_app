import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/image_assets.dart';
import '../styles/input_styles.dart';
import '../styles/text_styles.dart';
import '../../utils/device_info.dart';
import '../../utils/utils.dart';
import '../../view_models/controller/login/login_view_model.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(AppImages.logo),
            height: DeviceInfo(context).shortestSide! * 0.4,
            width: DeviceInfo(context).shortestSide! * 0.4,
          ),
          const SizedBox(height: 5),
          Text(
            'app_name'.tr.toUpperCase(),
            textAlign: TextAlign.center,
            style: Styles.regularSecondaryBold(context, 8),
          ),
          const SizedBox(height: 10),
          Text(
            'app_detail'.tr.toUpperCase(),
            textAlign: TextAlign.center,
            style: Styles.regularSecondary(context, 4),
          ),
        ],
      ),
    );
  }
}
