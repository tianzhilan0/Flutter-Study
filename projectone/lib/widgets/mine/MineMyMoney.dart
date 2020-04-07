import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MineMyMoney extends StatefulWidget {
  MineMyMoney({Key key}) : super(key: key);

  @override
  _MineMyMoneyState createState() => _MineMyMoneyState();
}

class _MineMyMoneyState extends State<MineMyMoney> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "我的资产",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      margin: EdgeInsets.only(left:40,top: 20),
                      // padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                      child: RaisedButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "立即查看",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          onPressed: () {}),
                    )
                  ])),
          Expanded(
              flex: 1,
              child: CachedNetworkImage(
                  imageUrl: "http://api.oyear.cn/nonghang/mine/mine-money.png"))
        ]),
        Divider(indent: 10, endIndent: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.attach_money),
                label: Text(
                  "我的负债",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                )),
            Container(
              // color: Colors.orange,
              width: 1,
              height: 40,
              child: VerticalDivider(),
            ),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.money_off),
                label: Text(
                  "月度账单",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ))
          ],
        ),
        SizedBox(height: 10),
      ]),
    );
  }
}
