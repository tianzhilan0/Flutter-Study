import 'package:flutter/material.dart';

class LCChip extends StatefulWidget {
  LCChip({Key key}) : super(key: key);

  @override
  _LCChipState createState() => _LCChipState();
}

class _LCChipState extends State<LCChip> {

  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
      ),
      body: ListView(
        children:[
          Chip(
          label: Text("flyou"),
        ),
        Chip(
                avatar: Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                ),
                label: Text("带avatar的chip"),
                labelStyle: TextStyle(color: Colors.black54),
                backgroundColor: Colors.orange,
              ),Chip(
          label: Text("flyou"),
          avatar: Icon(Icons.add_location, color: Colors.lightBlue),
          onDeleted: (){
            print("onDeleted");
          }
        ),
        Chip(
          label: Text("flyou"),
          avatar: Icon(Icons.add_location, color: Colors.lightBlue),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          onDeleted: (){
            print("onDeleted");
          }
        ),
        Chip(
                label: Text("圆角矩形的chip"),
                deleteIcon: Icon(Icons.close),
                deleteIconColor: Colors.black54,
                onDeleted: () {
                  print("点击了删除噢");
                },
                deleteButtonTooltipMessage: "弹出提示",
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                labelStyle: TextStyle(color: Colors.black54),
                backgroundColor: Colors.orange,
              ),
        Chip(
                label: Text("尺寸最小的chip"),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                labelStyle: TextStyle(color: Colors.black54),
                backgroundColor: Colors.orange,
              ),
              Chip(
                label: Text("带阴影的chip"),
                shadowColor: Colors.grey,
                elevation: 10.0,
                labelStyle: TextStyle(color: Colors.black54),
                backgroundColor: Colors.orange,
              ),
              ActionChip(
                //自带一个onPress事件，有点击效果
                label: Text("ActionChip"),
                backgroundColor: Colors.orange,
                onPressed: () {
                  print("ActionChip");
                },
              ),
              FilterChip(
          avatar: CircleAvatar(child: Text("F")),
          label: Text("FilterChip"),
          selected: selected,
          onSelected: (bool value) {
            setState(() {
              selected = !selected;
            });
          },
        ),
        ]
      ),
    ));
  }
}

// Chip({
//     Key key,
//     this.avatar,//标签左侧Widget，一般为小图标
//     @required this.label,//标签
//     this.labelStyle,
//     this.labelPadding,//padding
//     this.deleteIcon//删除图标,
//     this.onDeleted//删除回调，为空时不显示删除图标,
//     this.deleteIconColor//删除图标的颜色,
//     this.deleteButtonTooltipMessage//删除按钮的tip文字,
//     this.shape//形状,
//     this.clipBehavior = Clip.none,
//     this.backgroundColor//背景颜色,
//     this.padding,
//     this.materialTapTargetSize//删除图标material点击区域大小,
//   })