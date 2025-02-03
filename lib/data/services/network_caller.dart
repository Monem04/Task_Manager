import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
    required this.errorMessage,
  });
}

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, Map<String, dynamic>? params})
  async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint('URL => $url');
      Response response = await get(uri);
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse,
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
      {required String url, Map<String, dynamic>? body})
  async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint('URL => $url');
      Response response = await post(uri,
          headers: {
        'content-type' : 'application/json'
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
}
