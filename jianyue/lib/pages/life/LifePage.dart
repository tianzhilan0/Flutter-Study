import 'package:flutter/material.dart';

class LifePage extends StatefulWidget {
  LifePage({Key key}) : super(key: key);

  @override
  _LifePageState createState() => _LifePageState();
}

class _LifePageState extends State<LifePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    print("=========> LifePage initState <=========");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Widget tabs() {
    //   return TabBar(
    //     indicatorColor: Colors.blue,
    //     labelColor: Colors.blue,
    //     unselectedLabelColor: Colors.white,
    //     indicatorSize: TabBarIndicatorSize.label,
    //     tabs: <Widget>[
    //       Tab(text: "热销"),
    //       Tab(text: "推荐"),
    //       Tab(text: "热门"),
    //       Tab(text: "视频")
    //     ],
    //   );
    // }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("生活"),
        ),
        // body: ListView(children: [
        //   LifeHeader(),
        //   SizedBox(height: 20),
          // LifeGoods(),
        //   SizedBox(height: 20),
        //   LifeFooter(),
        //   // tabs(),
        // ]),
      ),
    );
  }
}
