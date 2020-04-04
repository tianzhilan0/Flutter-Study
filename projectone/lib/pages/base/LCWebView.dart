import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LCWebView extends StatefulWidget {
  final Map<String, dynamic> arguments;

  LCWebView({Key key, this.arguments}) : super(key: key);

  @override
  _LCWebViewState createState() => _LCWebViewState();
}

class _LCWebViewState extends State<LCWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String _title;
  String _webURL;
  @override
  void initState() {
    super.initState();

    _title = widget.arguments["title"];
    _webURL = widget.arguments["webURL"];
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: WebView(
        initialUrl: _webURL,

        ///初始化url
        javascriptMode: JavascriptMode.unrestricted,

        ///JS执行模式
        onWebViewCreated: (WebViewController webViewController) {
          ///在WebView创建完成后调用，只会被调用一次
          _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>[
          ///JS和Flutter通信的Channel；
          _toasterJavascriptChannel(context),
        ].toSet(),
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;

          ///允许路由替换
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          ///页面加载完成回调
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                final String url = await controller.data.currentUrl();
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Favorited $url')),
                );
              },
              child: const Icon(Icons.favorite),
            );
          }
          return Container();
        });
  }
}
