import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../database/database.dart';
import '../../utils/alert_type.dart';
import '../main.dart';
import '../res/routes/routes_name.dart';
import '../view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'device_info.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static _getSnackBarColor(dynamic alertType) {
    switch (alertType) {
      case AlertType.success:
        return Colors.green[900];
      case AlertType.info:
        return Colors.blue[900];
      case AlertType.error:
        return Colors.red[900];
      case AlertType.warning:
        return Colors.orange[900];
      default:
        return Colors.black;
    }
  }

  static snackBar(AlertType alertType, String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: _getSnackBarColor(alertType),
      colorText: Colors.white,
    );

    if (message == 'Token Validation Has Failed. Request Access Denied') {
      logout();
    }
  }

  static _getAlertType(dynamic alertType) {
    switch (alertType) {
      case AlertType.success:
        return DialogType.success;
      case AlertType.info:
        return DialogType.info;
      case AlertType.error:
        return DialogType.error;
      case AlertType.warning:
        return DialogType.warning;
      case AlertType.question:
        return DialogType.question;
      case AlertType.noHeader:
        return DialogType.noHeader;
      default:
        return DialogType.info;
    }
  }

  static showAlert(dynamic alertType, String title, String message,
      {bool isExitApp = false}) {
    if (alertType == AlertType.error) {
      AwesomeDialog(
        context: navigatorKey.currentContext!,
        title: title,
        animType: AnimType.scale,
        dialogType: _getAlertType(alertType),
        width: DeviceInfo(navigatorKey.currentContext!).shortestSide! * 0.9,
        btnCancelText: 'ok'.tr,
        btnCancelOnPress: () {
          if (isExitApp) {
            exit(0);
          }

          if (message == 'Token Validation Has Failed. Request Access Denied') {
            logout();
          }
        },
        desc: message,
      ).show();
    } else {
      AwesomeDialog(
        context: navigatorKey.currentContext!,
        title: title,
        animType: AnimType.scale,
        dialogType: _getAlertType(alertType),
        width: DeviceInfo(navigatorKey.currentContext!).shortestSide! * 0.9,
        btnOkText: 'ok'.tr,
        btnOkOnPress: () {
          if (isExitApp) {
            exit(0);
          }

          if (message == 'Token Validation Has Failed. Request Access Denied') {
            logout();
          }
        },
        desc: message,
      ).show();
    }
  }

  static showForceUpdateAlert() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;

    AwesomeDialog(
      context: navigatorKey.currentContext!,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      title: 'app_name'.tr,
      animType: AnimType.scale,
      dialogType: DialogType.info,
      width: DeviceInfo(navigatorKey.currentContext!).shortestSide! * 0.9,
      btnOkText: 'update'.tr,
      btnOkOnPress: () {
        if (Platform.isIOS) {
          String appName = packageInfo.appName;
          String appId = '';
          Utils.launchBrowser('https://apps.apple.com/app/$appName/id$appId');
        } else {
          Utils.launchBrowser(
              'https://play.google.com/store/apps/details?id=$packageName');
        }
        exit(0);
      },
      desc: 'alert_update'.tr,
    ).show();
  }

  static void logout() {
    UserPreference().removeLogin().then((value) async {
      try {
        AppDatabase database = await openDatabase();
        database.receiptListDataDao.deleteAllReceiptDetail();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      Get.offAllNamed(RouteName.loginView);
    });
  }

  static Future<String> getIPAddress() async {
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      debugPrint('IP: ${data.toString()}');
      return data['ip'];
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      if (kDebugMode) {
        print(exception.message);
      }
      return "";
    }
  }

  static Future<void> launchBrowser(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  static switchScreenAfterLogin() {
    Get.offAllNamed(RouteName.homeView);
  }

  static Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String buildNumber = packageInfo.buildNumber;
    return buildNumber;
  }
}
