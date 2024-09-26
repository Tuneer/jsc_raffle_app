import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login/user_model.dart';

class UserPreference {
  Future<bool> saveLogin(UserModel userModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('user', jsonEncode(userModel));
    sp.setBool('isLogin', true);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String user = sp.getString('user') ?? '';

    return user == '' ? UserModel() : UserModel.fromJson(jsonDecode(user));
  }

  Future<bool> saveLanguage(String languageCode) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('languageCode', languageCode);
    return true;
  }

  Future<String> getLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String languageCode = sp.getString('languageCode') ?? 'en';
    return languageCode;
  }

  Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    return isLogin;
  }

  Future<bool> removeLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isLogin', false);
    //sp.clear();
    return true;
  }
}
