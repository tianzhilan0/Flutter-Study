import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/commom/LCMedia.dart';
import 'package:jianyue/pages/mine/model/UserDetailModel.dart';

class Mineheader extends StatefulWidget {
  final UserDetailModel model;
  Mineheader({Key key, this.model}) : super(key: key);

  @override
  _MineheaderState createState() => _MineheaderState();
}

class _MineheaderState extends State<Mineheader> {
  int line = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Stack(children: [
        Container(
          width: winWidth(context),
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    ExactAssetImage('images/common/common_user_backgroud.jpg')),
          ),
        ),
        Column(children: [
          SizedBox(height: 90),
          Row(children: [
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipOval(
                    child: CachedNetworkImage(
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  imageUrl: widget.model.avatar,
                ))),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '在这蓝色天空下',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: widget.model.followinguserscount.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: ' 关注  ',
                        style: TextStyle(fontSize: 14, color: Colors.black54)),
                    TextSpan(
                      text: widget.model.followerscount.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: ' 粉丝  ',
                        style: TextStyle(fontSize: 14, color: Colors.black54)),
                    TextSpan(
                      text: widget.model.jsdbalance.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: ' 资产',
                        style: TextStyle(fontSize: 14, color: Colors.black54))
                  ]))
                ])
          ])
        ]),
      ]),
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Text(
          '君不见，黄河之水天上来，奔流到海不复回。\n君不见，高堂明镜悲白发，朝如青丝暮成雪！\n人生得意须尽欢，莫使金樽空对月。\n天生我材必有用，千金散尽还复来。\n烹羊宰牛且为乐，会须一饮三百杯。\n岑夫子，丹丘生，将进酒，杯莫停。\n与君歌一曲，请君为我倾耳听。\n钟鼓馔玉不足贵，但愿长醉不复醒。\n古来圣贤皆寂寞，惟有饮者留其名。\n陈王昔时宴平乐，斗酒十千恣欢谑。\n主人何为言少钱，径须沽取对君酌。\n五花马、千金裘，呼儿将出换美酒，与尔同销万古愁',
          style: TextStyle(
            fontSize: 15,
          ),
          maxLines: line,
        ),
      ),
      InkWell(
          onTap: () {
            setState(() {
              line = line == 2 ? 1000 : 2;
            });
          },
          child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 80,
              height: 30,
              alignment: Alignment.centerLeft,
              child: Text(
                line == 2 ? '展开' : '收起',
                style: TextStyle(color: Colors.blue),
              ))),
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Text(
          '写了${widget.model.totalwordage}个字，获得了${widget.model.totallikescount}个喜欢',
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ),
      Container(color: Colors.black12, height: 10),
    ]);
  }
}
