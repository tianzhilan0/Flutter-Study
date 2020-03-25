import 'package:flutter/material.dart';

class LCLimitedBox extends StatelessWidget {
  const LCLimitedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("LimitedBox")),
        body:  Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 100.0,
              height: 200.0,
            ),
            LimitedBox(
              maxWidth: 150.0,
              maxHeight: 200.0,
              child: Container(
                color: Colors.blue,
                width: 400.0,
                height: 400.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}