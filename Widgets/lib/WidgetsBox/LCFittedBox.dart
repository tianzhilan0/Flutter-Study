import 'package:flutter/material.dart';

class LCFittedBox extends StatelessWidget {
  const LCFittedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("FittedBox")),
        body: ListView(children: [
          FittedBox(
            fit: BoxFit.none,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
          FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              child: Text("FittedBox"),
            ),
          )
        ]),
      ),
    );
  }
}
