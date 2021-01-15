import 'package:flutter_covid_app_lab_1/Data/rest_data.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';

abstract class LoginPageContract {
  Future<void> onLoginSuccess (User user);
  void onLoginError(Error error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = RestData();
  LoginPagePresenter(this._view);

  doLogin(String username, String password) {
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}
