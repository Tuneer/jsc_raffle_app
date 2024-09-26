import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/styles/text_styles.dart';

class AppBarWidget {
  static SliderAppBar getAppBar({
    required BuildContext context,
    required String title,
    bool automaticallyImplyLeading = true,
  }) {
    return SliderAppBar(
      appBarHeight: 78,
      isTitleCenter: false,
      appBarColor: const Color(0xfffbe74d),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
            fit: BoxFit.contain,
            height: 42,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Styles.commonTextStyle(
                      context: context,
                      size: 6,
                      color: const Color(0xff44972c),
                      fontWeight: FontWeight.w500,
                    ).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 1.0),
                  Text(
                    'jsc'.tr,
                    style: Styles.commonTextStyle(
                      context: context,
                      size: 2.5,
                      color: const Color(0xff44972c),
                      fontWeight: FontWeight.w500,
                    ).copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
