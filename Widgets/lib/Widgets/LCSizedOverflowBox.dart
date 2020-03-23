import 'package:flutter/material.dart';

class LCSizedOverflowBox extends StatelessWidget {
  const LCSizedOverflowBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("")),
        body: Container(
          color: Colors.green,
          alignment: Alignment.topRight,
          width: 200.0,
          height: 200.0,
          padding: EdgeInsets.all(5.0),
          child: SizedOverflowBox(
            size: Size(20.0, 300.0),
            child: Container(color: Colors.red, width: 200.0, height: 200.0),
          ),
        ),
      ),
    );
  }
}
