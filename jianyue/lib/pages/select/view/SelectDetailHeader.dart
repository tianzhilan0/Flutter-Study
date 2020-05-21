import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/commom/LCMedia.dart';
import 'package:jianyue/pages/select/model/SelectDetailModel.dart';

class SelectDetailHeader extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final SelectDetailModel model;
  SelectDetailHeader({Key key, this.model, this.onChanged}) : super(key: key);

  @override
  _SelectDetailHeaderState createState() => _SelectDetailHeaderState();
}

class _SelectDetailHeaderState extends State<SelectDetailHeader> {
  SelectDetailModel model;
  int line = 3;
  int _type = 2;

  @override
  void initState() {
    super.initState();

    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 10,
      ),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
          width: 50,
          height: 50,
          child: ClipRRect(
    borderRadius: BorderRadius.circular(6.0),
    child:CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: model.image,
          ),
        )),
        Container(
            width: winWidth(context) - 50 - 15 - 10,
            padding: EdgeInsets.only(right: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title,style: TextStyle(fontSize:18,fontWeight:FontWeight.w600),),
                  SizedBox(height:5),
                  Text('${model.notescount}篇文章，${model.subscriberscount}关注'),
                  SizedBox(height:5),
                  Text(
                    model.contentwithouthtml,
                    maxLines: line,
                  ),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        setState(() {
                          line = line == 3 ? 1000 : 3;
                        });
                      },
                      child: Container(
                          width: 80,
                          height: 30,
                          alignment: Alignment.centerLeft,
                          child: Text(line == 3 ? '展开' : '收起'))),
                  SizedBox(height: 10),
                  Container(
                      width: double.maxFinite,
                      child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {},
                          child: Text(
                            "+ 关注",
                            style: TextStyle(color: Colors.white),
                          )))
                ]))
      ]),
      SizedBox(height: 15),
      Container(
        height: 10,
        color: Colors.black12,
      ),
      Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabs()),
      ),
      Divider(),
    ]);
  }

  List data = [
    {"title": "最新收录","id":1},
    {"title": "最新评论","id":2},
    {"title": " 热门 ","id":3},
  ];

  void _selectTab(int id) {
    widget.onChanged(id);
    setState(() {
      _type = id;
    });
  }

  List<Widget> tabs() {
    return data.map((item) {
      return GestureDetector(
          //手势监听控件，用于监听各种手势
          child: Container(
            // padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              item["title"],
              style: TextStyle(
                color: _type == item["id"]
                    ? Colors.redAccent
                    : Colors.black54,
                fontSize: _type == item["id"] ? 18 : 18,
                fontWeight: _type == item["id"]
                    ? FontWeight.w500
                    : FontWeight.w300,
                decoration: _type == item["id"]
                    ? TextDecoration.underline
                    : null,
                decorationColor: Colors.redAccent,
              ),
            ),
          ),
          onTap: () => _selectTab(
                item["id"],
              )
          //onSelectTab函数的使用非常巧妙，
          //相当于定义了一个接口，可操控当前控件以外的数据
          );
    }).toList();
  }
}
