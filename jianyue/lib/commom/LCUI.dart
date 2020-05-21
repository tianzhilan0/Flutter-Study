import 'package:flutter/material.dart';

class LCHorizontalLine extends StatelessWidget {
  final double height;
  final Color color;
  final double horizontal;

  LCHorizontalLine({
    this.height = 0.5,
    this.color = const Color(0xFFEEEEEE),
    this.horizontal = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height,
      color: color,
      margin: new EdgeInsets.symmetric(horizontal: horizontal),
    );
  }
}

class LCVerticalLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double vertical;

  LCVerticalLine({
    this.width = 1.0,
    this.height = 25,
    this.color = const Color.fromRGBO(209, 209, 209, 0.5),
    this.vertical = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      color: Color(0xffDCE0E5),
      margin: new EdgeInsets.symmetric(vertical: vertical),
      height: height,
    );
  }
}

class LCSpace extends StatelessWidget {
  final double width;
  final double height;

  LCSpace({this.width = 10.0, this.height = 10.0});

  @override
  Widget build(BuildContext context) {
    return new Container(width: width, height: height);
  }
}
