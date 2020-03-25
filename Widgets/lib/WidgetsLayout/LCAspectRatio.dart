import 'package:flutter/material.dart';

class LCAspectRatio extends StatelessWidget {
  const LCAspectRatio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Aspectratio")),
        body: Column(children: [
          Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 4,
                child: Container(
                  color: Colors.red,
                ),
              )),
          Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 3,
                child: Container(
                  color: Colors.red,
                ),
              )),
          Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 2,
                child: Container(
                  color: Colors.red,
                ),
              )),
              Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.red,
                ),
              )),
              Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 0.5,
                child: Container(
                  color: Colors.red,
                ),
              ))
        ]),
      ),
    );
  }
}
