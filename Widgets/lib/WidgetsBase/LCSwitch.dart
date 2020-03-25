import 'package:flutter/material.dart';

class LCSwitch extends StatefulWidget {
  @override
  _LCSwitchState createState() => _LCSwitchState();
}

class _LCSwitchState extends State<LCSwitch> {
  bool _switchSelected = true; //switch 状态
  String showText = ""; //显示的内容

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Switch")),
          body: Column(
            children: <Widget>[
              Text(showText),
              Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    _switchSelected = value;
                    if (value) {
                      showText = "开启";
                    } else {
                      showText = "关闭";
                    }
                    setState(() {});
                  }),
            ],
          )),
    );
  }
}
