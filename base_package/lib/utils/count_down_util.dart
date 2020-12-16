import 'dart:async';

class CountDownUtil{
  String getVerifyStr(){
    return _verifyStr;
  }
  String _verifyStr = "获取短信验证码";
  /// 倒计时的计时器。
  Timer _timer;
  /// 当前倒计时的秒数。
  int _seconds = 60;
  CountDownUtil._();

  static CountDownUtil _instance;

  static CountDownUtil getInstance() {
    if (_instance == null) {
      _instance = CountDownUtil._();
    }
    return _instance;
  }

  /// 启动倒计时的计时器。
  void startTimer(CountDownCallback callback, NetRequestCallback netRequestCallback) {
    if(_seconds != 60){
      return;
    }
    netRequestCallback();
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
      if (_seconds == 0) {
        cancelTimer();
        _seconds = 60;
        return;
      }
      _seconds--;
      _verifyStr = '已发送$_seconds'+'s';
      if (_seconds == 0) {
         _verifyStr = '重新发送';
      }
      callback(_verifyStr);
    });
  }

  /// 取消倒计时的计时器。
  void cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }


}

typedef CountDownCallback = void Function(String text);
typedef NetRequestCallback = void Function();