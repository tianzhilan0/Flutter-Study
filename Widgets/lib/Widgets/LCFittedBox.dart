import 'package:flutter/material.dart';

class LCFittedBox extends StatelessWidget {
  const LCFittedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("FittedBox")),
        body: Container(
          color: Colors.amberAccent,
          width: 300.0,
          height: 300.0,
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
        ),
      ),
    );
  }
}
