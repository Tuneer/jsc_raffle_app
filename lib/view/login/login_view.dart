import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_color.dart';
import '../../res/components/header_widget.dart';
import '../../res/components/round_button.dart';
import '../../utils/device_info.dart';
import '../../view_models/controller/login/login_view_model.dart';
import 'widgets/input_password_widget.dart';
import 'widgets/input_username_widget.dart';
import 'widgets/login_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());

  final _formkey = GlobalKey<FormState>();

  late String mobile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        HeaderWidget(),
                        const SizedBox(height: 30),
                        InputUsernameWidget(),
                        const SizedBox(height: 10),
                        InputPasswordWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundButton(
                          buttonColor: Colors.red.shade900,
                          textColor: AppColor.primaryButtonTextColor,
                          width: DeviceInfo(context).shortestSide! * 0.4,
                          title: 'cancel'.tr.toUpperCase(),
                          loading: false,
                          onPress: () {
                            exit(0);
                          }),
                      LoginButtonWidget(
                        formKey: _formkey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
