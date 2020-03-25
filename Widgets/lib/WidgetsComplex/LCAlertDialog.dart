import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LCAlertDialog extends StatefulWidget {
  LCAlertDialog({Key key}) : super(key: key);

  @override
  _LCAlertDialogState createState() => _LCAlertDialogState();
}

class _LCAlertDialogState extends State<LCAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      body: Column(children: [
        RaisedButton(
          onPressed: () {
            showMyAlertDialog(context);
          },
          child: Text("点击显示AlertDialog"),
        ),
        RaisedButton(
          onPressed: () {
            showMyCupertinoDialog(context);
          },
          child: Text("点击显示CupertinoAlertDialog"),
        ),
        RaisedButton(
          onPressed: () {
            showMySimpleDialog(context);
          },
          child: Text("点击显示SimpleDialog"),
        ),
        RaisedButton(
          onPressed: () {
            showMyModalBottomSheet(context);
          },
          child: Text("点击显示showModalBottomSheet"),
        ),
        RaisedButton(
          onPressed: () {
            showMyModalBottomSheet2(context);
          },
          child: Text("点击显示showModalBottomSheet2"),
        ),
        RaisedButton(
          onPressed: () {
            showMyAboutDialog(context);
          },
          child: Text("点击显示AboutDialog"),
        ),
      ]),
    ));
  }

  void showMyAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("这是标题"),
            titlePadding: EdgeInsets.only(bottom: 30.0, left: 10.0),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("这是第一行"),
                  Text("这是第二行"),
                  Text("这是第三行"),
                ],
              ),
            ),
            contentPadding: EdgeInsets.only(left: 40.0),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("确定"),
              ),
            ],
          );
        });
  }

  void showMyCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("title"),
            content: Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了确定");
                },
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
                },
                child: Text("取消"),
              ),
            ],
          );
        });
  }

  void showMySimpleDialog(BuildContext context) {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('选择'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('选项 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }

  void showMyModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: Color(0xfff1f1f1),
          child: Center(
            child: Text("底部面板,点击消失"),
          ),
        );
      },
    );
  }

  void showMyModalBottomSheet2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          child: Container(
            height: 2000.0,
            color: Color(0xfff1f1f1),
            child: Center(
              child: Text("底部面板,点击底部面板不消失"),
            ),
          ),
          onTap: () => false,
        );
      },
    );
  }

  void showMyAboutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AboutDialog(
          applicationName: "Super Stars",
          applicationVersion: "v1.0",
          applicationIcon: new Icon(
            Icons.beenhere,
            color: Colors.green[200],
          ),
          applicationLegalese: "开始伟大",
          children: <Widget>[
            Text("无限伟大"),
            Icon(Icons.add_alarm),
          ],
        );
      },
    );
  }
}
