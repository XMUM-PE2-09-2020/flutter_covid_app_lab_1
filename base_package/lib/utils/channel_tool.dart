import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_package/utils/common.dart';

class ChannelTools {
  ///一般用的通道
  static const MethodChannel common = MethodChannel(
    'franchise/common',
  );

  static const MethodChannel global = MethodChannel(
    'franchise/global',
  );

  static Future<T> invokeMethod<T>(String method,
      {MethodChannel channel = common, dynamic arguments}) async {
    try {
      return await channel.invokeMethod(method, arguments);
    } catch (e) {
      logger.d(e.toString());
      return null;
    }
  }

  static void setMethodCallHandler<T>(
      Future<dynamic> Function(MethodCall) handler,
      {MethodChannel channel = common}) {
    channel.setMethodCallHandler(handler);
  }
}
