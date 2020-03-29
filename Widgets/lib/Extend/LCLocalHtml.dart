import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LCLocalHtml extends StatefulWidget {
  LCLocalHtml({Key key}) : super(key: key);

  @override
  _LCLocalHtmlState createState() => _LCLocalHtmlState();
}

class _LCLocalHtmlState extends State<LCLocalHtml> {
   WebViewController _webViewController;
 String filePath = 'assets/files/local.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地HTML"),
      ),
      body: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },
        ),
    );
  }

  _loadHtmlFromAssets() async {
  String fileHtmlContents = await rootBundle.loadString(filePath);
  _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    .toString());
 }
}
