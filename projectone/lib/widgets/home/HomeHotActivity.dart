import 'package:first/model/HomeModel.dart';
import 'package:flutter/material.dart';

class HomeHotActivity extends StatefulWidget {
  final HomeModel model;
  HomeHotActivity({Key key, this.model}) : super(key: key);

  @override
  _HomeHotActivityState createState() => _HomeHotActivityState();
}

class _HomeHotActivityState extends State<HomeHotActivity> {
  HomeModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = model.hotActivity.map((item) {
      // return Container();
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(width: 20),
          SizedBox(
            width: 40,
            height: 40,
            child: Image.network(item["icon"]),
          ),
          SizedBox(width: 20),
          Expanded(
            flex:1,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              item["title"],
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              item["subtitle"],
              style: TextStyle(fontSize: 14, color: Colors.black45),
            ),
          ])),
          Padding(
              padding: EdgeInsets.only(right:10),
              child: FlatButton(
                child: Text(
                  "立即参加",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                color: Colors.orangeAccent,
                onPressed: () {},
              ))
        ]),
      );
    }).toList();

    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Text(
          "热门活动",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      )
    ]));
  }
}
