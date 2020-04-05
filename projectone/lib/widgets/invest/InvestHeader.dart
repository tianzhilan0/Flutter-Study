import 'package:first/model/InvestModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class InvestHeader extends StatefulWidget {
  final InvestModel model;
  InvestHeader({Key key, this.model}) : super(key: key);

  @override
  _InvestHeaderState createState() => _InvestHeaderState();
}

class _InvestHeaderState extends State<InvestHeader> {
  InvestModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    Widget gripView(List items) {
      // Container();
      return Container(
        color: Colors.white,
        height: 180.0,
        // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(children: [
          SizedBox(height: 20),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(), //增加
            shrinkWrap: true, //增加
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 4,
              //纵轴间距
              mainAxisSpacing: 0.0,
              //横轴间距
              crossAxisSpacing: 10.0,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Image.network(
                  items[index]["imageUrl"],
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(items[index]["title"]),
              ]);
            },
          )
        ]),
      );
    }

    int page = (model.header.length / 8).ceil();

    return ConstrainedBox(
        child: Swiper(
            outer: false,
            itemCount: page,
            itemBuilder: (BuildContext context, int index) {
              List newItems = List();
              int count = index < page - 1 ? 8 : model.header.length % 8;
              for (int i = 0; i < count; i++) {
                int newIndex = index * 8 + i;
                newItems.add(model.header[newIndex]);
              }
              return gripView(newItems);
            },
            pagination: SwiperPagination()),
        constraints: BoxConstraints.loose(
            Size(MediaQuery.of(context).size.width, 220.0)));
  }
}
