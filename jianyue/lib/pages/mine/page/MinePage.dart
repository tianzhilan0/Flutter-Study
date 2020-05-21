import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/commom/AppConfig.dart';
import 'package:jianyue/commom/LoginProvider.dart';
import 'package:jianyue/manager/LCApi.dart';
import 'package:jianyue/manager/LCStorageManager.dart';
import 'package:jianyue/pages/home/model/HomeArticleModel.dart';
import 'package:jianyue/pages/home/view/HomeArticleItem.dart';
import 'package:jianyue/pages/mine/model/UserDetailModel.dart';
import 'package:jianyue/pages/mine/view/MineHeader.dart';
import 'package:jianyue/pages/mine/view/MineNaviBar.dart';
import 'package:jianyue/tool/LCLoading.dart';
import 'package:jianyue/tool/webserve/LCMethod.dart';
import 'package:jianyue/tool/webserve/LCWebRequstManager.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();
  bool _isRequest = false;
  double _appBarAlpha = 0.0;
  UserDetailModel model = UserDetailModel();
  RefreshController _refresh = RefreshController(initialRefresh: false);
  List<HomeArticleModel> _datas = List();
  int page = 1;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _isRequest = true;

    _scrollController.addListener(() {
      if (_scrollController.offset >= 0 && _scrollController.offset <= 48) {
        double alpha = _scrollController.offset / 48;
        setState(() {
          _appBarAlpha = alpha;
          print(alpha);
        });
      }
    });
    getData();
  }

  getData() async {
    Future.wait([getUserDetail(), onRefresh()]);
  }

  //获取个人详情
  Future getUserDetail() async {
    LCWebRequstManager().requestModel<UserDetailModel>(
        LCMethod.GET, LCApi.userDetail + '34c6a68519b9', {}, success: (result) {
      print("========> 结束 <========");
      setState(() {
        _isRequest = false;
        model = result;
      });
      // _refresh.refreshCompleted();
      // if (_refresh.footerMode.value == LoadStatus.noMore) {
      //   _refresh.resetNoData();
      // }
    }, error: (emsg) {
      // _refresh.refreshCompleted();
    });
  }

  // 刷新
  Future onRefresh() async {
    _refresh.resetNoData();
    page = 1;
    String url = LCApi.userDetail +
        '34c6a68519b9' +
        '/public_notes?page=' +
        '$page' +
        '&count=10&order_by=shared_at';
    LCWebRequstManager().requestArray<HomeArticleModel>(LCMethod.GET, url, {},
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        _datas = result;
      });
      _refresh.refreshCompleted();
      if (_refresh.footerMode.value == LoadStatus.noMore) {
        _refresh.resetNoData();
      }
    }, error: (emsg) {
      _refresh.refreshCompleted();
    });
  }

  // 加载更多
  Future onLoading() async {
    page = page + 1;
    String url = LCApi.userDetail +
        '34c6a68519b9' +
        '/public_notes?page=' +
        '$page' +
        '&count=10&order_by=shared_at';
    LCWebRequstManager().requestArray<HomeArticleModel>(LCMethod.GET, url, {},
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        _datas.addAll(result);
      });
      _refresh.loadComplete();
      if (result.length < 10) {
        _refresh.loadNoData();
      }
    }, error: (emsg) {
      _refresh.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      // appBar: AppBar(),
      body: _isRequest
          ? LCLoading()
          : Stack(children: [
              SmartRefresher(
                  controller: _refresh,
                  header: CustomHeader(builder: (context, RefreshStatus mode) {
                    Widget body;
                    if (mode == RefreshStatus.idle) {
                      body = Text("下拉刷新");
                    } else if (mode == RefreshStatus.canRefresh) {
                      body = Text("松开手刷新");
                    } else if (mode == RefreshStatus.refreshing) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == RefreshStatus.failed) {
                      body = Text("刷新失败");
                    } else if (mode == RefreshStatus.completed) {
                      body = Text("刷新完成");
                    } else {
                      // body = Text("松手! 加载更多数据");
                    }
                    return Container(
                      height: 45.0,
                      child: Center(child: body),
                    );
                  }),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = Text("上拉加载更多数据");
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text("松手! 加载更多数据");
                      } else if (mode == LoadStatus.loading) {
                        body = CupertinoActivityIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text("加载失败! 点击重试!");
                      } else if (mode == LoadStatus.noMore) {
                        body = Text("没有更多数据了！！！");
                      } else {
                        // body = Text("松手! 加载更多数据");
                      }
                      return Container(
                        height: 45.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: onRefresh,
                  onLoading: onLoading,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(children: [
                          Mineheader(model: model),
                        ]),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return HomeArticleItem(
                            model: _datas[index],
                            ontap: (model) {
                              jumpToDetail(model.slug, model.id);
                            },
                          );
                        }, childCount: _datas.length),
                      )
                    ],
                  )),
              Positioned(
                  child: MineNaviBar(
                stateColor: Colors.white,
                appBarAlpha: _appBarAlpha,
                leftAction: clickLeftAction,
                rightAction: clickRightAction,
              )),
            ]),
    );
  }

  //左侧按钮
  void clickLeftAction() {
    print("左侧按钮");
  }
  
  //右侧按钮
  void clickRightAction() {
    print("右侧按钮");
    Provider.of<LoginProvider>(context, listen: false).logout();
    LCStorageManager().setValue(AppConfig.sp_isLogin, "0");
  }

  //进入文章详情
  void jumpToDetail(String slug, int id) {
    Navigator.of(context).pushNamed("/newsDeatil", arguments: {
      "slug": slug,
      "id": id,
    });
  }
}
