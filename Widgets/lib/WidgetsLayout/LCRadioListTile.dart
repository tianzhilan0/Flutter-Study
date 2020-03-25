import 'package:flutter/material.dart';

class LCRadioListTile extends StatefulWidget {
  LCRadioListTile({Key key}) : super(key: key);

  @override
  _LCRadioListTileState createState() => _LCRadioListTileState();
}

class _LCRadioListTileState extends State<LCRadioListTile> {
    int sex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("RadioListTile")),
          body: ListView(
            children:[
              RadioListTile(
            value: 1,
            onChanged: (value) {
              setState(() {
                this.sex = value;
              });
            },
            groupValue: this.sex,
            title: Text("一级标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.camera),
            selected: this.sex == 1,
          ),
          RadioListTile(
            value: 2,
            onChanged: (value) {
              setState(() {
                this.sex = value;
              });
            },
            groupValue: this.sex,
            title: Text("一级标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.palette),
            selected: this.sex == 2,
          )
            ]
          ),
    ));
  }
}