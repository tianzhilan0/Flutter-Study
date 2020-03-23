import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final List<Map> items = [
    //基础类 Widget
    {"title": "Text", "path": "/text"},
    {"title": "Button", "path": "/button"},
    {"title": "Image", "path": "/image"},
    {"title": "CheckBox", "path": "/checkbox"},
    {"title": "Switch", "path": "/switch"},
    
    //容器类 Widget
    {"title": "Padding", "path": "/padding"},
    {"title": "ConstrainedBox", "path": "/constrainedbox"},
    {"title": "DecoratedBox", "path": "/decoratedbox"},
    {"title": "Transform", "path": "/transform"},
    {"title": "RotatedBox", "path": "/rotatedbox"},
    {"title": "Container", "path": "/container"},
    
    //布局类 Widget
    {"title": "Row", "path": "/row"},
    {"title": "Column", "path": "/column"},
    {"title": "Flex", "path": "/flex"},
    {"title": "Wrap", "path": "/wrap"},
    {"title": "Stack", "path": "/stack"},
    {"title": "Align", "path": "/align"},
    {"title": "FittedBox", "path": "/fittedbox"},
    {"title": "AspectRatio", "path": "/aspectratio"},
    {"title": "Baseline", "path": "/baseline"},
    {"title": "FractionallySizedBox", "path": "/fractionallySizedBox"},
    {"title": "LimitedBox", "path": "/limitedBox"},
    {"title": "Offstage", "path": "/offstage"},
    {"title": "OverflowBox", "path": "/overflowBox"},
    {"title": "SizedOverflowBox", "path": "/sizedOverflowBox"},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 2.0, //显示区域宽高相等
              mainAxisSpacing: 10.0, //主轴间距
              crossAxisSpacing: 10.0, //横轴间距
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RaisedButton(
                color: Colors.orange,
                child: Text(
                  items[index]["title"],
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), //圆角//边框
                ),
                onPressed: () {
                  Navigator.pushNamed(context, items[index]["path"]);
                },
              );
            }));
  }
}
