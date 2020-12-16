//常用字体
import 'package:flutter/material.dart';
import 'package:base_package/extensions/extension_hup.dart';
import 'color_value.dart';

TextStyle pingFangM(double fontSize,
        {TextBaseline textBaseline, Color color}) =>
    TextStyle(
        color: color ?? ZColors.textColor,
        fontSize: fontSize.sp,
        fontFamily: 'PingFangMedium',
        textBaseline: textBaseline,
        decoration: TextDecoration.none);

TextStyle pingFang(double fontSize, {TextBaseline textBaseline, Color color}) =>
    TextStyle(
        color: color ?? ZColors.textColor,
        fontSize: fontSize.sp,
        fontFamily: 'PingFang',
        textBaseline: textBaseline,
        decoration: TextDecoration.none);

TextStyle pingFangB(double fontSize,
        {Color color, TextBaseline textBaseline}) =>
    TextStyle(
        color: color ?? ZColors.textColor,
        fontSize: fontSize.sp,
        fontFamily: 'PingFangBold',
        textBaseline: textBaseline,
        decoration: TextDecoration.none);
