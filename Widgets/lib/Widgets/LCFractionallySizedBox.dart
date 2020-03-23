import 'package:flutter/material.dart';

class LCFractionallySizedBox extends StatelessWidget {
  const LCFractionallySizedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("FractionallySizedBox")),
        body: Container(
          color: Colors.blue,
          height: 150.0,
          width: 150.0,
          padding: const EdgeInsets.all(10.0),
          child: new FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: 1.5,
            heightFactor: 1.5,
            child: new Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}