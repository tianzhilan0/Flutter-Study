import 'package:flutter/material.dart';
import 'package:nonghang/widget/card/CardHui.dart';
import 'package:nonghang/widget/card/CardMargin.dart';
import 'package:nonghang/widget/card/CardMyCard.dart';
import 'package:nonghang/widget/card/CardQuickItem.dart';

class CardPage extends StatefulWidget {
  CardPage({Key key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    print("=========> CardPage initState <=========");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("信用卡"),
        ),
        body: ListView(shrinkWrap: true, children: [
          CardMyCard(),
          CardQuickItem(),
          CardMargin(),
          CardHui(),
          CardHui(),
          CardHui()
        ]),
      ),
    );
  }
}
