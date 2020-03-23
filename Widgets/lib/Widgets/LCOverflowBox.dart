import 'package:flutter/material.dart';

class LCOverflowBox extends StatelessWidget {
  const LCOverflowBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("OverflowBox")),
          body: Container(
            color: Colors.green,
            width: 200.0,
            height: 200.0,
            padding: const EdgeInsets.all(5.0),
            child: OverflowBox(
              alignment: Alignment.topLeft,
              maxWidth: 500.0,
              maxHeight: 500.0,
              minWidth: 250.0,
              minHeight: 250.0,
              child: Container(
                color: Color(0x33FF00FF),
                width: 500.0,
                height: 500.0,
              ),
            ),
          )),
    );
  }
}
