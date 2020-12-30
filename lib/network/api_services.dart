import 'package:dio/dio.dart';

abstract class ApiService {
  ///
  /// [loginBody] should be map with the bottom key value pairs
  ///  e.g
  /// {
  /// "user_cred":"9793140941",
  /// "password":"123",
  /// "longitude":"123333",
  /// "latitude":"12345678"
  /// }
  ///
  Future<Response> login(Map<String, dynamic> loginBody);

  /// [signUpBody] should be map with the bottom key value pairs
  /// {
  ///   "name": "Santosh",
  ///   "email": "santosh.sharmar@adsandurl.com",
  ///   "phone_number": "9793140941",
  ///   "password": "123",
  ///   "firebase_token": "fn_2T88UQmS-zdmLC521Ku:APA91bEX1GV_BqdSazRsNNj9OC3yt5MK1n2z28R1PZ7jIKiHDsuAlgOj9dV9zv7ZZKAtkUSX6b2FiywB58bJWDeJ6Fzy8enoJJFkhNPkX40pS7e2V_NWpJqcPoa9HvUCuj4eIWI-ds7N",
  ///   "longitude": "77.24487304687501",
  ///   "latitude": "28.613459424004414"
  /// }
  Future<Response> signUp(Map<String, dynamic> signUpBody);

  /// [verifyOtpBody]
  /// {"user_otp_log_id":"1","phone_number":"9793140941","otp":"8473"}
  Future<Response> verifyOtp(Map<String, dynamic> verifyOtpBody);
}
