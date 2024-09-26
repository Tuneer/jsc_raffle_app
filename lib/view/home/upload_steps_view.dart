import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/styles/text_styles.dart';

class UploadStepsView extends StatefulWidget {
  const UploadStepsView({Key? key}) : super(key: key);

  @override
  State<UploadStepsView> createState() => _UploadStepsViewState();
}

class _UploadStepsViewState extends State<UploadStepsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'upload_steps'.tr,
          style: Styles.commonTextStyle(
            context: context,
            size: 6,
            color: const Color(0xff44972c),
            fontWeight: FontWeight.w500,
          ).copyWith(fontSize: 24),
        ),
        backgroundColor: const Color(0xfffbe74d),
        iconTheme: const IconThemeData(
          color: Color(0xff44972c),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xfff5f5f5),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.receiptSteps),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
