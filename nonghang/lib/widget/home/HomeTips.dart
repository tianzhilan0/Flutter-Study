import 'package:flutter/material.dart';
import 'package:nonghang/model/HomeModel.dart';

class HomeTips extends StatefulWidget {
  final HomeModel model;
  HomeTips({Key key, this.model}) : super(key: key);

  @override
  _HomeTipsState createState() => _HomeTipsState();
}

class _HomeTipsState extends State<HomeTips> {

  HomeModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(
              "金融小秘书 智能提醒",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Row(children: [
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.timelapse,
                  color: Colors.black38,
                ),
                label: Text(
                  '缴费提醒',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                )),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.card_membership, color: Colors.black38),
                label: Text('还款提醒',
                    style: TextStyle(
                      color: Colors.black38,
                    ))),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.settings, color: Colors.black38),
                label: Text('个人提醒',
                    style: TextStyle(
                      color: Colors.black38,
                    )))
          ]),
          Divider(color: Colors.black38),
        ],
      );
  }
}