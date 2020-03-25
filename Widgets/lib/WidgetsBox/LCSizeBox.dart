import 'package:flutter/material.dart';

class LCSizeBox extends StatefulWidget {
  LCSizeBox({Key key}) : super(key: key);

  @override
  _LCSizeBoxState createState() => _LCSizeBoxState();
}

class _LCSizeBoxState extends State<LCSizeBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("SizedBox")),
          body: Column(
            children:[
              SizedBox(
                width: 200,
                height: 200,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("SizedBox"),onPressed: (){}),
              )
            ]
          ),
    ));
  }
}