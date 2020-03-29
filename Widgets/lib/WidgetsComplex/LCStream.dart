import 'dart:async';

import 'package:flutter/material.dart';

class LCStream extends StatefulWidget {
  LCStream({Key key}) : super(key: key);

  @override
  _LCStreamState createState() => _LCStreamState();
}

class _LCStreamState extends State<LCStream> {
  StreamModel streamModel;

  @override
  void initState() {
    super.initState();
    streamModel = StreamModel();
  }

  @override
  void dispose() {
    super.dispose();
    streamModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("数据"),
          onPressed: () {
            streamModel.getBookList();
          }),
      body: StreamBuilder<List<String>>(
        stream: streamModel.stream, // 要监听的流
        initialData: [], // 初始值，可以不设
        builder: (context, a) {
          // sink.add 后，就会回调这个方法。
          List<Widget> views = [];
          if (a.data != null && a.data.length > 0) {
            a.data.forEach((String data) {
              views.add(Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      data,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ));
            });
          }
          return ListView(
            children: views,
          );
        },
      ),
    ));
  }
}

class StreamModel {
  StreamController _controller;

  StreamSink<List<String>> _sink;

  Stream<List<String>> stream;

  StreamModel() {
    // 构造方法中初始化流相关的对象
    _controller = StreamController<List<String>>.broadcast();
    _sink = _controller.sink;
    stream = _controller.stream;
  }

  /// 获取书本列表
  getBookList() async {
    _sink.add(["111", "222", "333", "444"]);
  }

  /// 资源
  dispose() {
    _sink.close();
    _controller.close();
  }
}
