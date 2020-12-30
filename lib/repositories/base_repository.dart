import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterbloc/models/base_response.dart';

import '../resource.dart';

abstract class BaseRepository {

  static Resource<T> handleResponse<T>(Response response) {
     try {
       if (response.isSuccessful) {
         final baseResponse = response.baseResponse;
         if (baseResponse.success)
           return Resource.success(null, jsonDecode(response.data));
         else
           return Resource.error(baseResponse.message);
       } else {
         return Resource.error(response.errorMessage);
       }
     }catch(e) {
       return Resource.error(e.toString());
     }
  }

}


extension FutureCall on Future<Response> {
  Future<Resource<T>> safeApiCall<T>() async {
    try {
      final Response response = await this;
      return BaseRepository.handleResponse<T>(response);
    }catch(e) {
      print("Yaha aya $e");
      return Resource.error(e.toString());
    }
  }
}


extension Base on Response {

  bool get isSuccessful => statusCode == HttpStatus.ok;

  BaseResponse get baseResponse {
    try {
      return BaseResponse.fromJson(jsonDecode(data));
    }
    catch(e) {
      return BaseResponse.fromJson({
        "success": false,
        "message": e.message ?? "Something went wrong"
      });
    }
  }

  String get errorMessage {
    final Map<String,dynamic> resp = jsonDecode(data);
    return resp.containsKey("message") ? resp['message'] : "Something went wrong";
  }
}