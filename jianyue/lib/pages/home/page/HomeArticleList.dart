import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/manager/LCApi.dart';
import 'package:jianyue/pages/home/model/HomeArticleModel.dart';
import 'package:jianyue/pages/home/view/HomeArticleItem.dart';
import 'package:jianyue/tool/webserve/LCMethod.dart';
import 'package:jianyue/tool/webserve/LCWebRequstManager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeArticleList extends StatefulWidget {
  HomeArticleList({Key key}) : super(key: key);

  @override
  _HomeArticleListState createState() => _HomeArticleListState();
}

class _HomeArticleListState extends State<HomeArticleList>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refresh = RefreshController(initialRefresh: false);
  List<HomeArticleModel> datas = List();

  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  // 刷新
  onRefresh() async {
    LCWebRequstManager().requestArray<HomeArticleModel>(
        LCMethod.GET, LCApi.articlelist, {}, success: (result) {
      print("========> 结束 <========");
      setState(() {
        datas = result;
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
  onLoading() async {
    LCWebRequstManager().requestArray<HomeArticleModel>(
        LCMethod.GET, LCApi.articlelist, {}, success: (result) {
      print("========> 结束 <========");
      setState(() {
        datas.addAll(result);
      });
      _refresh.loadComplete();
      if (result.length < 15) {
        _refresh.loadNoData();
      }
    }, error: (emsg) {
      _refresh.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
print('HomeArticleList  build...');
    return Container(
        child: SmartRefresher(
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
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (conText, i) {
                return HomeArticleItem(model: datas[i], ontap: (model){
                  jumpToDetail(model.slug,model.id);
                },);
              },
            )));
  }

  //进入文章详情
  void jumpToDetail(String slug,int id){
    Navigator.of(context).pushNamed("/newsDeatil", arguments: {
      "slug": slug,
      "id": id,
    });
  }
}
