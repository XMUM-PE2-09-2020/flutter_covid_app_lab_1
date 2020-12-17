import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:base_package/constant/textstyle.dart';
// import 'package:base_package/uikit/common_widget.dart';
// import 'package:base_package/utils/utils.dart';
import 'dart:math' as math show sin, pi;

enum LoadingType { tip, loading }

//网络提示控件
class HXLoading {
  factory HXLoading() => _instance;

  static final HXLoading _instance = HXLoading._singleton();
  HXLoading._singleton();

  // static OverlayState get overlayState =>
  //     Utils.navigatorKey.currentState.overlay;

  static OverlayEntryOb _overlayOb;

  Timer _timerDiss;

  Timer _timerShow;

  dismiss() async {
    if (_overlayOb == null) {
      return;
    }
    if (_overlayOb.state != OverlayEntryState.display) {
      _overlayOb.state = OverlayEntryState.none;
      return;
    }
    _overlayOb.state = OverlayEntryState.none;
    _overlayOb.entry?.remove();
    _overlayOb.entry = null;
  }

  void show<T>({String msg, LoadingType type = LoadingType.tip}) {
    showInfo(text: msg, type: type);
  }

  void showErrorInfo<T>({
    String text,
    double duration = 1.5,
  }) {
    showInfo(
        text: text,
        textColor: Color(0xFFFF2727),
        duration: duration,
        image: Image.asset(
          'lib/asset/images/error_tip.png',
          scale: 3,
        ));
  }

  void showInfo<T>(
      {LoadingType type = LoadingType.tip,
      Color barrierColor = const Color(0x000001),
      String text,
      Color textColor,
      double duration = 1.5,
      Image image}) {
    dismiss();
    _overlayOb = OverlayEntryOb(
        entry: OverlayEntry(
      builder: (BuildContext context) =>
          _buildChild(text, image, textColor, type),
    ));
    if (type == LoadingType.tip) {
      _overlayOb.state = OverlayEntryState.display;
      // overlayState.insert(_overlayOb.entry);
      autoDissmiss(duration);
    } else {
      //当类型为LoadingType.loading，优雅展示，网络加载控件低于110ms不展示控件
      elegantDisplay();
    }
  }

  void elegantDisplay() {
    if (_timerShow?.isActive == true) {
      _timerShow.cancel();
    }
    _overlayOb.state = OverlayEntryState.queuing;
    final dura = Duration(milliseconds: 100);
    _timerShow = Timer(dura, () {
      if (_overlayOb.state == OverlayEntryState.queuing) {
        _overlayOb.state = OverlayEntryState.display;
        // overlayState.insert(_overlayOb.entry);
      }
    });
  }

  Widget _buildChild(String text, Image image, Color color, LoadingType type) {
    Widget _child = Container();
    if (type == LoadingType.loading) {
      return Center(child: _loadingGif(text));
    } else {
      if (text == null && image == null) {
        _child = _cupertinoActivity();
      }

      if (text != null && image == null) {
        _child = _indicatorText(text, color);
      }

      if (text != null && image != null) {
        _child = _indicatorTextAndImage(text, image, color);
      }
    }
    return Center(
        child: Material(
      elevation: 1,
      color: Color(0xFF474F62),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: _child,
    ));
  }

  Widget _cupertinoActivity() {
    return Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(14),
        width: 70,
        height: 70,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ));
  }

  Widget _loadingGif(String msg) {
    return Container(
      width: 104,
      height: 88,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFBFBFB),
          boxShadow: [
            BoxShadow(
                offset: Offset.zero,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.16))
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
            SizedBox(
              height: 12,
            ),
            Text(
              msg ?? '数据加载中...',
              // style: pingFangM(12, color: Color(0xFF666666)),
            )
          ]),
    );
  }

  Widget _indicatorTextAndImage(String text, Image image, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.transparent,
            width: 35,
            height: 35,
            child: image),
        Container(
          margin: EdgeInsets.fromLTRB(28, 0, 28, 13),
          child: Text(
            text,
            textAlign: TextAlign.center,
            // style: pingFangM(13, color: color ?? Colors.white),
          ),
        )
      ],
    );
  }

  Widget _indicatorText(String text, Color color) {
    return Container(
        margin: EdgeInsets.fromLTRB(28, 5, 28, 5),
        child: Text(
          text,
          textAlign: TextAlign.center,
          // style: pingFangM(13, color: color ?? Colors.white),
        ));
  }

  ///单位为秒
  void autoDissmiss(double duration) {
    if (_timerDiss?.isActive == true) {
      _timerDiss.cancel();
    }
    int intValue = (duration * 1000).round();
    final dura = Duration(milliseconds: intValue);
    _timerDiss = Timer(dura, () {
      dismiss();
    });
  }

  static Widget loadingIndicator() {
    return _instance._cupertinoActivity();
  }
}

enum OverlayEntryState {
  //初始状态
  none,
  //队列中
  queuing,
  //展示
  display,
}

class OverlayEntryOb {
  OverlayEntry entry;
  OverlayEntryState state;
  OverlayEntryOb({this.entry, this.state = OverlayEntryState.none});
}
