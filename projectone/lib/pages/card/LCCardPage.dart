import 'package:first/widgets/card/CardHui.dart';
import 'package:first/widgets/card/CardMargin.dart';
import 'package:first/widgets/card/CardMyCard.dart';
import 'package:first/widgets/card/CardQuickItem.dart';
import 'package:flutter/material.dart';

class LCCardPage extends StatefulWidget {
  LCCardPage({Key key}) : super(key: key);

  @override
  _LCCardPageState createState() => _LCCardPageState();
}

class _LCCardPageState extends State<LCCardPage> {
  @override
  void initState() {
    super.initState();

    print("init  LCCardPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("信用卡")),
        body: ListView(
          children: <Widget>[
            CardMyCard(),
            CardQuickItem(),
            CardMargin(),
            CardHui(),
            CardHui(),
            CardHui()
          ],
        ));
  }
}
