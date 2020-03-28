import 'package:flutter/material.dart';

class LCCamera extends StatefulWidget {
  LCCamera({Key key}) : super(key: key);

  @override
  _LCCameraState createState() => _LCCameraState();
}

class _LCCameraState extends State<LCCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: Container(),
    );
  }
}