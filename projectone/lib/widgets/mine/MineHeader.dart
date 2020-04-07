import 'package:flutter/material.dart';

class MineHeader extends StatefulWidget implements PreferredSizeWidget {
  final double contentHeight; //从外部指定高度
  MineHeader({Key key, this.contentHeight = 170}) : super(key: key);

  @override
  _MineHeaderState createState() => _MineHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(contentHeight);
}

class _MineHeaderState extends State<MineHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown,
        padding: EdgeInsets.only(top: kToolbarHeight),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Image.network(
                "http://api.oyear.cn/nonghang/mine/mine-ear.png",
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Image.network(
                "http://api.oyear.cn/nonghang/mine/mine-email.png",
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
            ]),
            SizedBox(height: 10),
            Container(
                height: 100,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    Positioned(
                        left: 10,
                        child: Container(
                          child: Image.network(
                            "http://api.oyear.cn/nonghang/mine/mine-head.png",
                            width: 70,
                            height: 70,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                          ),
                        )),
                    Positioned(
                        top: 5,
                        left: 90,
                        child: Text("登录",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    Positioned(
                        top: 45,
                        left: 90,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Row(children: [
                            SizedBox(width: 5),
                            Image.network(
                              "http://api.oyear.cn/nonghang/mine/mine-qiandao.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "签到有礼",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.orange),
                            ),
                            SizedBox(width: 5),
                            Image.network(
                              "http://api.oyear.cn/nonghang/mine/mine-right.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 5),
                          ]),
                        )),
                    Positioned(
                      top: 30,
                      right: 0,
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Colors.black45,
                          ),
                          child: Row(children: [
                            SizedBox(width: 5),
                            Image.network(
                              "http://api.oyear.cn/nonghang/mine/mine-head2.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "客户经理",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            SizedBox(width: 5),
                          ])),
                    )
                  ],
                ))
          ],
        ));
  }
}
