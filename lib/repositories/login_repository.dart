import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterbloc/network/api_services.dart';
import 'package:flutterbloc/network/responses/login_response.dart';

import '../repositories/base_repository.dart';
import '../resource.dart';

class LoginRepository extends BaseRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<Resource<LoginResponse>> login(Map<String, dynamic> loginBody) async {
    var resource = await _apiService.login(loginBody).safeApiCall<LoginResponse>();

    if (resource.status == Status.SUCCESS) {
      resource = Resource.success(
        LoginResponse.fromJson(resource.jsonString),
        resource.jsonString
      );
    }
    return resource;
  }
}
