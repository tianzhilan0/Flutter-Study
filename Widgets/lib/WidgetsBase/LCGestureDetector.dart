import 'package:flutter/material.dart';

class LCGestureDetector extends StatefulWidget {
  LCGestureDetector({Key key}) : super(key: key);

  @override
  _LCGestureDetectorState createState() => _LCGestureDetectorState();
}

class _LCGestureDetectorState extends State<LCGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector"),
      ),
      body: ListView(children: [
        new GestureDetector(
          child: new Text(
            "我被赋予了点击触摸能力...",
            style: new TextStyle(fontSize: 20.0),
          ),
          onTap: () {
            print("------onTap");
          },
          onDoubleTap: () {
            print("------onDoubleTap");
          },
          onLongPress: () {
            print("-----onLongPress");
          },
          onVerticalDragStart: (details) {
            print("在垂直方向开始位置:" + details.globalPosition.toString());
          },
          onVerticalDragEnd: (details) {
            print("在垂直方向结束位置:" + details.primaryVelocity.toString());
          },
        )
      ]),
    ));
  }
}

// Tap：

// onTapDown: (details) {},
// onTapUp: (details) {},
// onTap: () {},
// onTapCancel: () {},
// 双击：

// onDoubleTap: () {},
// 长按：

// onLongPress: () {},
// onLongPressStart: () {},
// onLongPressMoveUpdate: () {},
// onLongPressUp: () {},
// onLongPressEnd: () {},
// 垂直滑动：

// onVerticalDragDown: (details) {},
// onVerticalDragStart: (details) {},
// onVerticalDragUpdate: (details) {},
// onVerticalDragEnd: (details) {},
// onVerticalDragCancel: () {},
// 水平滑动：

// onHorizontalDragDown: (details) {},
// onHorizontalDragStart: (details) {},
// onHorizontalDragUpdate: (details) {},
// onHorizontalDragEnd: (details) {},
// onHorizontalDragCancel: () {},
// Pan事件：

// 指针已接触屏幕并可能开始移动。
// onPanDown: (details) {},
// 指针已经接触屏幕并开始移动。
// onPanStart: (details) {},
// 与屏幕接触并移动的指针再次移动。
// onPanUpdate: (details) {},
// 先前与屏幕接触并移动的指针不再与屏幕接触，并且当它停止接触屏幕时以特定速度移动。
// onPanEnd: (details) {},
// 先前触发 onPanDown 的指针未完成。
// onPanCancel: () {},
// Scale事件：

// onScaleStart: (details) {},
// onScaleUpdate: (details) {},
// onScaleEnd: (details) {},

/**
    GestureDetector({
    Key key,
    this.child,
    this.onTapDown,//可能导致点击的指针已联系到屏幕的特定位置
    this.onTapUp,//触发点的指针已停止在特定位置与屏幕联系
    this.onTap,//发生了点击。
    this.onTapCancel,//触发onTapDown的指针取消触发
    this.onDoubleTap,//双击
    this.onLongPress,//长按
    this.onLongPressUp,//长按结束
    this.onVerticalDragDown,//
    this.onVerticalDragStart,//指针已经接触到屏幕，而且可能开始垂直移动。
    this.onVerticalDragUpdate,//与屏幕接触并垂直移动的指针沿垂直方向移动
    this.onVerticalDragEnd,//以前与屏幕接触并垂直移动的指针不再与屏幕接触，并且当其停止接触屏幕时以特定速度移动。
    this.onVerticalDragCancel,//
    this.onHorizontalDragDown,//
    this.onHorizontalDragStart,//
    this.onHorizontalDragUpdate,//
    this.onHorizontalDragEnd,//
    this.onHorizontalDragCancel,//

//    onPan可以取代onVerticalDrag或者onHorizontalDrag，三者不能并存
    this.onPanDown,//指针已经接触屏幕并开始移动
    this.onPanStart,//与屏幕接触并移动的指针再次移动
    this.onPanUpdate,//先前与屏幕接触并移动的指针不再与屏幕接触，并且当它停止接触屏幕时以特定速度移动
    this.onPanEnd,//先前触发 onPanDown 的指针未完成
    this.onPanCancel,//

//    onScale可以取代onVerticalDrag或者onHorizontalDrag，三者不能并存，不能与onPan并存
    this.onScaleStart,//
    this.onScaleUpdate,//
    this.onScaleEnd,//
    this.behavior,
    this.excludeFromSemantics = false
    })
 */
