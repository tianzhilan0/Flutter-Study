import 'package:flutter/material.dart';
class LCForgotPasswordPage extends StatefulWidget {
  final Map<String, dynamic> arguments;
  LCForgotPasswordPage({Key key, this.arguments}) : super(key: key);

  @override
  _LCForgotPasswordPageState createState() => _LCForgotPasswordPageState();
}

class _LCForgotPasswordPageState extends State<LCForgotPasswordPage> {
  
  String _iphone;
  
  @override
  void initState() {
    super.initState();
    _iphone = widget.arguments["iphone"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("忘记密码")),
      body: ListView(
        children: <Widget>[
          Text("手机号：$_iphone"),
        ],
      ),
    );
  }
}