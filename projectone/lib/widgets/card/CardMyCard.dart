import 'package:flutter/material.dart';

class CardMyCard extends StatefulWidget {
  CardMyCard({Key key}) : super(key: key);

  @override
  _CardMyCardState createState() => _CardMyCardState();
}

class _CardMyCardState extends State<CardMyCard> {
  var _pageController = PageController(initialPage: 1, viewportFraction: 1);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List dataItems = [
      {"code": "6259 **** **** 2120", "content": "本期账单已还清", "date": "20200413"},
      {"code": "6259 **** **** 2120", "content": "本期账单已还清", "date": "20200413"},
      {"code": "6259 **** **** 2120", "content": "本期账单已还清", "date": "20200413"}
    ];

    Widget cardItem(index) {
      var item = dataItems[index];
      return Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 35),
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black54),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    Image.network("http://api.oyear.cn/nonghang/item-epay.png",
                        width: 24, height: 24),
                    SizedBox(width: 15),
                    Text(
                      item["code"],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )
                  ])),
              Container(
                  width: 60,
                  alignment: Alignment.centerRight,
                  child: Row(children: [
                    Text("查看",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    )
                  ]))
            ]),
            // SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(children: [
                    Text(
                      item["content"],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "下期账单日 ${item["date"]}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ]),
                  Container(
                    width: 80,
                    height: 30,
                    child: OutlineButton(
                      padding: EdgeInsets.all(0),
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                        style: BorderStyle.solid),
                    child: Text("账单查询",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    onPressed: () {},
                  )
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                "分期还款",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Container(
                // width: 10,
                height: 20,
                child: VerticalDivider(color: Colors.white),
              ),
              Text(
                "立即还款",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ])
          ]));
    }

    List<Widget> indexItem() {
      List<Widget> items = List<Widget>();

      for (var i = 0; i < dataItems.length; i++) {
        items.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: ClipOval(
                child: Container(
                    width: 8,
                    height: 8,
                    color: _currentIndex == i
                        ? Colors.greenAccent
                        : Colors.grey))));
      }
      return items;
    }

    return Container(
        height: 255,
        color: Colors.white,
        child: Stack(children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: dataItems.length,
            itemBuilder: (BuildContext context, int index) {
              return cardItem(index);
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            height: 20,
            child: Stack(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indexItem()),
              Positioned(
                  bottom: 0.0,
                  // left: 0.0,
                  right: 20.0,
                  child: Row(children: [
                    Text("全部卡片",
                        style:
                            TextStyle(fontSize: 16, color: Colors.greenAccent)),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.greenAccent,
                    )
                  ]))
            ]),
          ),
        ]));
  }
}
