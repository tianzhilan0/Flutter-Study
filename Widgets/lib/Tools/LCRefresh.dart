import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class LCRefresh extends StatefulWidget {
  LCRefresh({Key key}) : super(key: key);

  @override
  _LCRefreshState createState() => _LCRefreshState();
}

class _LCRefreshState extends State<LCRefresh> {
  EasyRefreshController _controller = EasyRefreshController();

  int count = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refresh'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                // _controller.callRefresh();
                _controller.callLoad();
              },
              icon: Icon(Icons.refresh),
              label: Text("刷新"))
        ],
      ),
      body: EasyRefresh(
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        controller: _controller,
        child: ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              return Text(
                "我是 第 $index 个 Item",
                style: TextStyle(fontSize: 24),
              );
            }),
        onLoad: () async {
          onLoad();
        },
        onRefresh: () async {
          onRefresh();
        },
      ),
    );
  }

  onRefresh() {
    Future.delayed(Duration(seconds: 2), () {
      _controller.finishRefresh(success: true);
      print('延时2s执行');
      setState(() {
        count = 30;
      });
    });
  }

  onLoad() {
    Future.delayed(Duration(seconds: 2), () {
      _controller.finishLoad(success: true, noMore: false);
      print('延时2s执行');
      setState(() {
        count = count + 10;
      });
    });
  }
}
