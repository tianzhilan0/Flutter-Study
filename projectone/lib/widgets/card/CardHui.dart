import 'package:flutter/material.dart';

class CardHui extends StatefulWidget {
  CardHui({Key key}) : super(key: key);

  @override
  _CardHuiState createState() => _CardHuiState();
}

class _CardHuiState extends State<CardHui> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "优惠精选",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Image.network(
                "http://www.abchina.com/cn/advis/grfw_gggl/sygg/202001/P020200128691993229674.png"),
          ),
          Container(
              height: 100,
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 50, height: 50),
                    Text("精品秒杀"),
                    Text("限时兑换"),
                  ]),
                ),Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 50, height: 50),
                    Text("精品秒杀"),
                    Text("限时兑换"),
                  ]),
                ),Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 50, height: 50),
                    Text("精品秒杀"),
                    Text("限时兑换"),
                  ]),
                )
              ]))
        ]));
  }
}
