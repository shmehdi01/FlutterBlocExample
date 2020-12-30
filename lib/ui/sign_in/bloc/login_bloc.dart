import 'package:flutterbloc/models/user.dart';
import 'package:flutterbloc/repositories/login_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base_bloc.dart';
import '../../../resource.dart';

class LoginBloc extends BaseBloc {

  final LoginRepository _loginRepository;
  final _userStream = PublishSubject<User>();

  LoginBloc(this._loginRepository);

  void login(String username, String password) async {

   notifyLoading(true);

    final resource = await _loginRepository.login(
      {
        "user_cred": username,
        "password": password,
        "longitude":"123333",
        "latitude":"12345678"
      },
    );

    notifyLoading(false);

    if(resource.status == Status.SUCCESS) {
       _userStream.sink.add(resource.data.user);
    }
    else {
      notifyError(resource.errorMessage);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userStream.close();
  }

  Stream<User> get userStream => _userStream.stream;
}
