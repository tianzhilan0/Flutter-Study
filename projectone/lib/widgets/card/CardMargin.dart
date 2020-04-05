import 'package:flutter/material.dart';

class CardMargin extends StatefulWidget {
  CardMargin({Key key}) : super(key: key);

  @override
  _CardMarginState createState() => _CardMarginState();
}

class _CardMarginState extends State<CardMargin> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Image.network(
            "http://www.abchina.com/cn/advis/grfw_gggl/sygg/202001/P020200128691993229674.png"),
      ),
      Container(
          color: Colors.white,
          height: 100,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Image.network(
                      "http://www.abchina.com/cn/PersonalServices/PersonalServices/zxjr/rdgn/202001/W020200108575796342650.png",
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 5),
                    Text("信用币"),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "最高"),
                      TextSpan(
                          text: "20,000",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent)),
                      TextSpan(text: "秒速到账"),
                    ])),
                    SizedBox(height: 10),
                    Text("小额信用贷"),
                  ],
                )),
            SizedBox(width: 20),
            Expanded(
                flex: 1,
                child: Container(
                  width: 80,
                  height: 30,
                  child: OutlineButton(
                    child: Text(
                      "点击进入",
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                    borderSide: BorderSide(
                        color: Colors.greenAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {},
                  ),
                )),
          ])),
          SizedBox(height: 20),
    ]);
  }
}
