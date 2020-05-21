import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/pages/home/model/ArticleDetailModel.dart';

class ArticleDetailHeader extends StatelessWidget {
  final ArticleDetailModel model;

  const ArticleDetailHeader({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Text(
          "${model.publictitle}",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          maxLines: 3,
        ),
      ),
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
            width: 30,
            height: 30,
            child: ClipOval(
                child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: model.user.avatar,
            )),
          ),
          SizedBox(width: 5),
          Text(model.user.nickname),
        ],
      ),
      SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            padding: EdgeInsets.only(left: 10),
            child: Text("字数 " + model.wordage.toString())),
        Container(
            padding: EdgeInsets.only(right: 10),
            child: Text(model.firstsharedat)),
      ])
    ]);
  }
}
