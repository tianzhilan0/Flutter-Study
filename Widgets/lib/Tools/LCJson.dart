import 'package:flutter/material.dart';

class LCJson extends StatefulWidget {
  LCJson({Key key}) : super(key: key);

  @override
  _LCJsonState createState() => _LCJsonState();
}

class _LCJsonState extends State<LCJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("JSON解析")),
        body: Container(width: double.maxFinite, child: Column(children: [
          RaisedButton(
            color: Colors.blueAccent,
            child: Text("手动解析"),
            onPressed: (){

            },
          )
        ])));
  }
}
