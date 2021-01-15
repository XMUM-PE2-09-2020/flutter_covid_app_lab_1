import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  final String title;
  final bool hasAppBar;
  final Key key;
  WebViewContainer(this.url, {this.title = "", this.key, this.hasAppBar = true})
      : super(key: key);
  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  bool get hasAppBar => widget.hasAppBar;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController _webViewController;
  bool isLoading = true;
  Timer _timer;
  int progress = 0;
  String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // HXLoading().show(type: LoadingType.loading);
    });
  }

  void reloadWeb() {
    // HXLoading().show(type: LoadingType.loading);
    _webViewController?.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hasAppBar ? AppBar() : null,
        body: SafeArea(
            child: LayoutBuilder(builder: (ctx, size) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: WebView(
                        initialUrl: Uri.parse(widget.url).toString(),
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _webViewController = webViewController;
                          _controller.complete(webViewController);
                        },
                        navigationDelegate: (NavigationRequest request) {
                          // if (request?.url == 'railway://back') {
                          //   Navigator.of(context).pop();
                          //   return NavigationDecision.prevent;
                          // }
                          return NavigationDecision.navigate;
                        },
                        onPageFinished: (String url) {
                          // HXLoading().dismiss();
                          _webViewController
                              .evaluateJavascript("document.title")
                              .then((result) {
                            setState(() {
                              _title = result;
                            });
                          });
                        },
                        onWebResourceError: (erro) {
                          // HXLoading().dismiss();
                        },
                        gestureNavigationEnabled: true,
                      ),
                    ),
                  ),
                ],
              );
            }),
            top: true,
            bottom: true));
  }

  @override
  void dispose() {
    super.dispose();
    // HXLoading().dismiss();
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
