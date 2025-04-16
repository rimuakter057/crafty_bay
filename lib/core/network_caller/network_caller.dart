import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

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
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logger.i("Uri = $url");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
      return  NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false);
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),

      );
    }
  }

  Future<NetworkResponse> postRequest({required String url,required Map<String,dynamic>body})async{
    Uri uri = Uri.parse(url);
    var response = await http.post(uri,body: body);
   try{ if(response.statusCode==200){
     final decodedData = jsonDecode(response.body);
     return NetworkResponse(
       statusCode: response.statusCode,
       isSuccess: true,
       responseData: decodedData,
     );
   }else{
     return NetworkResponse(statusCode:response.statusCode ,
         isSuccess: false);
   }

   }
   catch(e){
     return NetworkResponse(
       statusCode: -1,
       isSuccess: false,
       errorMessage: e.toString(),
     );
   }
  }
}
