import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:litest/core/util/dummies.dart';
import 'package:litest/core/util/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConstants {
  static const String baseUrl = "https://dummy.url" ;
  static Map<String, String> baseHeader = {};
  static Future<Map<String, String>> headerWithToken() async {
    final token = await SharedPreferencesUtil.getString("token");
    return baseHeader..addAll({
      "token": token
    });
  }
}

class ApiReturnValue<T> {
  final T? response;
  final String message;
  final int statusCode;

  ApiReturnValue({required this.response, required this.message, required this.statusCode});
}

abstract class BaseApiService {
  Future<ApiReturnValue<Map<String, dynamic>>> get(String url, Map<String, String> headers);

  Future<ApiReturnValue<Map<String, dynamic>>> post(String url, Map<String, dynamic> body, Map<String, String> headers);

  Future<ApiReturnValue<Map<String, dynamic>>> put(String url, Map<String, dynamic> body, Map<String, String> headers);

  Future<ApiReturnValue<Map<String, dynamic>>> multipart(String url, Map<String, dynamic> body, Map<String, String> headers, List<File> file);
}

class ApiService extends BaseApiService{
  @override
  Future<ApiReturnValue<Map<String, dynamic>>> get(String url, Map<String, String> headers) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    return ApiReturnValue(response: jsonDecode(response.body) as Map<String, dynamic>, message: "", statusCode: response.statusCode);
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> post(String url, Map<String, dynamic> body, Map<String, String> headers) async {
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    return ApiReturnValue(response: jsonDecode(response.body) as Map<String, dynamic>, message: "", statusCode: response.statusCode);
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> put(String url, Map<String, dynamic> body, Map<String, String> headers) async {
    final response = await http.put(Uri.parse(url), headers: headers, body: body);
    return ApiReturnValue(response: jsonDecode(response.body) as Map<String, dynamic>, message: "", statusCode: response.statusCode);
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> multipart(String url, Map<String, dynamic> body, Map<String, String> headers, List<File> file) async {
    final request = http.MultipartRequest("POST", Uri.parse(url),);
    request.files.addAll(file.map((e) => http.MultipartFile('files', e.openRead(), e.lengthSync()),));
    body.forEach((key, value) {
      request.fields[key] = value;
    },);
    headers.forEach((key, value) {
      request.headers[key] = value;
    },);

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    return ApiReturnValue(response: jsonDecode(responseBody), message: "", statusCode: response.statusCode);
  }
}

class DummyApiService extends BaseApiService{
  @override
  Future<ApiReturnValue<Map<String, dynamic>>> get(String url, Map<String, String> headers) async {
    final path = url.split(ApiConstants.baseUrl);
    switch (path[1]) {
      case "/api/v1/products":
        return ApiReturnValue(response: Dummies.productsResponse, message: "", statusCode: 200);
      case "/api/v1/user":
        if (headers["token"] == Dummies.loginResponse["token"]){
          return ApiReturnValue(response: Dummies.userResponse, message: "", statusCode: 200);
        }
        return ApiReturnValue(response: null, message: "Not found", statusCode: 404); 
      default:
        return ApiReturnValue(response: null, message: "Not found", statusCode: 404); 
    }
    // return ApiReturnValue(response: jsonDecode(response.body), message: "", statusCode: response.statusCode);
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> post(String url, Map<String, dynamic> body, Map<String, String> headers) async {
    // sleep(Duration(seconds: 3));
    final path = url.split(ApiConstants.baseUrl);
    switch (path[1]) {
      case "/api/v1/login":
        if (body["user"] == Dummies.userResponse["email"] && body["password"] == Dummies.password){
          return ApiReturnValue(response: Dummies.loginResponse, message: "", statusCode: 200);
        }
        return ApiReturnValue(response: null, message: "Not found", statusCode: 404);
      case "/api/v1/order":
        return ApiReturnValue(response: {"success": true}, message: "", statusCode: 404);
      default:
        return ApiReturnValue(response: null, message: "Not found", statusCode: 404);
    }
  }
  
  @override
  Future<ApiReturnValue<Map<String, dynamic>>> multipart(String url, Map<String, dynamic> body, Map<String, String> headers, List<File> file) async {
    // sleep(Duration(seconds: 3));
    final path = url.split(ApiConstants.baseUrl);
    switch (path[1]) {
      default:
        return ApiReturnValue(response: null, message: "Not found", statusCode: 404);
    }
  }
  
  @override
  Future<ApiReturnValue<Map<String, dynamic>>> put(String url, Map<String, dynamic> body, Map<String, String> headers) async {
    final path = url.split(ApiConstants.baseUrl);
    switch (path[1]) {
      default:
        return ApiReturnValue(response: null, message: "Not found", statusCode: 404);
    }
  }

  // Future<ApiReturnValue<Map<String, dynamic>>> put(String url, Map<String, dynamic> body, Map<String, String> headers) async {
  //   final path = url.split(ApiConstants.baseUrl);
  //   switch (path[1]) {
  //     case "/api/v1/login":
  //       return ApiReturnValue(response: Dummies.loginResponse, message: "", statusCode: 200);
  //       break;
  //     default:
  //   }
  // }

  // Future<ApiReturnValue<Map<String, dynamic>>> multipart(String url, Map<String, dynamic> body, Map<String, String> headers, List<File> file) async {
  //   final request = http.MultipartRequest("POST", Uri.parse(url),);
  //   request.files.addAll(file.map((e) => http.MultipartFile('files', e.openRead(), e.lengthSync()),));
  //   body.forEach((key, value) {
  //     request.fields[key] = value;
  //   },);
  //   headers.forEach((key, value) {
  //     request.headers[key] = value;
  //   },);

  //   final response = await request.send();
  //   final responseBody = await response.stream.bytesToString();
  //   return ApiReturnValue(response: jsonDecode(responseBody), message: "", statusCode: response.statusCode);
  // }
}