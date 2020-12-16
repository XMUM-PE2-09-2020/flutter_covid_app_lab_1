import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_package/uikit/z_alter.dart';
import 'package:base_package/utils/common.dart';

///android连按两次退出widget
class ExitWidget extends StatefulWidget {
  final Widget child;
  ExitWidget({this.child}) : assert(child != null);
  @override
  _ExitWidgetState createState() => _ExitWidgetState();
}

class _ExitWidgetState extends State<ExitWidget> {
  DateTime _lastPressedAdt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: widget.child,
        onWillPop: () async {
          if (_lastPressedAdt == null ||
              DateTime.now().difference(_lastPressedAdt) >
                  Duration(milliseconds: 1500)) {
            //两次点击时间间隔超过1秒则重新计时
            // CommonTool.hxToast(context, '再按一次退出程序');
            _lastPressedAdt = DateTime.now();
            return false;
          }
          ZAlertDilog.showAlertDialog(
              context: context,
              content: '是否确认退出',
              rightCall: () {
                SystemNavigator.pop();
              });
          return false;
        });
  }
}
