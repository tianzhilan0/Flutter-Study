import 'package:flutter/material.dart';

class LCProgress extends StatefulWidget {
  LCProgress({Key key}) : super(key: key);

  @override
  _LCProgressState createState() => _LCProgressState();
}

class _LCProgressState extends State<LCProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Progress")),
          body: Column(children: [
            //LinearProgressIndicator不具备设置高度的选项，可以使用SizedBox来设置高度与宽度
            LinearProgressIndicator(
              backgroundColor: Colors.blue,
              // value: 0.2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            CircularProgressIndicator(
              strokeWidth: 4.0,
              backgroundColor: Colors.grey,
              // value: 0.2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            CircularProgressIndicator(
              strokeWidth: 6.0,
              // backgroundColor: Colors.,
              // value: 0.2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            LinearProgressIndicator(
                //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
                value: 0.3,
                //背景颜色
                backgroundColor: Colors.yellow,
                //进度颜色
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
            CircularProgressIndicator(
                //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
                value: 0.3,
                //背景颜色
                backgroundColor: Colors.yellow,
                //进度颜色
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
          ])),
    );
  }
}
