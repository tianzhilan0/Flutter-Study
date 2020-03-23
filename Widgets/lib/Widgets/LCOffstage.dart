import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LCOffstage extends StatefulWidget {
  LCOffstage({Key key}) : super(key: key);

  @override
  _LCOffstageState createState() => _LCOffstageState();
}

class _LCOffstageState extends State<LCOffstage> {
  
  bool offstage = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Offstage")),
        body: Column(
          children: <Widget>[
            Offstage(
              offstage: offstage,
              child: Container(color: Colors.blue, height: 100.0),
            ),
            CupertinoButton(
              child: Text("点击切换显示"),
              onPressed: () {
                setState(() {
                  offstage = !offstage;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
