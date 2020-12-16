import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef void Callback(CodeResult result);

class CodeWebview extends StatefulWidget {
  CodeWebview({this.callback});
  final Callback callback;
  @override
  _CodeWebviewState createState() => _CodeWebviewState();
}

class _CodeWebviewState extends State<CodeWebview>
    with SingleTickerProviderStateMixin {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Animation<double> animation;
  AnimationController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 1, end: 0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: <Widget>[
            Opacity(
              opacity: animation.value,
              child: _cupertinoActivity(),
            ),
            Opacity(
              opacity: (animation.value - 1).abs(),
              child: child,
            )
          ],
        ),
        child: ClipRect(
          clipBehavior: Clip.hardEdge,
          clipper: RectClip(),
          child: Container(
              height: 300,
              width: 300,
              child: WebView(
                initialUrl: 'https://www.haixingcloud.com:8000/app/captcha',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                javascriptChannels: <JavascriptChannel>[
                  _completeJavascriptChannel(),
                ].toSet(),
                navigationDelegate: (NavigationRequest request) {
                  return NavigationDecision.navigate;
                },
                onPageFinished: (String url) {
                  controller.forward();
                },
                onWebResourceError: (erro) {
                  if (widget.callback != null) {
                    widget.callback(null);
                  }
                },
                gestureNavigationEnabled: true,
              )),
        ),
      ),
    );
  }

  ///完成拼图
  JavascriptChannel _completeJavascriptChannel() {
    return JavascriptChannel(
        name: 'Code',
        onMessageReceived: (JavascriptMessage message) {
          Map<String, dynamic> result = json.decode(message.message);
          if (widget.callback != null) {
            widget.callback(CodeResult.fromJson(result));
          }
        });
  }

  Widget _cupertinoActivity() {
    return Material(
      elevation: 3,
      color: Color.fromRGBO(225, 225, 225, 0.2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(14),
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          )),
    );
  }
}

class RectClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width - 10,
        height: size.height - 10);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class CodeResult {
  int ret;
  String ticket;
  String appid;
  String randstr;
  CodeResult({this.ret, this.ticket, this.appid, this.randstr});

  factory CodeResult.fromJson(Map<String, dynamic> json) {
    return CodeResult()
      ..ret = json['ret']
      ..ticket = json['ticket']
      ..appid = json['appid']
      ..randstr = json['randstr'];
  }
  Map<String, dynamic> toJson() => {
        'ret': ret,
        'ticket': ticket,
        'appid': appid,
        'randstr': randstr,
      };
}
