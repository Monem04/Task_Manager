import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:untitled/ui/controllers/auth_controller.dart';
import 'package:untitled/ui/screen/sign_in_screen.dart';

import '../../app.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went arong',
  });
}

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, Map<String, dynamic>? params}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint('URL => $url');
      //debugPrint('BODY => $');
      Response response =
          await get(uri, headers: {'token': AuthController.accessToken ?? ''});
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse,
            errorMessage: '');
      } else if (response.statusCode == 401) {
        await _logout();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: {},
            errorMessage: '');
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: {},
            errorMessage: '');
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMessage: e.toString(),
          responseData: {});
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint('URL => $url');
      Response response = await post(uri,
          headers: {
            'content-type': 'application/json',
            'token': AuthController.accessToken ?? ''
          },
          body: jsonEncode(body));
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse,
            errorMessage: '');
      } else if (response.statusCode == 401) {
        await _logout();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: {},
            errorMessage: '');
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: {},
            errorMessage: '');
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMessage: e.toString(),
          responseData: {});
    }
  }

  static Future<void> _logout() async {
    await AuthController.clearUserData();
    Navigator.pushNamedAndRemoveUntil(
        TaskManagerApp.navigatorKey.currentContext!,
        SignInScreen.name,
        (_) => false);
  }
}
