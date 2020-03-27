import 'package:flutter/material.dart';

class LCDrawer extends StatefulWidget {
  LCDrawer({Key key}) : super(key: key);

  @override
  _LCDrawerState createState() => _LCDrawerState();
}

class _LCDrawerState extends State<LCDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Drawer'),
        ),
        drawer: _drawer,
        drawerScrimColor: Colors.brown,
        drawerEdgeDragWidth: 0.8,
        body: Container(
          child: RaisedButton(onPressed: (){
            Navigator.of(context).pop();
          }),
        ),
    );
  }

    get _drawer => Drawer(
    ///edit start
        child: ListView(
          padding: EdgeInsets.zero, // 此处能解决顶部为灰色的问题
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('R'),
                  ),
                ),
              ),
            ),
 
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            )
          ],
        ),
    ///edit end
      );
}

