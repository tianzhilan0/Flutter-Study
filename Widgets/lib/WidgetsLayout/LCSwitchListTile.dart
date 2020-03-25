import 'package:flutter/material.dart';

class LCSwitchListTile extends StatefulWidget {
  LCSwitchListTile({Key key}) : super(key: key);

  @override
  _LCSwitchListTileState createState() => _LCSwitchListTileState();
}

class _LCSwitchListTileState extends State<LCSwitchListTile> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("SwitchListTile")),
      body: ListView(children: [
        SwitchListTile(
          value: isSelected,
          onChanged: (bool value) {
            setState(() {
              isSelected = value;
            });
          },
          secondary: Icon(
            Icons.add_alarm,
//            color: Colors.orange[200],
          ),
          title: new Text("主标题"),
          subtitle: new Text("标题副s标题副s标题副s标题副s标题副s标题"),
          dense: false,
          activeColor: Colors.green[200], // 指定选中时的颜色
          activeTrackColor: Colors.blue[200],
          inactiveTrackColor: Colors.orange[200],
//          inactiveThumbColor: Colors.red[200],
          inactiveThumbImage: AssetImage("images/avatar.jpg"),
          isThreeLine: true, // 是否空出第三行
          selected: true,
        ),
        SwitchListTile(
          value: isSelected,
          onChanged: (value) {
            setState(() {
              isSelected = value;
            });
          },
          title: Text('Switch Item A'),
          subtitle: Text('Description'),
          secondary: Icon(isSelected ? Icons.visibility : Icons.visibility_off),
          selected: isSelected,
        ),
      ]),
    ));
  }
}
