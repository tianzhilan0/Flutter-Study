import 'package:flutter/material.dart';

class LCDecoratedBox extends StatelessWidget {
  const LCDecoratedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("DecoratedBox")),
          body: Column(children: [
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.red]), //背景渐变
                    borderRadius: BorderRadius.circular(10.0), //3像素圆角
                    boxShadow: [
                      //阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text(
                    "拍照",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ])),
    );
  }
}

// BoxDecoration({
//   Color color, //颜色
//   DecorationImage image,//图片
//   BoxBorder border, //边框
//   BorderRadiusGeometry borderRadius, //圆角
//   List<BoxShadow> boxShadow, //阴影,可以指定多个
//   Gradient gradient, //渐变
//   BlendMode backgroundBlendMode, //背景混合模式
//   BoxShape shape = BoxShape.rectangle, //形状
// })
