import 'package:demo2/AppConfig.dart';
import 'package:demo2/MyDrawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final bool showPerformanceOverlay;
  final ValueChanged<bool> onShowPerformanceOverlayChanged;
  MyHomePage(
      {Key key,
      this.showPerformanceOverlay,
      this.onShowPerformanceOverlayChanged})
      : super(key: key) {
    assert(onShowPerformanceOverlayChanged != null);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool showPerformanceOverlay;
  ValueChanged<bool> onShowPerformanceOverlayChanged;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 7);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map> baseWidgets = [
    //基础类 Widget
    {"title": "Text", "path": "/text"},
    {"title": "TextField", "path": "/textField"},
    {"title": "Button", "path": "/button"},
    {"title": "Image", "path": "/image"},
    {"title": "CheckBox", "path": "/checkbox"},
    {"title": "ChoiceChip", "path": "/choiceChip"},
    {"title": "Switch", "path": "/switch"},
    {"title": "Progress", "path": "/progress"},
    {"title": "Offstage", "path": "/offstage"},
    {"title": "GestureDetector", "path": "/gestureDetector"},
    {"title": "chip", "path": "/chip"},
    {"title": "Divider", "path": "/divider"},
  ];

  List<Map> boxWidgets = [
    //容器类 Widget
    {"title": "Padding", "path": "/padding"},
    {"title": "Container", "path": "/container"},
    {"title": "InkWell", "path": "/inkWell"},
    {"title": "Transform", "path": "/transform"},
    {"title": "ConstrainedBox", "path": "/constrainedbox"},
    {"title": "DecoratedBox", "path": "/decoratedbox"},
    {"title": "RotatedBox", "path": "/rotatedbox"},
    {"title": "FittedBox", "path": "/fittedbox"},
    {"title": "LimitedBox", "path": "/limitedBox"},
    {"title": "OverflowBox", "path": "/overflowBox"},
    {"title": "SizedBox", "path": "/sizedBox"},
    {"title": "SizedOverflowBox", "path": "/sizedOverflowBox"},
    {"title": "FractionallySizedBox", "path": "/fractionallySizedBox"},
  ];

  List<Map> layoutWidgets = [
    //布局类 Widget
    {"title": "Row", "path": "/row"},
    {"title": "Column", "path": "/column"},
    {"title": "Flex", "path": "/flex"},
    {"title": "Wrap", "path": "/wrap"},
    {"title": "Stack/Positioned", "path": "/stack"},
    {"title": "Expanded/Flexible", "path": "/expanded"},
    {"title": "Align", "path": "/align"},
    {"title": "AspectRatio", "path": "/aspectratio"},
    {"title": "Baseline", "path": "/baseline"},
    {"title": "ListView", "path": "/listView"},
    {"title": "GridView", "path": "/gridView"},
    {"title": "Card", "path": "/card"},
    {"title": "Flow", "path": "/flow"},
    {"title": "Table", "path": "/table"},
    {"title": "ListTitle", "path": "/listTitle"},
    {"title": "CheckboxListTile", "path": "/checkboxListTile"},
    {"title": "RadioListTile", "path": "/radioListTile"},
    {"title": "SwitchListTile", "path": "/switchListTile"},
    {"title": "SingleChildScrollView", "path": "/singleChildScrollView"},
    {"title": "CustomScrollView", "path": "/customScrollView"},
    {"title": "NestedScrollView", "path": "/nestedScrollView"},
  ];

  List<Map> complexWidgets = [
    {"title": "PopupMenuButton", "path": "/popupMenuButton"},
    {"title": "AlertDialog", "path": "/alertDialog"},
    {"title": "showDatePicker", "path": "/showDatePicker"},
    {"title": "SnackBar", "path": "/snackBar"},
    {"title": "Steam", "path": "/steam"},
    {"title": "InheritedWidget", "path": "/inheritedWidget"},
    {"title": "Drawer", "path": "/drawer"},
    {"title": "定时器", "path": "/timer"},
    {"title": "Socket", "path": "/socket"},
  ];

  //第三方
  List<Map> otherTools = [
    {"title": "网络请求", "path": "/http"},
    {"title": "JSON解析", "path": "/json"},
    {"title": "Toast", "path": "/toast"},
    {"title": "shared_preferences", "path": "/shared_preferences"},
    {"title": "Provider", "path": "/provider"},
    {"title": "RxDart", "path": "/rxDart"},
    {"title": "轮播图", "path": "/swiper"},
    {"title": "下拉刷新", "path": "/refresh"},
    {"title": "Loading", "path": "/loading"},
    {"title": "WebView", "path": "/webView"},
    {"title": "系统相机相册", "path": "/systemCamera"},
    {"title": "相册多图选择", "path": "/imagePicker"},
    {"title": "自定义相机", "path": "/camera"},
    {"title": "文件读写", "path": "/writeRead"},
    {"title": "数据库Sqflite", "path": "/sqflite"},
  ];

  List<Map> extend = [
    {"title": "富文本", "path": "/richText"},
    {"title": "GIF图", "path": "/gif"},
    {"title": "加载本地HTML", "path": "/localHtml"},
    {"title": "自定义字体", "path": "/font"},
    {"title": "多线程", "path": "/thread"},
    {"title": "视频播放", "path": "/videoPlayer"},
    {"title": "音乐播放", "path": "/audioPlayer"},
    {"title": "录音", "path": "/record"},
    {"title": "微信录音", "path": "/wxrecord"},
    {"title": "画板", "path": "/draw"},
    {"title": "折线图", "path": "/discountFigure"},

    // {"title": "地址选择", "path": "/http"},
    // {"title": "推送", "path": "/http"},
    // {"title": "分享", "path": "/http"},
    // {"title": "统计", "path": "/http"},
    // {"title": "第三方登录", "path": "/http"},
    // {"title": "支付", "path": "/http"},
    // {"title": "地图", "path": "/http"},
    // {"title": "股票图", "path": "/http"},
  ];

  List<Map> develop = [
    {"title": "登录", "path": "/login"},
    {"title": "注册", "path": "/register"},
    {"title": "头条首页", "path": "/login"},
    // {"title": "朋友圈", "path": "/login"},
    // {"title": "简书个人页面", "path": "/login"},
    // {"title": "商品详情", "path": "/login"},
    // {"title": "外卖页面", "path": "/http"},
    // {"title": "购物车", "path": "/login"},
    // {"title": "拖拽GridView", "path": "/http"},
    // {"title": "个人标签", "path": "/http"},
  ];

  @override
  Widget build(BuildContext context) {
    showPerformanceOverlay = widget.showPerformanceOverlay;
    onShowPerformanceOverlayChanged = widget.onShowPerformanceOverlayChanged;

    return Scaffold(
        drawer: MyDrawer(
            showPerformanceOverlay: showPerformanceOverlay,
            onShowPerformanceOverlayChanged: onShowPerformanceOverlayChanged),
        appBar: AppBar(
          title: Text(defaultConfig.appName),
          bottom: _tabBarTop(),
          // leading: Text("更多"),
          // actions: <Widget>[
          //   Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 10),
          //       child: Icon(Icons.list))
          // ],
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
                color: Colors.lightBlueAccent,
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
            showWidgets(baseWidgets),
            showWidgets(boxWidgets),
            showWidgets(layoutWidgets),
            showWidgets(complexWidgets),
            showWidgets(otherTools),
            showWidgets(extend),
            showWidgets(develop),
          ]);

  _tabBarTop() => TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Tab(text: '基础Widget'),
        Tab(text: '容器Widget'),
        Tab(text: '布局Widget'),
        Tab(text: '复杂Widget'),
        Tab(text: '第三方'),
        Tab(text: '扩展'),
        Tab(text: '实战'),
      ],
      controller: _tabController);
}
