import 'package:flutter/material.dart';

class LCListTitle extends StatefulWidget {
  LCListTitle({Key key}) : super(key: key);

  @override
  _LCListTitleState createState() => _LCListTitleState();
}

class _LCListTitleState extends State<LCListTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("ListTile")),
      body: ListView(children: [
        ListTile(
          leading: Icon(Icons.cake),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('标题'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('标题'),
          subtitle: Row(
            children: <Widget>[Text('副标题'), Icon(Icons.person)],
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('标题'),
          subtitle: Row(
            children: <Widget>[Text('副标题'), Icon(Icons.person)],
          ),
          trailing: Icon(Icons.save),
          onTap: () {
            print('点击');
          },
        )
      ]),
    ));
  }
}
