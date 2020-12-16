import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import 'common_widget.dart';

typedef TextDidChange = void Function(String);

typedef void SheetCallback(dynamic value);

///dilog提示框 以及sheet只包含一个按键的弹窗
class ZAlertDilog {
  ///IOS风格信息提示
  static Future<T> showInfoTip<T>(
      {@required BuildContext context,
      dynamic title,
      dynamic content,
      dynamic actionButton = '确定',
      VoidCallback callBack}) {
    return showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title == null ? null : (title is String ? Text(title) : title),
        content: content == null
            ? null
            : content is String ? Text(content) : content,
        actions: <Widget>[
          CupertinoDialogAction(
            child: actionButton is String ? Text(actionButton) : actionButton,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              if (callBack != null) {
                callBack();
              }
            },
          )
        ],
      ),
    );
  }

  static Future<T> showAlertDialog<T>({
    @required BuildContext context,
    var leftButton = '取消',
    var rightButton = '确定',
    var content,
    var title,
    bool isDestructiveAction = false,
    VoidCallback leftCall,
    VoidCallback rightCall,
    bool barrierDismissible = false,
    bool autoClose = true,
  }) {
    assert(title is String || title is Widget || title == null);
    assert(content is String || content is Widget || content == null);
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CupertinoAlertDialog(
              title: title == null
                  ? title
                  : (title is String) ? Text(title) : title,
              actions: <Widget>[
                CupertinoDialogAction(
                  child: leftButton is String ? Text(leftButton) : leftButton,
                  onPressed: () {
                    if (autoClose) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (leftCall != null) leftCall();
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  isDestructiveAction: isDestructiveAction,
                  child:
                      rightButton is String ? Text(rightButton) : rightButton,
                  onPressed: () {
                    if (autoClose) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (rightCall != null) {
                      rightCall();
                    }
                  },
                ),
              ],
              content: content == null
                  ? Container()
                  : (content is String)
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(content,
                              textAlign: TextAlign.center,
                              style: pingFangB(15, color: Colors.black)))
                      : content),
        );
      },
    );
  }

  /// IOS风格的sheet
  static Future<String> showSheetPopup(
      List<dynamic> values, BuildContext context,
      {String cancelText = '取消', SheetCallback callback}) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              child: Text(cancelText, style: TextStyle(fontSize: 17)),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
            actions: values.map((v) {
              String value = v is String ? v : v['value'];
              return CupertinoActionSheetAction(
                isDefaultAction: true,
                child: Text(value,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.normal,color: ZColors.textColor)),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  if (callback != null) callback(v);
                },
              );
            }).toList(),
          );
        });
  }

  ///IOS风格倒计时dialog
  static Future<T> showCountdownDialog<T>(
      {@required BuildContext context,
      String title,
      String message,
      String sendTitle = '请求验证码',
      String actionTitle = '确定',
      Color actionBackgroundColor = Colors.blue, //确定按键颜色
      Color codeButtonBackgroundColor = Colors.blue, //获取验证码按键颜色
      bool autoTouch = true, //创建时自定获取验证码
      VoidCallback sendCallBack, //点击获取验证码回调
      TextDidChange callBack,
      VoidCallback confirmCall,
      VoidCallback cancelCall}) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Column(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 40,
                  child: Card(
                    elevation: 0.0,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: TextField(
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(4, 6, 0, 6),
                                border: InputBorder.none,
                                hintText: '请输入验证码'),
                            onChanged: callBack,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: _GMCountDown(
                              sendCallBack: sendCallBack,
                              autoTouch: autoTouch,
                              buttonBackgroundColor: codeButtonBackgroundColor,
                              sendTitle: sendTitle),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('取消', style: TextStyle(color: Colors.black87)),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  cancelCall();
                },
              ),
              Container(
                color: actionBackgroundColor,
                child: CupertinoDialogAction(
                  child: Text('确定', style: TextStyle(color: Colors.white)),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    confirmCall();
                  },
                ),
              ),
            ],
          );
        });
  }
}

///----------------------------倒计时类---------------------///

class _GMCountDown extends StatefulWidget {
  final bool autoTouch; //是否弹出的时候自动触发
  final Color buttonBackgroundColor; //按键背景色
  final VoidCallback sendCallBack;
  final String sendTitle;

  _GMCountDown(
      {this.autoTouch = true,
      this.buttonBackgroundColor = Colors.blue,
      this.sendTitle = '请求验证码',
      this.sendCallBack});

  @override
  _GMCountDownState createState() => _GMCountDownState();
}

class _GMCountDownState extends State<_GMCountDown> {
  CountdownTimer _cdTimer;
  String sendTitle = '请求验证码';
  bool _canClick = true;

  @override
  void dispose() {
    super.dispose();
    if (_cdTimer != null) {
      _cdTimer.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.autoTouch) {
      autoGetVerifycodes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CommonWidget.textButton(sendTitle,
            enable: _canClick,
            textAlign: TextAlign.center,
            padding: EdgeInsets.zero,
            textStyle: TextStyle(
                color: _canClick ? widget.buttonBackgroundColor : Colors.grey,
                fontSize: _canClick ? 15 : 12), callBack: () {
      widget.sendCallBack();
      autoGetVerifycodes();
    }));
  }

  void autoGetVerifycodes() {
    if (_cdTimer != null) {
      _cdTimer.cancel();
    }
    _cdTimer = CountdownTimer(Duration(seconds: 60), Duration(seconds: 1))
      ..listen((countdown) {
        setState(() {
          if (countdown.remaining.inSeconds > 0) {
            _canClick = false;
            sendTitle = '重新发送(${countdown.remaining.inSeconds.toString()})';
          } else {
            _canClick = true;
            sendTitle = '重新发送';
          }
        });
      });
  }
}
