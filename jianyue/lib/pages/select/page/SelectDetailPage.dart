import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/manager/LCApi.dart';
import 'package:jianyue/pages/home/model/HomeArticleModel.dart';
import 'package:jianyue/pages/home/view/HomeArticleItem.dart';
import 'package:jianyue/pages/select/model/SelectDetailModel.dart';
import 'package:jianyue/pages/select/view/SelectDetailHeader.dart';
import 'package:jianyue/tool/LCLoading.dart';
import 'package:jianyue/tool/webserve/LCMethod.dart';
import 'package:jianyue/tool/webserve/LCWebRequstManager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SelectDetailPage extends StatefulWidget {
  final Map<String, dynamic> arguments;
  SelectDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _SelectDetailPageState createState() => _SelectDetailPageState();
}

class _SelectDetailPageState extends State<SelectDetailPage> {
  String _slug;
  String _title;
  bool isRequest = false;
  SelectDetailModel model = SelectDetailModel();
  List<HomeArticleModel> _datas = List();
  RefreshController _refresh = RefreshController(initialRefresh: false);
  int _page = 1;
  int _type = 2;

  @override
  void initState() {
    super.initState();
    isRequest = true;
    _slug = widget.arguments["slug"];
    _title = widget.arguments["title"];

    getData();
  }

  Future getData() async {
    Future.wait([getDetail(), getDetailCommentList(_page,_type)]);
  }

  // 获取详情
  Future getDetail() async {
    LCWebRequstManager().requestModel<SelectDetailModel>(
        LCMethod.GET, LCApi.selectDetail + _slug, {}, success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;
        model = result;
      });
    }, error: (emsg) {});
  }

  // 最新评论
  Future getDetailCommentList(int page, int type) async {
    String orderBy = 'commented_at';
    if (type == 1) {
      orderBy = 'added_at';
    } else if (type == 2) {
      orderBy = 'commented_at';
    } else {
      orderBy = 'top';
    }
    String url = LCApi.selectDetailCommentList +
        _slug +
        '/public_notes?page=' +
        '$page' +
        '&count=10&order_by=' +
        orderBy;
    LCWebRequstManager().requestArray<HomeArticleModel>(LCMethod.GET, url, {},
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;

        if (page == 1) {
          _datas = result;
        } else {
          _datas.addAll(result);
        }
      });
      _refresh.loadComplete();
      if (result.length < 10) {
        _refresh.loadNoData();
      }
    }, error: (emsg) {
      _refresh.loadComplete();
    });
  }

  // 上拉加载更多
  onLoading() {
    _page++;
    getDetailCommentList(_page,_type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: isRequest
            ? LCLoading()
            : SmartRefresher(
                controller: _refresh,
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
                enablePullDown: false,
                enablePullUp: true,
                onLoading: onLoading,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(children: [
                        SelectDetailHeader(
                          model: model,
                          onChanged: selectHeader,
                        )
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
                )));
  }

  //选择标题
  selectHeader(int id) {
    if (_type == id) {
      return;
    }
    _type = id;
    _page = 1;
    _datas.clear();
    _refresh.resetNoData();
    getDetailCommentList(_page,_type);
  }

  //进入文章详情
  void jumpToDetail(String slug, int id) {
    Navigator.of(context).pushNamed("/newsDeatil", arguments: {
      "slug": slug,
      "id": id,
    });
  }
}
