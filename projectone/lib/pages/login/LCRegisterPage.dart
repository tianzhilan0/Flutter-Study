import 'package:flutter/material.dart';
class LCRegisterPage extends StatefulWidget {
  final Map<String, dynamic> arguments;
  LCRegisterPage({Key key, this.arguments}) : super(key: key);

  @override
  _LCRegisterPageState createState() => _LCRegisterPageState();
}

class _LCRegisterPageState extends State<LCRegisterPage> {

String _iphone;
  @override
  void initState() {
    super.initState();
    _iphone = widget.arguments["iphone"];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("注册")),
      body: ListView(
        children: <Widget>[
          Text("手机号：$_iphone"),
        ],
      ),
    );
  }
}