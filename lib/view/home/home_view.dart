import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../res/components/app_bar.dart';
import '../../res/routes/routes_name.dart';
import '../../res/slider/slider_view.dart';
import '../../utils/device_info.dart';
import '../../utils/utils.dart';
import '../../view_models/controller/home/home_view_model.dart';
import 'widget/upload_receipt_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const int flagImage = 1, flagVideo = 2;

  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  late String title;

  XFile? _capturedFile;

  bool isImage = true;

  final _formkey = GlobalKey<FormState>();

  final homeVM = Get.put(HomeViewModel());

  @override
  void initState() {
    title = 'app_name'.tr;
    super.initState();
  }

  chooseOptionToCaptureImageOrVideo() {
    final ImagePicker picker = ImagePicker();

    AwesomeDialog(
      context: navigatorKey.currentContext!,
      title: 'app_name'.tr,
      animType: AnimType.scale,
      dialogType: DialogType.question,
      width: DeviceInfo(navigatorKey.currentContext!).shortestSide! * 0.9,
      btnOkText: 'image'.tr,
      btnOkOnPress: () async {
        chooseOptionToCaptureFile(flagImage);
      },
      btnCancelText: 'video'.tr,
      btnCancelOnPress: () async {
        chooseOptionToCaptureFile(flagVideo);
      },
      desc: 'alert_file_picker'.tr,
    ).show();
  }

  chooseOptionToCaptureFile(int type) {
    final ImagePicker picker = ImagePicker();

    AwesomeDialog(
      context: navigatorKey.currentContext!,
      title: 'app_name'.tr,
      animType: AnimType.scale,
      dialogType: DialogType.question,
      width: DeviceInfo(navigatorKey.currentContext!).shortestSide! * 0.9,
      btnOkText: 'gallery'.tr,
      btnOkOnPress: () async {
        if (type == flagImage) {
          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
            maxHeight: 800,
            maxWidth: 800,
            imageQuality: 98,
          );
          _capturedFile = image;
          isImage = true;
          setState(() {});
          homeVM.file.value = File(_capturedFile!.path);
          homeVM.fileName.value = _capturedFile!.name;
        } else {
          final XFile? video = await picker.pickVideo(
            source: ImageSource.gallery,
            maxDuration: const Duration(seconds: 30),
          );
          _capturedFile = video;
          isImage = false;
          setState(() {});
          homeVM.file.value = File(_capturedFile!.path);
          homeVM.fileName.value = _capturedFile!.name;
        }
      },
      btnCancelText: 'camera'.tr,
      btnCancelOnPress: () async {
        if (type == flagImage) {
          final XFile? image = await picker.pickImage(
            source: ImageSource.camera,
            maxHeight: 800,
            maxWidth: 800,
            imageQuality: 98,
            preferredCameraDevice: CameraDevice.front,
          );
          _capturedFile = image;
          isImage = true;
          setState(() {});
          homeVM.file.value = File(_capturedFile!.path);
          homeVM.fileName.value = _capturedFile!.name;
        } else {
          final XFile? video = await picker.pickVideo(
            source: ImageSource.camera,
            maxDuration: const Duration(seconds: 30),
            preferredCameraDevice: CameraDevice.front,
          );
          _capturedFile = video;
          isImage = false;
          setState(() {});
          homeVM.file.value = File(_capturedFile!.path);
          homeVM.fileName.value = _capturedFile!.name;
        }
      },
      desc: 'alert_file_picker'.tr,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        appBar: AppBarWidget.getAppBar(
          context: context,
          title: title,
        ),
        slideDirection: SlideDirection.RIGHT_TO_LEFT,
        key: _sliderDrawerKey,
        sliderOpenSize: 200,
        slider: SliderView(
          onItemClick: (title) {
            _sliderDrawerKey.currentState!.closeSlider();

            switch (title) {
              case 'Participating List':
                Get.toNamed(RouteName.participatingListView);
                break;

              case 'Upload Steps':
                Get.toNamed(RouteName.uploadStepsView);
                break;

              case 'Past Receipts':
                Get.toNamed(RouteName.pastReceiptsView);
                break;

              case 'LogOut':
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.question,
                  width: DeviceInfo(context).shortestSide! * 0.95,
                  btnOkText: 'yes'.tr,
                  btnOkOnPress: () {
                    Utils.logout();
                  },
                  btnCancelText: 'no'.tr,
                  btnCancelOnPress: () {},
                  desc: 'alert_logout'.tr,
                ).show();
                break;
            }
          },
        ),
        child: Container(
          color: const Color(0xfff5f5f5),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_capturedFile != null)
                        (isImage)
                            ? Image.file(
                                width: 250,
                                height: 250,
                                fit: BoxFit.contain,
                                File(_capturedFile!.path),
                              )
                            : Container(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: chooseOptionToCaptureImageOrVideo,
                            child: Text('choose_file'.tr),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              _capturedFile == null
                                  ? 'No file selected'
                                  : _capturedFile!.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: DeviceInfo(context).shortestSide! * 0.6,
                        child: TextField(
                          controller:
                              homeVM.specialInstructionsController.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Type your comments here !",
                            fillColor: Colors.white70,
                          ),
                          keyboardType: TextInputType.multiline,
                          minLines: 4,
                          maxLines: 4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      UploadReceiptButtonWidget(
                        formKey: _formkey,
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed(RouteName.homeView);
                        },
                        child: Text('reset'.tr),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
