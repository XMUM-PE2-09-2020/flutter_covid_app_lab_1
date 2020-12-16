export 'package:base_package/extensions/extension_hup.dart';
import 'package:flutter/material.dart';
import 'package:base_package/uikit/animation_page_route.dart';
export 'package:base_package/extensions/extension_hup.dart';

typedef void CallBack(dynamic result);

//页面跳转
Future<T> Push<T extends Object>(BuildContext context, Widget widget) {
  Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (BuildContext context) => widget));
}

//页面跳转
Future<T> Present<T extends Object>(BuildContext context, Widget widget) {
  Navigator.of(context)
      .push(animationPageRoute(widget, type: AnimationType.FADE));
}

abstract class ZState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  MediaQueryData get media => MediaQuery.of(context);

  ///导航栏高度
  double get navBarH => media.padding.top + 44;

  /// tabbar高度,根据tabbar背景比列求得
  double get tabBarH => media.size.width / 4.87;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
