import 'package:first/model/HomeModel.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  final HomeModel model;
  HomeHeader({Key key, this.model}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  HomeModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List items() {
      return model.header.map((item) {
        return Column(children: [
          Image.network(
            '${item['imageUrl']}',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          Text('${item['title']}',
              style: TextStyle(fontSize: 15, color: Colors.white))
        ]);
      }).toList();
    }

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(model.backGround)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(40, 84, 0, 0),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 5, 0, 0),
            child: Text(
              model.subtitle,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items(),
            ),
          ),
          SizedBox(height: 20),
          ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                width: double.maxFinite,
                height: 20,
              ))
        ]));
  }
}
