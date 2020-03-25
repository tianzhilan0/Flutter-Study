import 'package:flutter/material.dart';

class LCChoiceChip extends StatefulWidget {
  LCChoiceChip({Key key}) : super(key: key);

  @override
  _LCChoiceChipState createState() => _LCChoiceChipState();
}

class _LCChoiceChipState extends State<LCChoiceChip> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("ChoiceChip"),
      ),
      body: ChoiceChip(
        //对应的图标
        avatar: CircleAvatar(child: Icon(Icons.android)),
        //对应的标签名称
        label: Text('label'),
        //对应的标签样式
        labelStyle: TextStyle(
          fontSize: 22,
        ),
        //图标和标签间距
        labelPadding: EdgeInsets.all(10),
        //是否选中监听事件
        onSelected: (isSelect) => {
          setState(() {
            check = !check;
          })
        },
        //按下阴影的宽度
        pressElevation: 0.5,
        //是否选中
        selected: check,
        //选中的背景颜色
        selectedColor: Colors.green,
        //禁用的背景颜色
        disabledColor: Colors.red,
        tooltip: 'tooltip',
        //背景框的形状
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        //图标或者文字超出ChoiceChip 范围的部分剪切方式，默认不剪切 Clip.none
        clipBehavior: Clip.none,
        //未选中的背景颜色
        backgroundColor: Colors.grey,
        //内容距离边框的间距
        padding: EdgeInsets.all(10.0),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        //阴影宽度
        elevation: 5.0,
        //阴影颜色
        shadowColor: Colors.yellow,
        //选中阴影颜色
        selectedShadowColor: Colors.blue,
        //图标的边框
        avatarBorder: const CircleBorder(),
      ),
    ));
  }
}
