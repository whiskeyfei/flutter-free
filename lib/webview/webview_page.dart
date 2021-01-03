import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String url;
  final String title;
  final bool isLocalUrl;
  WebViewController _webViewController;

  WebViewPage({this.url, this.isLocalUrl = false, this.title});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  JavascriptChannel jsBridge(BuildContext context) => JavascriptChannel(
      name: 'jsbridge', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async{
        debugPrint(message.message);
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://flutterchina.club/',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>[
          jsBridge(context)
        ].toSet(),
        onWebViewCreated: (controller) {
          widget._webViewController = controller;
          controller.loadUrl(widget.url);
          controller.canGoBack().then((value) => debugPrint(value.toString()));
          controller.canGoForward().then((value) => debugPrint(value.toString()));
          controller.currentUrl().then((value) => debugPrint(value));
        },
        onPageFinished: (url) {
          widget._webViewController.evaluateJavascript('document.title')
              .then((title) => debugPrint(title));
        },
      ),
    );
  }
}
