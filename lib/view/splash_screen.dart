import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/services/splash_services.dart';

import '../res/assets/image_assets.dart';
import '../res/colors/app_color.dart';
import '../res/styles/text_styles.dart';
import '../utils/device_info.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'developed_by'.tr,
                style: Styles.commonTextStyle(
                  context: context,
                  size: 3,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
