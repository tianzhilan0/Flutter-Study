import 'package:flutter/material.dart';

class LCCheckboxListTile extends StatefulWidget {
  LCCheckboxListTile({Key key}) : super(key: key);

  @override
  _LCCheckboxListTileState createState() => _LCCheckboxListTileState();
}

class _LCCheckboxListTileState extends State<LCCheckboxListTile> {

  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("Align")),
      body: ListView(children: [
        CheckboxListTile(
          value: _value,
          //默认文字是否高亮
          selected: true,
          onChanged: (value){
            setState(() {
              _value = value;
            });
          },
          dense: false,
          //文字是否对齐 图标高度
          isThreeLine: false,
          //文字是否三行显示
          title: Text('整个内容'),
          // 将控件放在何处相对于文本,leading 按钮显示在文字前面,platform,trailing 按钮显示在文字后面
          controlAffinity: ListTileControlAffinity.platform,
          subtitle: Text('勾选下列选项'),
          secondary: Icon(Icons.archive), //左侧小图标
          activeColor: Colors.red,
        ),
        CheckboxListTile(
            value: _value,
            onChanged: (value){
              setState(() {
              _value = value;
              });
            },
            title: Text('选项1'),
            controlAffinity: ListTileControlAffinity.platform,
            activeColor: _value ? Colors.red : Colors.green,
          ),
      ]),
    ));
  }
}
