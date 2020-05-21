import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/commom/LCMedia.dart';
import 'package:jianyue/pages/home/model/HomeArticleModel.dart';

class HomeArticleItem extends StatelessWidget {
  final HomeArticleModel model;
  final ValueChanged<HomeArticleModel> ontap;
  const HomeArticleItem({Key key, this.model, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ontap(model);
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0), //内边距
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "${model.title}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
              SizedBox(
                height: 8,
              ),
              Row(children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Container(
                            child: Text(
                          "${model.publicabbr}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                          maxLines: 2,
                        )),
                        //  Text("${model.user.nickname}"),
                        SizedBox(height: 10),
                        Container(
                          width: model.listimageurl.length > 0 ? winWidth(context) - 90 -20:winWidth(context) -20,
                          child:Text(
                                "${model.user.nickname}  ${model.publiccommentscount}评论  ${model.likescount}喜欢",
                                style: TextStyle(color: Colors.black54),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                        )
                      ],
                    )),
                SizedBox(width: model.listimageurl.length > 0 ? 10 : 0),
                model.listimageurl.length > 0
                    ? CachedNetworkImage(
                        width: model.listimageurl.length > 0 ? 80 : 0,
                        height: model.listimageurl.length > 0 ? 80 : 0,
                        fit: BoxFit.cover,
                        imageUrl: "${model.listimageurl}")
                    : SizedBox(),
              ]),
              SizedBox(height:5),
              Divider(height: 1,)
            ])));
  }
}
