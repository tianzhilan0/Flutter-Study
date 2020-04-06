import 'package:first/config/RequestApi.dart';
import 'package:first/model/HomeModel.dart';
import 'package:first/tools/webserve/LCMethod.dart';
import 'package:first/tools/webserve/LCWebRequstManager.dart';
import 'package:first/widgets/base/LCAppBar.dart';
import 'package:first/widgets/base/LCLoading.dart';
import 'package:first/widgets/home/HomeHeader.dart';
import 'package:first/widgets/home/HomeHotActivity.dart';
import 'package:first/widgets/home/HomeQuickItems.dart';
import 'package:first/widgets/home/HomeRecommendedActivity.dart';
import 'package:first/widgets/home/HomeSwiper.dart';
import 'package:first/widgets/home/HomeTips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class LCHomePage extends StatefulWidget {
  LCHomePage({Key key}) : super(key: key);

  @override
  _LCHomePageState createState() => _LCHomePageState();
}

class _LCHomePageState extends State<LCHomePage> {
  EasyRefreshController _controller = EasyRefreshController();
  ScrollController _scrollController = ScrollController();
  HomeModel model = HomeModel();
  bool isRequest = false;
  double _appBarAlpha = 0.0;

  @override
  void initState() {
    super.initState();
    isRequest = true;
    print("init  LCHomePage");
    getData(true);
    _scrollController.addListener(() {
      // print(_scrollController.offset);
      if (_scrollController.offset >= 0 &&
          _scrollController.offset <=
              MediaQuery.of(context).size.width * 3 / 5) {
        // print("appBarAlpha == $_appBarAlpha");
        double alpha = _scrollController.offset /
            (MediaQuery.of(context).size.width * 3 / 5);
        String number = alpha.toStringAsFixed(2);
        setState(() {
          _appBarAlpha = double.parse(number);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose  LCHomePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isRequest ? LCLoading(): Stack(children: [
        ListView(controller: _scrollController, children: <Widget>[
          HomeHeader(model: model),
          HomeQuickItems(model: model),
          HomeTips(model: model),
          HomeSwiper(model: model),
          HomeHotActivity(model: model),
          HomeRecommendedActivity(model: model),
          Container(height: 200, color: Colors.red),
          Container(height: 200, color: Colors.orange),
          Container(height: 200, color: Colors.brown),
          Container(height: 200, color: Colors.blue),
          Container(height: 200, color: Colors.red),
          Container(height: 200, color: Colors.orange),
          Container(height: 200, color: Colors.brown),
          Container(height: 200, color: Colors.blue)
        ]),
        Positioned(
            child: LCAppBar(
          appBarAlpha: _appBarAlpha,
          leftAction: clickLeftAction,
        )),
      ]),
    );
  }

  // 网络请求
  void getData(bool isRefresh) async {
    await Future.delayed(Duration(seconds: 1));

    LCWebRequstManager().request<HomeModel>(LCMethod.GET, RequestApi.newslist,
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;
        model = result;
      });
      if (isRefresh) {
        _controller.finishRefresh(success: true);
      } else {
        _controller.finishLoad(success: true, noMore: true);
      }
    }, error: (emsg) {
      // _refresh.refreshCompleted();
    });
  }

  //左侧按钮
  void clickLeftAction() {
    print("左侧按钮");
  }
}
