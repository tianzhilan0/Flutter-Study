import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map> widgets = [
    //基础类 Widget
    {"title": "Text", "path": "/text"},
    {"title": "TextField", "path": "/textField"},
    {"title": "Button", "path": "/button"},
    {"title": "Image", "path": "/image"},
    {"title": "CheckBox", "path": "/checkbox"},
    {"title": "Switch", "path": "/switch"},

    //容器类 Widget
    {"title": "Padding", "path": "/padding"},
    {"title": "ConstrainedBox", "path": "/constrainedbox"},
    {"title": "DecoratedBox", "path": "/decoratedbox"},
    {"title": "Transform", "path": "/transform"},
    {"title": "RotatedBox", "path": "/rotatedbox"},
    {"title": "Container", "path": "/container"},

    //布局类 Widget
    {"title": "Row", "path": "/row"},
    {"title": "Column", "path": "/column"},
    {"title": "Flex", "path": "/flex"},
    {"title": "Wrap", "path": "/wrap"},
    {"title": "Stack", "path": "/stack"},
    {"title": "Align", "path": "/align"},
    {"title": "FittedBox", "path": "/fittedbox"},
    {"title": "AspectRatio", "path": "/aspectratio"},
    {"title": "Baseline", "path": "/baseline"},
    {"title": "FractionallySizedBox", "path": "/fractionallySizedBox"},
    {"title": "LimitedBox", "path": "/limitedBox"},
    {"title": "Offstage", "path": "/offstage"},
    {"title": "OverflowBox", "path": "/overflowBox"},
    {"title": "SizedOverflowBox", "path": "/sizedOverflowBox"},
  ];

  List<Map> tools = [
    {
      "avatar": "http",
      "title": "网络请求",
      "detail": "原生http、第三方dio、第三方http",
      "path": "/http"
    },
    {
      "avatar": "json",
      "title": "JSON解析",
      "detail": "Map解析和对象解析",
      "path": "/json"
    },
    {
      "avatar": "T",
      "title": "Toast",
      "detail": "第三方fluttertoast",
      "path": "/toast"
    },
    {
      "avatar": "S",
      "title": "本地化存储",
      "detail": "第三方shared_preferences",
      "path": "/shared_preferences"
    },
  ];

  List<Map> extend = [
    {"title": "轮播图", "path": "/swiper"},
    {"title": "网络请求", "path": "/http"},
    {"title": "网络请求", "path": "/http"},
    {"title": "网络请求", "path": "/http"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _tabBarTop(),
          // leading: Text("更多"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.list))
          ],
        ),
        body: _tabBarView());
  }

  Widget showWidgets(List<Map> items) {
    return Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 2.0, //显示区域宽高相等
              mainAxisSpacing: 10.0, //主轴间距
              crossAxisSpacing: 10.0, //横轴间距
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RaisedButton(
                color: Colors.orange,
                child: Text(
                  items[index]["title"],
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), //圆角//边框
                ),
                onPressed: () {
                  Navigator.pushNamed(context, items[index]["path"]);
                },
              );
            }));
  }

  Widget showTools(List<Map> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(items[index]["avatar"]),
            ),
            title: Text(items[index]["title"]),
            subtitle: Text(items[index]["detail"]),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, items[index]["path"]);
            },
          );
        });
  }

  _tabBarView() => TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            showWidgets(widgets),
            showTools(tools),
            showWidgets(extend),
            Center(child: Text('分类')),
          ]);

  _tabBarTop() => TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Tab(text: 'Widgets'),
        Tab(text: 'Tools'),
        Tab(text: 'Extends'),
        Tab(text: 'Other'),
      ],
      controller: _tabController);
}
