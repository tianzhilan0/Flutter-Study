import 'package:flutter/material.dart';

class LCAlign extends StatelessWidget {
  const LCAlign({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Align")),
          body: Column(
            children:[
              Container(
              height: 100.0,
              color: Colors.orange,
              child: Align(
                alignment: Alignment.center,
                widthFactor: 20.0,
                heightFactor: 2.0,
                child: Text("Align"),
              )),
              Container(
              height: 100.0,
              color: Colors.blueAccent,
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: 20.0,
                heightFactor: 2.0,
                child: Text("Align"),
              )),
              Container(
              height: 100.0,
              color: Colors.red,
              child: Align(
                alignment: Alignment.bottomCenter,
                widthFactor: 20.0,
                heightFactor: 2.0,
                child: Text("Align"),
              ))


            ]
          )),
    );
  }
}
