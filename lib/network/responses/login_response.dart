
import 'package:flutterbloc/models/base_response.dart';
import 'package:flutterbloc/models/user.dart';

class LoginResponse extends BaseResponse {
    User user;

    LoginResponse(this.user);

    LoginResponse.fromJson(Map<String, dynamic> json) {
      final Map<String, dynamic> userMap = json['user'];
      this.user = User.fromJson(userMap);
    }
}