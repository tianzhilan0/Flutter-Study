import 'package:flutter/material.dart';

class LCContainer extends StatelessWidget {
  const LCContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Container")),
          body: ListView(children: [
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 50.0), //容器外补白
              constraints:
                  BoxConstraints.tightFor(width: 80.0, height: 80.0), //卡片大小
              decoration: BoxDecoration(
                  //背景装饰
                  gradient: RadialGradient(
                      //背景径向渐变
                      colors: [Colors.blue, Colors.red],
                      center: Alignment.topLeft,
                      radius: 2),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
              transform: Matrix4.rotationZ(0.5), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: Text(
                DateTime.now().toString(),
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            Container(
        color: Colors.blue,

        constraints: BoxConstraints(
            maxHeight: 300.0,
            maxWidth: 200.0,
            minWidth: 150.0,
            minHeight: 150.0),
        child: Container(
          alignment: Alignment.topLeft,
          color: Colors.brown,
        ),
      ),
          ])),
    );
  }
}

// Container({
//   this.alignment,
//   this.padding, //容器内补白，属于decoration的装饰范围
//   Color color, // 背景色
//   Decoration decoration, // 背景装饰
//   Decoration foregroundDecoration, //前景装饰
//   double width,//容器的宽度
//   double height, //容器的高度
//   BoxConstraints constraints, //容器大小的限制条件
//   this.margin,//容器外补白，不属于decoration的装饰范围
//   this.transform, //变换
//   this.child,
// })
