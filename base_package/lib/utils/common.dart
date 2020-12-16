import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:base_package/views/login/login.dart';
// import 'package:base_package/views/main/main_page.dart';
import 'package:logger/logger.dart';
import 'package:toast/toast.dart';

get logger => Logger(
    output: ConsoleOutput(),
    filter: ProductionFilter(),
    printer: SimplePrinter(colors: false));

final routers = <String, WidgetBuilder>{
  // "/login": (context) => Login(),
  // "/main": (context) => MainPage(),
};

const Account_Key = 'account';

const Token_Key = 'token';

const Password_key = 'password';

///过期时间戳
const Expires_in = 'expires_in';

class CommonTool {
  static List<String> generateHours() {
    return List.generate(24, (index) => (index + 1).toString());
  }

  static List<String> generateMinutes() {
    return List.generate(60, (index) => (index + 1).toString());
  }

  static hxToast(BuildContext context, String msg,
      {Color textColor = Colors.red,
      Color backgroundColor = Colors.white,
      int duration,
      Color borderColor = Colors.grey}) {
    Toast.show(msg ?? '', context,
        gravity: 1,
        duration: duration,
        backgroundColor: backgroundColor,
        textColor: textColor,
        backgroundRadius: 10,
        border: Border.all(color: borderColor));
  }
}
