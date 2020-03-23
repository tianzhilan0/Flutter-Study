import 'package:flutter/material.dart';

class LCCheckBox extends StatefulWidget {
  @override
  _LCCheckBoxState createState() => _LCCheckBoxState();
}

class _LCCheckBoxState extends State<LCCheckBox> {
  bool _checkboxSelected = true; //CheckBox 状态
  String showText = ""; //显示的内容

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
          )
        ]),
      ),
    );
  }
}
