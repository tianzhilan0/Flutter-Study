import 'package:first/model/InvestModel.dart';
import 'package:flutter/material.dart';

class InvestYouLike extends StatefulWidget {
  final InvestModel model;
  InvestYouLike({Key key, this.model}) : super(key: key);

  @override
  _InvestYouLikeState createState() => _InvestYouLikeState();
}

class _InvestYouLikeState extends State<InvestYouLike> {
  InvestModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items() {
      List<Widget> items = List<Widget>();

      for (int i = 0; i < model.youlike.length; i++) {
        items.add(Row(children: [
          SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.youlike[i]["rate"],
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600)),
                Text(model.youlike[i]["type"],
                    style: TextStyle(fontSize: 14, color: Colors.black45))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.youlike[i]["title"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                Text(model.youlike[i]["tip"],
                    style: TextStyle(fontSize: 14, color: Colors.black45))
              ],
            ),
          ),
        ]));
        items.add(i != model.youlike.length - 1
              ? Divider(color: Colors.black38, indent: 20)
              : Container());
      }
      
      
      return items;
    }

    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Text(
                    "猜你喜欢",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Column(children: items()),
              SizedBox(height: 10)
            ]));
  }
}
