import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  static const int timeout = 30;

  @override
  Future<dynamic> getApi(String url, {String bearerToken = ''}) async {
    debugPrint(url);

    var headers = <String, String>{};
    if (bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: timeout));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url,
      {String bearerToken = ''}) async {
    debugPrint(url);
    if (kDebugMode) {
      print(data);
    }

    var headers = <String, String>{};
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    if (bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              body: data != null ? jsonEncode(data) : null, headers: headers)
          .timeout(const Duration(seconds: timeout));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postMultipart(var data, String url, String fileName) async {
    debugPrint(url);
    if (kDebugMode) {
      print(data);
    }

    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var headers = <String, String>{};
      headers['Content-Type'] = 'multipart/form-data';

      if (data['file'] != null) {
        request.files.add(
          http.MultipartFile(
            'file',
            data['file'].readAsBytes().asStream(),
            data['file'].lengthSync(),
            filename: fileName,
          ),
        );
      }
      request.headers.addAll(headers);

      /*request.fields.addAll({
        "WebUserId": data['WebUserId'],
        "SpecialInstructions": data['SpecialInstructions'],
      });*/

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse)
          .timeout(const Duration(seconds: timeout));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> loadJsonFromAssets(String filePath) async {
    debugPrint(filePath);
    String jsonString = await rootBundle.loadString(filePath);
    dynamic responseJson = jsonDecode(jsonString);
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error occurred while communicating with server ${response.statusCode}');
    }
  }
}
