import 'package:flutter_covid_app_lab_1/Data/rest_data.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';

abstract class RegisterPageContruct {
  Future<void> onRegisterSuccess(bool res);
  void onRegisterError(Error error);
}

class RegisterPagePresenter {
  RegisterPageContruct _view;
  RestData api = RestData();
  RegisterPagePresenter(this._view);

  doRegister(User user) {
    api
        .createUser(user)
        .then((res) => _view.onRegisterSuccess(res))
        .catchError((onError) => _view.onRegisterError(onError));
  }
}
