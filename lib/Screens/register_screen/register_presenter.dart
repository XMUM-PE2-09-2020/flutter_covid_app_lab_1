import 'package:flutter_covid_app_lab_1/Data/rest_data.dart';
import 'package:flutter_covid_app_lab_1/Models/user.dart';

abstract class RegisterPageContruct {
  void onRegisterSuccess(int res);
  void onRegisterError(Error error);
}

class RegisterPagePresenter {
  RegisterPageContruct _view;
  RestData api = new RestData();
  RegisterPagePresenter(this._view);

  doRegister(User user) {
    api
        .createUser(user)
        .then((res) => _view.onRegisterSuccess(res))
        .catchError((onError) => _view.onRegisterError(onError));
  }
}
