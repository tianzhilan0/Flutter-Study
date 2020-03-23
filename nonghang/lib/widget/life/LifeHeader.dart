import 'package:flutter/material.dart';
import 'package:nonghang/commom/LCMedia.dart';

class LifeHeader extends StatefulWidget {
  LifeHeader({Key key}) : super(key: key);

  @override
  _LifeHeaderState createState() => _LifeHeaderState();
}

class _LifeHeaderState extends State<LifeHeader> {
  @override
  Widget build(BuildContext context) {

    List dataItems = [
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
      {"imageUrl": "http://api.oyear.cn/nonghang/item-ebao.png", "title": "啦啦"},
    ];
    List<Widget> _items = dataItems.map((item) {
      return Column(children: [
        Image.network(
          item["imageUrl"],
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 3,
        ),
        Text(item["title"]),
      ]);
    }).toList();



    return Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height:25),
            GridView.builder(
          physics: NeverScrollableScrollPhysics(), //增加
          shrinkWrap: true, //增加
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return _items[index];
          },
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 4,
            //纵轴间距
            mainAxisSpacing: 0.0,
            //横轴间距
            crossAxisSpacing: 25.0,
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Image.network(
                "http://www.abchina.com/cn/advis/grfw_gggl/sygg/202001/P020200128691993229674.png"),
          ),
          Container(
              height: 100,
              child: Row(children: [
                Container(
                  width: winWidth(context) / 3,
                  child: Column(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 50, height: 50),
                    Text("精品秒杀"),
                    Text("限时兑换"),
                  ]),
                ),Container(
                  width: winWidth(context) / 3,
                  child: Column(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 50, height: 50),
                    Text("精品秒杀"),
                    Text("限时兑换"),
                  ]),
                ),Container(
                  width: winWidth(context) / 3,
                  child: Column(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 50, height: 50),
                    Text("精品秒杀"),
                    Text("限时兑换"),
                  ]),
                )
              ])),
              
          ]
        ));
  }
}