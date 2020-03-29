import 'package:flutter/material.dart';

class LCCheckBox extends StatefulWidget {
  @override
  _LCCheckBoxState createState() => _LCCheckBoxState();
}

class _LCCheckBoxState extends State<LCCheckBox> {
  bool _checkboxSelected = true; //CheckBox 状态
  String showText = ""; //显示的内容
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CheckBox"),
        ),
        body: Column(children: [
          Text(showText),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red, //选中时的颜色
            onChanged: (value) {
              _checkboxSelected = value;
              if (value) {
                showText = "选中";
              } else {
                showText = "取消选择";
              }
              setState(() {});
            },
          ),
          CheckboxListTile(
              secondary: const Icon(Icons.shutter_speed),
              title: const Text('硬件加速'),
              value: check,
              onChanged: (bool value) {
                setState(() {
                  check = !check;
                });
              }),
          CheckboxListTile(
            value: check,
            onChanged: (isCheck) {
              setState(() {
                check = !check;
              });
            },
            activeColor: Colors.red,
            title: Text('这是title'),
            subtitle: Text('这是描述'),
            //是否要撑满3行
            isThreeLine: false,
            //是否密集
            dense: false,
            secondary: CircleAvatar(
              child: Icon(Icons.android),
            ),
            selected: true,
            //选择控件放的位置
            controlAffinity: ListTileControlAffinity.platform,
          ),
          
        ]),
      ),
    );
  }
}
