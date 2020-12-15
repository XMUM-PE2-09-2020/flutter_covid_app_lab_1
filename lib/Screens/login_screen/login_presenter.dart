import 'package:flutter_covid_app_lab_1/Data/rest_data.dart';
import 'package:flutter_covid_app_lab_1/Models/user.dart';
import 'package:sqflite/sqflite.dart';

abstract class LoginPageContract {
  void onLoginSuccess(User user);
  void onLoginError(Error error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

  doLogin(String phoneOrEmail, String password) {
    api
        .login(phoneOrEmail, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}
