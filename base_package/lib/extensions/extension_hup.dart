import 'package:flustars/flustars.dart';

extension FormatterString on String {
  bool verifyPhone() {
    String phone =
        '^(13[0-9]|14[579]|15[0-3,5-9]|166|17[0135678]|18[0-9]|19[0-3,5-9])\\d{8}\$';
    bool result = RegExp(phone).hasMatch(this);
    return result;
  }

  ///替换号码为*,replaceRange该函数为前闭后开区间
  String replaceChart({String chart = '****', int start = 3, int end = 7}) {
    if (length < 7 || start > end) {
      return this;
    }
    return this.replaceRange(start, end, chart);
  }

  bool containsChinese() {
    String match = "[\u4E00-\u9FA5]";
    return RegExp(match).hasMatch(this);
  }

  bool isChinese() {
    String match = "^[\u4E00-\u9FA5]+\$";
    return RegExp(match).hasMatch(this);
  }

  bool containsDigital() {
    String match = "[0-9]";
    return RegExp(match).hasMatch(this);
  }

  bool containsLetter() {
    String match = "[a-z]";
    return RegExp(match, caseSensitive: false).hasMatch(this);
  }

  ///密码8-25位
  bool fitPassworLength() {
    return this.length >= 8 && this.length <= 25;
  }

  ///是否有效密码
  bool validPassword() {
    return fitPassworLength() && containsLetter() && containsDigital();
  }
}

extension Screen on num {
  num get sp => ScreenUtil.getInstance().getSp(this.toDouble());
  double get w => ScreenUtil.getInstance().getWidth(this.toDouble());
  double get h => ScreenUtil.getInstance().getHeight(this.toDouble());
}
