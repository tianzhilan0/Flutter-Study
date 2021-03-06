import 'package:first/widgets/base/LCAppBar.dart';
import 'package:first/widgets/life/LifeFooter.dart';
import 'package:first/widgets/life/LifeGoods.dart';
import 'package:first/widgets/life/LifeHeader.dart';
import 'package:flutter/material.dart';

class LCLifePage extends StatefulWidget {
  LCLifePage({Key key}) : super(key: key);

  @override
  _LCLifePageState createState() => _LCLifePageState();
}

class _LCLifePageState extends State<LCLifePage> {
  @override
  void initState() {
    super.initState();

    print("init  LCLifePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LCAppBar(
          stateColor: Colors.white,
          appBarAlpha: 1,
          leftAction: () {},
        ),
        body: Container(
            color: Theme.of(context).backgroundColor,
            child: ListView(
              children: <Widget>[
                LifeHeader(),
                SizedBox(height: 20),
                LifeGoods(),
                SizedBox(height: 20),
                LifeFooter(),
              ],
            )));
  }
}
