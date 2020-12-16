import 'package:flutter/material.dart';
import 'package:base_package/uikit/loading_widget.dart';

typedef void Success(String message, dynamic data);

typedef void Failure(String code, String errorMsg);

class BaseVM extends ChangeNotifier {
  BuildContext context;
}

class RequestResult {
  RequestResult({@required Map result}) {
    _code = result['code']?.toString();
    _msg = result['message']?.toString();
    _data = result['result'];
    _result = result;
  }
  String _code;
  String _msg;
  dynamic _data;
  Map _result;
  Success success;
  Failure failure;

  void callBack(Success success, Failure failure) {
    if (_code == "0"
        // || _code == "200"
        ) {
      success(_msg, _data);
    } else {
      HXLoading().show(msg: _msg);
      failure(_code, _msg);
    }
  }

  void successCall(Success success) {
    if (_code == "0") {
      success(_msg, _data);
    }
  }

  Map getResult() {
    return _result;
  }
}
