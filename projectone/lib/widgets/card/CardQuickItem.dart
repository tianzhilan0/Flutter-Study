import 'package:flutter/material.dart';

class CardQuickItem extends StatefulWidget {
  CardQuickItem({Key key}) : super(key: key);

  @override
  _CardQuickItemState createState() => _CardQuickItemState();
}

class _CardQuickItemState extends State<CardQuickItem> {
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
        Text(item["title"],
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ]);
    }).toList();

    return Container(
        padding: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: GridView.builder(
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
        ));
  }
}
