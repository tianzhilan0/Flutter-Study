import 'package:first/model/InvestModel.dart';
import 'package:flutter/material.dart';

class InvestCurrent extends StatefulWidget {
  final InvestModel model;
  InvestCurrent({Key key, this.model}) : super(key: key);

  @override
  _InvestCurrentState createState() => _InvestCurrentState();
}

class _InvestCurrentState extends State<InvestCurrent> {
  InvestModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = model.currentInvest.map((item) {
      return Container(
          // color: Colors.white,
          decoration: BoxDecoration(
            // 边色与边宽度
            boxShadow: [
              BoxShadow(color: Colors.black26, offset: Offset(0, 0)),
              BoxShadow(color: Colors.white)
            ],
          ),
          child: Column(children: [
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 24,
                height: 24,
                child: Image.network(item["icon"]),
              ),
              SizedBox(width: 10),
              Text(item["title"],
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ]),
            SizedBox(height: 10),
            Text(item["detail"],
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Text(item["rate"],
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text(item["type"],
                style: TextStyle(fontSize: 14, color: Colors.black45)),
          ]));
    }).toList();

    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Text(
                  "活期投资",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), //增加
                shrinkWrap: true, //增加
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return items[index];
                },
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 2,
                  // //纵轴间距
                  // mainAxisSpacing: 10.0,
                  //横轴间距
                  crossAxisSpacing: 20.0,
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ));
  }
}
