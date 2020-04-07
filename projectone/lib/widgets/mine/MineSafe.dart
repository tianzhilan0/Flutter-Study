import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MineSafe extends StatefulWidget {
  MineSafe({Key key}) : super(key: key);

  @override
  _MineSafeState createState() => _MineSafeState();
}

class _MineSafeState extends State<MineSafe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              "我的生活",
              style: TextStyle(color: Colors.black87,fontSize: 20, fontWeight: FontWeight.w600),
            )),
            SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
              child: Column(children: [
            CachedNetworkImage(
              imageUrl: "http://api.oyear.cn/nonghang/item-epay.png",
              width: 40,
              height: 40,
            ),
            Text(
              "积分",
              style: TextStyle(fontSize: 16),
            ),
          ])),
          Container(
              child: Column(children: [
            CachedNetworkImage(
              imageUrl: "http://api.oyear.cn/nonghang/item-epay.png",
              width: 40,
              height: 40,
            ),
            Text(
              "积分",
              style: TextStyle(fontSize: 16),
            ),
          ])),
          Container(
              child: Column(children: [
            CachedNetworkImage(
              imageUrl: "http://api.oyear.cn/nonghang/item-epay.png",
              width: 40,
              height: 40,
            ),
            Text(
              "积分",
              style: TextStyle(fontSize: 16),
            ),
          ])),
          Container(
              child: Column(children: [
            CachedNetworkImage(
              imageUrl: "http://api.oyear.cn/nonghang/item-epay.png",
              width: 40,
              height: 40,
            ),
            Text(
              "积分",
              style: TextStyle(fontSize: 16),
            ),
          ]))
        ]),
        SizedBox(height:20),
      ]),
    );
  }
}