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
    {"title": "Stack/Positioned", "path": "/stack"},
    {"title": "Align", "path": "/align"},
    {"title": "FittedBox", "path": "/fittedbox"},
    {"title": "AspectRatio", "path": "/aspectratio"},
    {"title": "Baseline", "path": "/baseline"},
    {"title": "FractionallySizedBox", "path": "/fractionallySizedBox"},
    {"title": "LimitedBox", "path": "/limitedBox"},
    {"title": "Offstage", "path": "/offstage"},
    {"title": "OverflowBox", "path": "/overflowBox"},
    {"title": "SizedOverflowBox", "path": "/sizedOverflowBox"},

    //

    {"title": "InkWell", "path": "/switch"},
    {"title": "AspectRatio", "path": "/switch"},
    {"title": "Expanded", "path": "/switch"},
    {"title": "ListView", "path": "/switch"},
    {"title": "GridView", "path": "/switch"},
    {"title": "Flow", "path": "/switch"},
    {"title": "Table", "path": "/switch"},
    {"title": "ListTitle", "path": "/switch"},
    {"title": "CheckboxListTitle", "path": "/switch"},
    {"title": "RadioListTitle", "path": "/switch"},
    {"title": "SwitchListTile", "path": "/switch"},
    {"title": "GestureDetector", "path": "/switch"},
    {"title": "进度条", "path": "/switch"},
    {"title": "卡片", "path": "/switch"},
    {"title": "chip（未）", "path": "/switch"},
    {"title": "状态管理Provider", "path": "/switch"},
    {"title": "Steam", "path": "/shared_preferences"},
    {"title": "InheritedWidget", "path": "/shared_preferences"},
    {"title": "PopupMenuButton", "path": "/toast"},

    {"title": "alter/sheet", "path": "/toast"},
    {"title": "show", "path": "/toast"},
    {"title": "showDatePicker", "path": "/toast"},
    {"title": "showTimePicker", "path": "/toast"},
    {"title": "BottomSheet", "path": "/toast"},
    {"title": "showBottomSheet", "path": "/toast"},
    {"title": "showModalBottomSheet", "path": "/toast"},
    {"title": "Dialog", "path": "/toast"},
    {"title": "AlertDialog", "path": "/toast"},
    {"title": "SimpleDialog", "path": "/toast"},
    {"title": "AboutDialog", "path": "/toast"},
    {"title": "SnackBar", "path": "/toast"},
  ];

  List<Map> tools = [
    {"title": "网络请求", "path": "/http"},
    {"title": "JSON解析", "path": "/json"},
    {"title": "Toast", "path": "/toast"},
    {"title": "shared_preferences", "path": "/shared_preferences"},
    {"title": "文件读写", "path": "/shared_preferences"},
    {"title": "数据库Sqflite", "path": "/shared_preferences"},
    {"title": "RxDart", "path": "/shared_preferences"},
    {"title": "Socket", "path": "/shared_preferences"},
    {"title": "Loading", "path": "/shared_preferences"},
    {"title": "轮播图", "path": "/swiper"},
    {"title": "下拉刷新", "path": "/login"},
    {"title": "抽屉效果", "path": "/http"},
    {"title": "相机", "path": "/http"},
    {"title": "自定义相机", "path": "/http"},
    {"title": "相册", "path": "/http"},
    {"title": "相册多图选择", "path": "/http"},
    {"title": "WebView", "path": "/http"},
    {"title": "定时器", "path": "/http"},
  ];

  List<Map> extend = [
    {"title": "富文本", "path": "/http"},
    {"title": "GIF图", "path": "/http"},
    {"title": "朋友圈头", "path": "/http"},
    {"title": "导航栏", "path": "/http"},
    {"title": "导航TabBar", "path": "/http"},
    {"title": "底部Tabbar", "path": "/http"},
    {"title": "自定义底部Tabbar", "path": "/http"},
    {"title": "多线程", "path": "/http"},
    {"title": "推送", "path": "/http"},
    {"title": "自定义字体", "path": "/http"},
    {"title": "视频播放", "path": "/http"},
    {"title": "音乐播放", "path": "/http"},
    {"title": "本地文件写读", "path": "/http"},
    {"title": "地址选择", "path": "/http"},
    {"title": "日历选择", "path": "/http"},
    {"title": "分享", "path": "/http"},
    {"title": "统计", "path": "/http"},
    {"title": "第三方登录", "path": "/http"},
    {"title": "支付", "path": "/http"},
    {"title": "地图", "path": "/http"},
    {"title": "绘图", "path": "/http"},
    {"title": "股票图", "path": "/http"},
  ];

  List<Map> develop = [
    {"title": "登录", "path": "/login"},
    {"title": "注册", "path": "/login"},
    {"title": "头条首页", "path": "/login"},
    {"title": "朋友圈", "path": "/login"},
    {"title": "简书个人页面", "path": "/login"},
    {"title": "商品详情", "path": "/login"},
    {"title": "外卖页面", "path": "/http"},
    {"title": "购物车", "path": "/login"},
    {"title": "拖拽GridView", "path": "/http"},
    {"title": "个人标签", "path": "/http"},
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
                color: Colors.lightBlue,
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

  // Widget showTools(List<Map> items) {
  //   return ListView.builder(
  //       itemCount: items.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           leading: CircleAvatar(
  //             child: Text(items[index]["avatar"]),
  //           ),
  //           title: Text(items[index]["title"]),
  //           subtitle: Text(items[index]["detail"]),
  //           trailing: Icon(Icons.keyboard_arrow_right),
  //           onTap: () {
  //             Navigator.pushNamed(context, items[index]["path"]);
  //           },
  //         );
  //       });
  // }

  _tabBarView() => TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            showWidgets(widgets),
            showWidgets(tools),
            showWidgets(extend),
            showWidgets(develop),
          ]);

  _tabBarTop() => TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Tab(text: 'Widgets'),
        Tab(text: 'Tools'),
        Tab(text: 'Extends'),
        Tab(text: 'Develop'),
      ],
      controller: _tabController);
}
