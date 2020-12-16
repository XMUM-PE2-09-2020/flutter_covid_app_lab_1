import 'package:flutter/material.dart';

Widget line({Color color, double width, double height = 1.0}) {
  return Container(
      width: width,
      color: color ?? Color(0xFFFFFFFF).withOpacity(0.1),
      height: height);
}

///上边线 灰色 0.2
Border topBS({Color color, double width = 1.0}) {
  return Border(
      top: BorderSide(
          color: color ?? Color(0xFFFFFFFF).withOpacity(0.2), width: width));
}

///下边线 灰色 0.2
Border bottomBS({Color color, double width = 1}) {
  return Border(
      bottom: BorderSide(
          color: color ?? Color(0xFFFFFFFF).withOpacity(0.1), width: width));
}

///右边线 灰色 0.2
Border rightBS({Color color, double width = 1}) {
  return Border(
      right: BorderSide(
          color: color ?? Color(0xFFFFFFFF).withOpacity(0.1), width: width));
}

///上下边线 灰色 0.2
Border topAndBottomBS({Color color, double width = 1}) {
  return Border(
      top: BorderSide(color: color, width: width),
      bottom: BorderSide(
          color: color ?? Color(0xFFFFFFFF).withOpacity(0.1), width: width));
}
