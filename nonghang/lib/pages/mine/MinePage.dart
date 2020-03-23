import 'package:flutter/material.dart';
import 'package:nonghang/widget/mine/MineHeader.dart';
import 'package:nonghang/widget/mine/MineMyLife.dart';
import 'package:nonghang/widget/mine/MineMyMoney.dart';
import 'package:nonghang/widget/mine/MineSafe.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("我的"),
        ),
        body: ListView(children: [
          MineHeader(),
          MineMyMoney(),
          MineMyLife(),
          MineSafe(),
          MineSafe(),
          SizedBox(height:20),
        ]));
  }
}
