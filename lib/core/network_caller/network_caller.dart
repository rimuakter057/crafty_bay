import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../features/ui/data/auth/controller/auth_controller.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String? errorMessage;
  final Map<String, dynamic>? responseData;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.errorMessage,
    this.responseData,
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> getRequest({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url += '?';
      for (String key in queryParams?.keys ?? {}) {
        url += '$key=${queryParams?[key]}&';
      }

      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'token': getx.Get.find<AuthController>().token ?? '',
      };

      ///log request
      _logRequest(url, headers);

      debugPrint("Uri =============== $url");

      Response response = await get(uri, headers: headers);

      ///log response
      _logResponse(url, response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': getx.Get.find<AuthController>().token ?? '',
      };
      _logRequest(url, headers);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);
      final decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedResponse['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedResponse['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': getx.Get.find<AuthController>().token ?? '',
      };
      _logRequest(url, body);

      Response response = await patch(uri, headers: headers, body: body);
      _logResponse(url, response);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': getx.Get.find<AuthController>().token ?? '',
      };
      _logRequest(url, headers);
      Response response;
      if (body != null && body.isNotEmpty) {
        response = await delete(uri, headers: headers, body: jsonEncode(body));
      } else {
        response = await delete(uri, headers: headers);
      }
      _logResponse(url, response);

      // Process the response and return a NetworkResponse
      return NetworkResponse(
        isSuccess: response.statusCode == 200,
        statusCode: response.statusCode,
        responseData: jsonDecode(response.body),
      );
    } catch (e) {
      // Handle exceptions and return a NetworkResponse
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      "URL => $url\nStatus Code: ${response.statusCode}\nHeaders: ${response.headers}\nBody: ${response.body}",
    );
  }

  Future<void> _clearUserData() async {
    await getx.Get.find<AuthController>().clearUserData();
  }

  void _logRequest(
    String url,
    Map<String, dynamic> headers, {
    Map<String, dynamic>? requestBody,
  }) {
    _logger.i("URL => $url\nHeaders: $headers\nBody: $requestBody");
  }
}
