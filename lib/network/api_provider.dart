import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_services.dart';


class ApiProvider implements ApiService {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "{PASTE_URL_BASE_URL}",
      headers: {
        "Roletype": 2,
        "Appversion": "1.0",
        "Ostype": Platform.isAndroid ? "Android" : "iOS"
      }
    )
  )..interceptors.add(
    PrettyDioLogger(
        requestBody: true, requestHeader: true, responseBody: true),
  );

  @override
  Future<Response> login(Map<String, dynamic> loginBody) async {
    return await _dio.post("login", data: loginBody);
  }

  @override
  Future<Response> signUp(Map<String, dynamic> signUpBody) async {
    return await _dio.post("signup", data: signUpBody);
  }

  @override
  Future<Response> verifyOtp(Map<String, dynamic> verifyOtpBody) async {
     return await _dio.post("verifyotp", data: verifyOtpBody);
  }

}