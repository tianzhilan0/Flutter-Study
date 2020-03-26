import 'package:flutter/material.dart';

class LCSingleChildScrollView extends StatefulWidget {
  LCSingleChildScrollView({Key key}) : super(key: key);

  @override
  _LCSingleChildScrollViewState createState() =>
      _LCSingleChildScrollViewState();
}

class _LCSingleChildScrollViewState extends State<LCSingleChildScrollView> {
  String info = "这是一串用来测试的文本信息，用于后面进行字符串拆分！";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text("SingleChildScrollView")),
            body: 
            verticalAndhorizontal()
            // horizontal()
            // vertical()
            ));
  }

  Widget verticalAndhorizontal(){
    return Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Row(
                  //动态创建一个List<Widget>
                  children: info
                      .split("")
                      //每一个字母都用一个Text显示,字体为原来的两倍
                      .map((c) => Text(
                            c,
                            textScaleFactor: 2.0,
                          ))
                      .toList(),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    //动态创建一个List<Widget>
                    children: info
                        .split("")
                        //每一个字母都用一个Text显示,字体为原来的两倍
                        .map((c) => Text(
                              c,
                              textScaleFactor: 2.0,
                            ))
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        );
  }

  Widget vertical(){
    return SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: info
                        .split("")
                        .map((e) => Text(
                              e,
                              textScaleFactor: 5.0,
                            ))
                        .toList(),
                  ),
                ));
  }

  Widget horizontal() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: info
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 5.0,
                    ))
                .toList(),
          ),
        ));
  }
}

// const SingleChildScrollView({
//   Key key,
//   //滚动方向，默认是垂直方向
//   this.scrollDirection = Axis.vertical,
//   //是否按照阅读方向相反的方向滑动
//   this.reverse = false,
//   //内容边距
//   this.padding,
//   //是否使用widget树中默认的PrimaryScrollController
//   bool primary,
//   //此属性接受一个ScrollPhysics类型的对象，它决定可以滚动如何响应用户操作，比如用户滑动完抬起手指后，继续执行动画，或者滑动到边界时，如何显示。
//   //默认情况下，Flutter会根据具体平台分别使用不同的ScrollPhysics对象，对应不同的显示效果，如当滑动到边界时，继续拖动的话，在iOS上会出现弹性效果，
//   //而在Android上会出现微光效果。如果你想在所有平台下使用同一种效果，可以显示指定一个固定的ScrollPhysics。
//   //Flutter SDK包含两个ScrollPhysics的子类。1.ClampingScrollPhysics：Android下微光效果，2.BouncingScrollPhysics：iOS下弹性效果
//   this.physics,
//   //此属性接收一个ScrollController对象，ScrollController的主要作用是控制滚动位置和监听滚动事件。
//   //默认情况下，Widget树中会有一个默认的PrimaryScrollController，如果子树中的可滚动组件没有显示的指定controller，并且primary属性值为true时，可滚动组件会使用这个默认的ScrollController。
//   //这种机制带来的好处是父组件可以控制子树中可滚动的滚动行为，例：scaffold正是使用这种机制在iOS中实现了点击导航回到顶部的功能。
//   this.controller,
//   this.child,
// })
