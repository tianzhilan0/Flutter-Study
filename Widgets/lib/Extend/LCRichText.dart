import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LCRichText extends StatefulWidget {
  LCRichText({Key key}) : super(key: key);

  @override
  _LCRichTextState createState() => _LCRichTextState();
}

class _LCRichTextState extends State<LCRichText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("富文本")),
      body: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: "登录代表同意",
                style: TextStyle(color: Colors.orange, fontSize: 15),
                children: [
                  TextSpan(
                      text: "《***用户协议》",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                      text: "和 ",
                      style: TextStyle(color: Colors.orange, fontSize: 15)),
                  TextSpan(
                      text: "《隐私政策》",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ]),
          )
        ],
      ),
    );
  }
}
