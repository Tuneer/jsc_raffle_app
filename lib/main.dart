import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/my_http_overrides.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';

import 'res/getx_loclization/languages.dart';
import 'res/routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locale locale = await getLocale();

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(locale: locale));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  Locale locale;

  MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app_name'.tr,
      themeMode: ThemeMode.light,
      translations: Languages(),
      locale: locale,
      fallbackLocale: locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.appRoutes(),
      navigatorKey: navigatorKey,
    );
  }
}

Future<Locale> getLocale() async {
  String languageCode = await UserPreference().getLanguage();

  switch (languageCode) {
    case 'hi':
      return const Locale('hi', 'IN');

    case 'en':
      return const Locale('en', 'US');

    default:
      return const Locale('en', 'US');
  }
}
