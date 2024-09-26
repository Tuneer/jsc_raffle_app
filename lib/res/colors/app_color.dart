import 'dart:ui';

import 'package:get/get.dart';

class AppColor {
  static Color primaryColor =
      Get.isDarkMode ? const Color(0xff0B406B) : const Color(0xfffbe74d);

  static Color primaryTextColor =
      Get.isDarkMode ? const Color(0xdd000000) : const Color(0xffffffff);
  static Color secondaryTextColor =
      Get.isDarkMode ? const Color(0xddffffff) : const Color(0xff000000);
  static const Color redColor = Color(0xffFC3F5B);

  static Color primaryButtonColor =
      Get.isDarkMode ? const Color(0xbbdad8d8) : const Color(0xff44972c);

  static Color primaryButtonTextColor =
      Get.isDarkMode ? const Color(0xff414141) : const Color(0xfff3f3f3);

  static Color inputIconColor =
      Get.isDarkMode ? const Color(0xff0B406B) : const Color(0xff0B406B);

  static Color solitude = Get.isDarkMode
      ? const Color.fromRGBO(245, 246, 247, 1.0)
      : const Color.fromRGBO(225, 225, 225, 0.8);
  static Color gullGreyColor = Get.isDarkMode
      ? const Color.fromRGBO(170, 175, 179, 1.0)
      : const Color.fromRGBO(82, 82, 82, 1.0);

  static Color toastBGColor =
      Get.isDarkMode ? const Color(0xbbffffff) : const Color(0xbb000000);
  static Color snackBarBGColor =
      Get.isDarkMode ? const Color(0xbbffffff) : const Color(0x22000000);
  static Color hyperlinkColor =
      Get.isDarkMode ? const Color(0xdda1aee7) : const Color(0xff0070E0);
}
