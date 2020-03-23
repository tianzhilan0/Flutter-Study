import 'package:flutter/material.dart';
import 'package:nonghang/model/HomeModel.dart';

class HomeQuickItems extends StatefulWidget {
  final HomeModel model;
  HomeQuickItems({Key key, this.model}) : super(key: key);

  @override
  _HomeQuickItemsState createState() => _HomeQuickItemsState();
}

class _HomeQuickItemsState extends State<HomeQuickItems> {
  HomeModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = model.quickItems.map((item) {
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
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
              crossAxisCount: 5,
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 10.0,
            ),
          ),
        ),
        Divider(color: Colors.black38),
      ]),
    );
  }
}
