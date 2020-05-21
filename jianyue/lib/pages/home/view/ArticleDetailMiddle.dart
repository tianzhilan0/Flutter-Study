import 'package:flutter/material.dart';
import 'package:jianyue/pages/home/model/ArticleDetailModel.dart';

class ArticleDetailMiddle extends StatelessWidget {
  final ArticleDetailModel model;

  const ArticleDetailMiddle({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Divider(indent: 0, endIndent: 0, color: Colors.black26),
            Text(
              "©著作权归作者所有，转载或内容合作请联系作者",
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 15),
            Row(children: [
              Expanded(
                flex: 1,
                child: Divider(indent: 0, endIndent: 20, color: Colors.black26),
              ),
              Text(
                "点赞有惊喜，点点点",
                style: TextStyle(color: Colors.black54),
              ),
              Expanded(
                flex: 1,
                child: Divider(indent: 20, endIndent: 0, color: Colors.black26),
              )
            ]),
            Container(
                width: double.maxFinite,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: Image.asset(
                              "images/common/common_zan.png",
                              width: 24,
                              height: 24,
                            ),
                            decoration: BoxDecoration(
                              border: new Border.all(
                                  color: Colors.black12, width: 3), // 边色与边宽度
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            )),
                      ),
                      SizedBox(height: 5),
                      Text("赞(${model.likescount})")
                    ])),
            Container(
                color: Colors.grey[200],
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          image: DecorationImage(
                            image: NetworkImage(
                              model.user.avatar,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.user.nickname,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            Text("喜欢就点赞，关注走一波"),
                          ]),
                    ])),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text("关注"),
                          color: Colors.blueGrey,
                        ))
                  ],
                )),
          ])),
      Container(
        height: 10,
        color: Colors.black12,
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Text(
          "评论(${model.publiccommentcount})",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ]);
  }
}
