import 'package:flutter/material.dart';
import 'package:nonghang/manager/LCApi.dart';
import 'package:nonghang/model/HomeModel.dart';
import 'package:nonghang/tool/LCLoading.dart';
import 'package:nonghang/tool/webserve/LCMethod.dart';
import 'package:nonghang/tool/webserve/LCWebRequstManager.dart';
import 'package:nonghang/widget/home/HomeHeader.dart';
import 'package:nonghang/widget/home/HomeHotActivity.dart';
import 'package:nonghang/widget/home/HomeQuickItems.dart';
import 'package:nonghang/widget/home/HomeRecommendedActivity.dart';
import 'package:nonghang/widget/home/HomeSwiper.dart';
import 'package:nonghang/widget/home/HomeTips.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refresh = RefreshController(initialRefresh: false);
  HomeModel model = HomeModel();
  bool isRequest = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    isRequest = true;
    print("=========> homepage initState <=========");
    getData();
  }

  // 网络请求
  getData() async {
    await Future.delayed(Duration(seconds: 1));

    LCWebRequstManager().request<HomeModel>(LCMethod.GET, LCApi.newslist, {},
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;
        model = result;
      });
      _refresh.refreshCompleted();
    }, error: (emsg) {
      _refresh.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        backgroundColor: Colors.white,
        body: isRequest
            ? LCLoading()
            : SmartRefresher(
                controller: _refresh,
                enablePullDown: true,
                onRefresh: getData,
                child: ListView(
                  children: <Widget>[
                    HomeHeader(model: model),
                    HomeQuickItems(model: model),
                    HomeTips(model: model),
                    HomeSwiper(model: model),
                    HomeHotActivity(model: model),
                    HomeRecommendedActivity(model: model),
                  ],
                )),
      ),
    );
  }
}
