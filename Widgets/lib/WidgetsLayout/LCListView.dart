import 'package:flutter/material.dart';

class LCListView extends StatefulWidget {
  LCListView({Key key}) : super(key: key);

  @override
  _LCListViewState createState() => _LCListViewState();
}

class _LCListViewState extends State<LCListView> {

    int count = 0;//一个随机英文单词的数据源
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: ListView.builder(
            padding: EdgeInsets.all(8.0),//内边距
            itemBuilder: (conText, i) {
              count++;
              return Container(
                height:50,
                child: Column(
                  children:[
                    Text("这是第 $count 个 Item",style: TextStyle(fontSize:17),),
                    // Container(
                    //   color: Colors.blueGrey,
                    //   height: 1,
                    // )
                    Divider()
                  ]
                )
              );
        })
      ));

    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: ListView(
          scrollDirection: Axis.horizontal, //ListView滑动方向horizontal水平vertical垂直
          children: [
            Container(
              width: 180.0,
              color: Colors.greenAccent,
            ),
            Container(
              width: 180.0,
              color: Colors.lightBlue,
            ),
            Container(
              width: 180.0,
              color: Colors.red,
            ),
            Container(
              width: 180.0,
              color: Colors.black12,
            ),
            Container(
              width: 180.0,
              color: Colors.amberAccent,
            )
          ]),
    ));

    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: ListView(children: [
        Image.network(
            "https://cdn2.jianshu.io/assets/web/banner-s-3-7123fd94750759acf7eca05b871e9d17.png"),
        Image.network(
            "https://cdn2.jianshu.io/assets/web/banner-s-4-b70da70d679593510ac93a172dfbaeaa.png"),
        Image.network(
            "https://cdn2.jianshu.io/assets/web/banner-s-7-1a0222c91694a1f38e610be4bf9669be.png"),
      ]),
    ));
  }
}
