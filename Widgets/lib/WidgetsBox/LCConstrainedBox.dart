import 'package:flutter/material.dart';

class LCConstrainedBox extends StatelessWidget {
  const LCConstrainedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("ConstrainedBox")),
          body: Column(children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 50, //最小宽度
                  minHeight: 50.0, //最小高度为50像素
                  maxWidth: 200.0,
                  maxHeight: 200.0,
                  ),
              child: Container(
                width: 1.0,
                height: 100.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            )
          ])),
    );
  }
}
