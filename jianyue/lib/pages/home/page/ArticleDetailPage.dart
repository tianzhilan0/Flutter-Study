import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jianyue/commom/LCMedia.dart';
import 'package:jianyue/manager/LCApi.dart';
import 'package:jianyue/pages/home/model/ArticleDetailCommentModel.dart';
import 'package:jianyue/pages/home/model/ArticleDetailModel.dart';
import 'package:jianyue/pages/home/view/ArticleDetailHeader.dart';
import 'package:jianyue/pages/home/view/ArticleDetailMiddle.dart';
import 'package:jianyue/tool/LCLoading.dart';
import 'package:jianyue/tool/webserve/LCMethod.dart';
import 'package:jianyue/tool/webserve/LCWebRequstManager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleDetailPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  ArticleDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  String _slug;
  int _id;
  ArticleDetailModel model = ArticleDetailModel();
  List<ArticleDetailCommentModel> commentModels = List();
  bool isRequest = false;
  RefreshController _refresh = RefreshController(initialRefresh: false);
  int _page = 1;

  @override
  void initState() {
    super.initState();
    isRequest = true;
    _slug = widget.arguments["slug"];
    _id = widget.arguments["id"];
    getDatas();
  }

  // 网络请求
  Future getDatas() async {
    return Future.wait([getDetail(), getComment(1)]);
  }

  // 获取详情
  Future getDetail() async {
    LCWebRequstManager().requestModel<ArticleDetailModel>(
        LCMethod.GET, LCApi.articleDetail + _slug, {}, success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;
        model = result;
        model.freecontent = model.freecontent
            .replaceAll("//upload-images", "https://upload-images");
        model.freecontent =
            model.freecontent.replaceAll("data-original-src=", "src=");
        model.firstsharedat = formatDate(DateTime.parse(model.firstsharedat),
            [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn]);
      });
    }, error: (emsg) {});
  }

  //获取评论
  Future getComment(int page) async {
    String url = LCApi.articleDetailComment +
        "$_id" +
        "/comments?page=" +
        "$page" +
        "&count=10&author_only=false&order_by=desc";
    LCWebRequstManager().requestModel<ArticleDetailCommentModels>(
        LCMethod.GET, url, {}, success: (result) {
      print("========> 结束 <========");

      setState(() {
        isRequest = false;
        if (page == 1) {
          commentModels = result.comments;
        } else {
          commentModels.addAll(result.comments);
        }
        print(commentModels.length);
      });
      _refresh.loadComplete();
      if (result.comments.length < 10) {
        _refresh.loadNoData();
      }
    }, error: (emsg) {});
  }

  onLoading() {
    _page++;
    getComment(_page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情")),
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
                      ArticleDetailHeader(
                        model: model,
                      ),
                      Html(
                          data: model.freecontent,
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 10)),
                      ArticleDetailMiddle(model: model),
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(commentItem,
                        childCount: commentModels.length),
                  )
                ],
              )),
    );
  }

  Widget commentItem(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                width: 30,
                height: 30,
                child: ClipOval(
                    child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: commentModels[index].user.avatar,
                )),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  commentModels[index].user.nickname,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Container(
                    width: winWidth(context) - 30 - 10 - 20,
                    child: Html(
                        padding: EdgeInsets.fromLTRB(0, 5, 10, 10),
                        data: commentModels[index].compiledcontent)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        "${commentModels[index].floor} 楼  ${commentModels[index].createdat}"),
                  ],
                )
              ])
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
