import 'package:flutter/material.dart';
import 'dart:math' as math;

class LCTransform extends StatelessWidget {
  const LCTransform({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Transform")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.translate(
              offset: Offset(100.0, 50.0),
              child: Text("Hello world"),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text("Hello world"),
              ),
            ),
            SizedBox(height: 50),
            DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(
                    scale: 1.5, //放大到1.5倍
                    child: Text("Hello world"))),
            SizedBox(height: 50),
            Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
