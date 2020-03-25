import 'package:flutter/material.dart';

class LCFlow extends StatefulWidget {
  LCFlow({Key key}) : super(key: key);

  @override
  _LCFlowState createState() => _LCFlowState();
}

class _LCFlowState extends State<LCFlow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Flow")),
          body: Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            Container(width: 30.0, height: 40.0, color: Color(0xffff0000),),
            Container(width: 50.0, height: 40.0, color: Color(0xff00ff00),),
            Container(width: 70.0, height: 40.0, color: Color(0xff0000ff),),
            Container(width: 50.0, height: 40.0, color: Color(0xffffff00),),
            Container(width: 50.0, height: 40.0, color: Color(0xffff0000),),
            Container(width: 80.0, height: 40.0, color: Color(0xffff00ff),),
            Container(width: 50.0, height: 40.0, color: Color(0xffff0000),),
            Container(width: 50.0, height: 40.0, color: Color(0xff0000ff),),
          ],
        ),
    ));
  }
}
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}