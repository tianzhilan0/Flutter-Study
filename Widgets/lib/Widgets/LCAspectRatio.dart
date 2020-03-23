import 'package:flutter/material.dart';

class LCAspectRatio extends StatelessWidget {
  const LCAspectRatio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Aspectratio")),
        body: Container(
        height: 100.0,
        child: new AspectRatio(
          aspectRatio: 3,
          child: new Container(
            color: Colors.red,
          ),
        ),
      ),
      ),
    );
  }
}