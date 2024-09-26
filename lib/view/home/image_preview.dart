import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/styles/text_styles.dart';
import '../../view_models/controller/home/home_view_model.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({super.key});

  final HomeViewModel homeVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '${homeVM.selectedReceipt.value.orderNo}',
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
        child: Center(
          child: Image.network(
            'http://3.135.219.244:2071/Content/Item/${homeVM.selectedReceipt.value.referenceId}',
            fit: BoxFit.contain,
            errorBuilder: (ctx, o, n) {
              return const Icon(
                Icons.image_outlined,
                size: 120,
              );
            },
          ),
        ),
      ),
    );
  }
}
