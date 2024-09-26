import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../main.dart';
import '../../../models/login/user_model.dart';
import '../../../models/participating_merchant_model.dart';
import '../../../models/receipt_detail_model.dart';
import '../../../repository/home_repository/home_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/alert_type.dart';
import '../../../utils/device_info.dart';
import '../../../utils/utils.dart';
import '../user_preference/user_prefrence_view_model.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final pastReceipts = <ReceiptDetailModel>[];
  final searchReceipts = <ReceiptDetailModel>[].obs;
  final selectedReceipt = ReceiptDetailModel().obs;

  final participatingMerchants = <ParticipatingMerchantModel>[];
  final searchMerchants = <ParticipatingMerchantModel>[].obs;

  final file = File('').obs;
  final fileName = ''.obs;
  final webUserId = ''.obs;
  final specialInstructionsController = TextEditingController().obs;

  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  RxBool loading = false.obs;

  UserPreference userPreference = UserPreference();

  @override
  void onInit() {}

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setError(String _value) => error.value = _value;

  Future<void> getPastReceipts() async {
    pastReceipts.clear();
    searchReceipts.clear();
    searchReceipts.refresh();

    setRxRequestStatus(Status.LOADING);

    UserModel user = await userPreference.getUser();

    _api.getPastReceipts('${user.webUserId}').then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if (value.isNotEmpty) {
        pastReceipts.clear();
        pastReceipts.addAll(value);
        searchReceipts.value = value;
      } else {
        Utils.showAlert(AlertType.warning, 'app_name'.tr, 'Result not found!');
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  getSearchReceipts(String searchTxt) {
    var tempList = <ReceiptDetailModel>[];

    if (searchTxt == '') {
      searchReceipts.value = pastReceipts;
      searchReceipts.refresh();
      return;
    }

    for (var e in pastReceipts) {
      if (e.orderNo! == searchTxt) {
        tempList.add(e);
      }
    }
    searchReceipts.value = tempList;
    searchReceipts.refresh();
  }

  Future<void> fileUpload(
      File file, var fileName, var specialInstructions) async {
    Map data = {
      'file': file,
    };
    loading.value = true;

    _api.fileUpload(data, fileName).then((value) async {
      loading.value = false;
      if (value.saleOrderId != null) {
        updateUserComment('${value.saleOrderId}', '${value.webUserId}',
            '$specialInstructions');
      } else {
        Utils.showAlert(AlertType.warning, 'app_name'.tr, 'Result not found!');
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      loading.value = false;
    });
  }

  Future<void> updateUserComment(
      var salesOrderId, var webUserId, var specialInstructions) async {
    loading.value = true;

    _api
        .updateUserComment(
            salesOrderId, webUserId, specialInstructions.toString().trim())
        .then((value) async {
      loading.value = false;
      if (value.status!) {
        AwesomeDialog(
          context: navigatorKey.currentContext!,
          title: 'app_name'.tr,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          width: DeviceInfo(navigatorKey.currentContext!).shortestSide! * 0.9,
          btnOkText: 'ok'.tr,
          btnOkOnPress: () {
            Get.offAllNamed(RouteName.homeView);
          },
          desc: '${value.message}',
        ).show();
      } else {
        Utils.showAlert(AlertType.warning, 'app_name'.tr, 'Result not found!');
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      loading.value = false;
    });
  }

  Future<void> getParticipatingMerchants() async {
    participatingMerchants.clear();
    searchMerchants.clear();
    searchMerchants.refresh();

    setRxRequestStatus(Status.LOADING);

    _api.getParticipatingMerchants().then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if (value.isNotEmpty) {
        participatingMerchants.clear();
        participatingMerchants.addAll(value);
        searchMerchants.value = value;
      } else {
        Utils.showAlert(AlertType.warning, 'app_name'.tr, 'Result not found!');
      }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  getSearchMerchants(String searchTxt) {
    var tempList = <ParticipatingMerchantModel>[];

    if (searchTxt == '') {
      searchMerchants.value = participatingMerchants;
      searchMerchants.refresh();
      return;
    }

    for (var e in participatingMerchants) {
      if (e.restaurantName! == searchTxt) {
        tempList.add(e);
      }
    }
    searchMerchants.value = tempList;
    searchMerchants.refresh();
  }
}
