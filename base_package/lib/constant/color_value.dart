//常用按键装饰
import 'package:flutter/material.dart';

///左到右渐变色,默认黄色
LinearGradient ltrGradient(
    {List<Color> colors = const [Color(0xFFFFF282), Color(0xFFFFF4C91D)]}) {
  return LinearGradient(
      colors: colors, begin: Alignment.centerLeft, end: Alignment.centerRight);
}

///从上到右下渐变色,默认黄色
LinearGradient ttbGradient(
    {List<Color> colors = const [Color(0xFFFFF282), Color(0xFFFFF4C91D)]}) {
  return LinearGradient(
      colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter);
}

class ZColors {
  ///页面背景色
  static Color backGroundColor = Color(0xFFFECECEC);

  ///导航颜色
  static Color navColor = Color(0xFFF9F9F9);

  static Color primaryColor = Color(0xFFCEA55F);

  static Color deepRedColor = Color(0xFFD71318);

  static Color redColor = Color(0xFFEB522C);
  static Color bllueColor = Color(0xFF167EFC);

  ///bar高亮
  static const Color tabColorH = Color(0xFFCEA55F);

  ///bar灰色
  static const Color tabColorN = Color(0xFF515151);

  ///常用的灰色字体666666
  static Color textGreyColor = Color(0xFF666666);

  ///常用的灰色字体888888

  static Color textGreyColor8 = Color(0xFF888888);

  ///常用的灰色字体999999

  static Color textGreyColor9 = Color(0xFF999999);

  ///常用的黑色字体333333
  static const Color textColor = Color(0xFF333333);

  ///分割线颜色
  static Color lineColor = Color(0xFFF2F2F2);

  ///输入框占位符字体颜色
  static Color placeColor = Color(0xFF9A9A9A);
}
