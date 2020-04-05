import 'package:first/config/RequestApi.dart';
import 'package:first/model/HomeModel.dart';
import 'package:first/tools/webserve/LCMethod.dart';
import 'package:first/tools/webserve/LCWebRequstManager.dart';
import 'package:first/widgets/base/LCLoading.dart';
import 'package:first/widgets/home/HomeHeader.dart';
import 'package:first/widgets/home/HomeHotActivity.dart';
import 'package:first/widgets/home/HomeQuickItems.dart';
import 'package:first/widgets/home/HomeRecommendedActivity.dart';
import 'package:first/widgets/home/HomeSwiper.dart';
import 'package:first/widgets/home/HomeTips.dart';
import 'package:flutter/material.dart';

class LCHomePage extends StatefulWidget {
  LCHomePage({Key key}) : super(key: key);

  @override
  _LCHomePageState createState() => _LCHomePageState();
}

class _LCHomePageState extends State<LCHomePage> {
  // RefreshController _refresh = RefreshController(initialRefresh: false);
  HomeModel model = HomeModel();
  bool isRequest = false;

  @override
  void initState() {
    super.initState();
    isRequest = true;
    print("init  LCHomePage");
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose  LCHomePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("首页")),
        body: isRequest
            ? LCLoading()
            : ListView(
          children: <Widget>[
            HomeHeader(model: model),
            HomeQuickItems(model: model),
            HomeTips(model: model),
            HomeSwiper(model: model),
            HomeHotActivity(model: model),
            HomeRecommendedActivity(model: model),
          ],
        ));
  }

  // 网络请求
  getData() async {
    await Future.delayed(Duration(seconds: 1));

    LCWebRequstManager().request<HomeModel>(LCMethod.GET, RequestApi.newslist,
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;
        model = result;
      });
      // _refresh.refreshCompleted();
    }, error: (emsg) {
      // _refresh.refreshCompleted();
    });
  }
}
