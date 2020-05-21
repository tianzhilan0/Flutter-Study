import 'dart:async';

import 'package:flutter/material.dart';

class LCStream extends StatefulWidget {
  LCStream({Key key}) : super(key: key);

  @override
  _LCStreamState createState() => _LCStreamState();
}

class _LCStreamState extends State<LCStream> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Stream"),
            ),
            body: Column(
              children: <Widget>[
                LCStreamOnce(),
                LCStreamMore(),
                LCStreamBuilder()
              ],
            )));
  }
}

//单订阅
class LCStreamOnce extends StatefulWidget {
  LCStreamOnce({Key key}) : super(key: key);

  @override
  _LCStreamOnceState createState() => _LCStreamOnceState();
}

class _LCStreamOnceState extends State<LCStreamOnce> {
  // 创建单订阅类型 `StreamController`
  StreamController _controller = StreamController();
  Sink _sink;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    // _sink 用于添加数据
    _sink = _controller.sink;
    _sink.add('A');
    // _controller.stream 会返回一个单订阅 stream，
    // 通过 listen 返回 StreamSubscription，用于操作流的监听操作
    _subscription = _controller.stream.listen((data) {
      print('Listener1: $data');
    });

    // _subscription = _controller.stream.listen((data) {
    //   print('Listener2: $data');
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // 最后要释放资源...
    _sink.close();
    _controller.close();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      color: Colors.orange,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: FlatButton(
          onPressed: () {
            // 添加数据，stream 会通过 `listen` 方法打印
            _sink.add('A');
            _subscription.pause(); // 暂停监听

            _sink.add(11);
            _sink.add(11.16);
            _subscription.resume(); // 恢复监听

            _sink.add([1, 2, 3]);
            _sink.add({'a': 1, 'b': 2});
          },
          child: Text('单订阅')),
    );
  }
}

//多订阅
class LCStreamMore extends StatefulWidget {
  LCStreamMore({Key key}) : super(key: key);

  @override
  _LCStreamMoreState createState() => _LCStreamMoreState();
}

class _LCStreamMoreState extends State<LCStreamMore> {
  // 创建多订阅类型 `StreamController`
  StreamController _controller = StreamController.broadcast();
  Sink _sink;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    // _sink 用于添加数据
    _sink = _controller.sink;
    _sink.add('A');
    // _controller.stream 会返回一个单订阅 stream，
    // 通过 listen 返回 StreamSubscription，用于操作流的监听操作
    _subscription = _controller.stream.listen((data) {
      print('Listener1: $data');
    });

    _subscription = _controller.stream.listen((data) {
      print('Listener2: $data');
    });

    _subscription = _controller.stream.listen((data) {
      print('Listener3: $data');
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 最后要释放资源...
    _sink.close();
    _controller.close();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      color: Colors.orange,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: FlatButton(
          onPressed: () {
            // 添加数据，stream 会通过 `listen` 方法打印
            _sink.add('A');
            _subscription.pause(); // 暂停监听

            _sink.add(11);
            _sink.add(11.16);
            _subscription.resume(); // 恢复监听

            _sink.add([1, 2, 3]);
            _sink.add({'a': 1, 'b': 2});
          },
          child: Text('多订阅')),
    );
  }
}

class LCStreamBuilder extends StatefulWidget {
  LCStreamBuilder({Key key}) : super(key: key);

  @override
  _LCStreamBuilderState createState() => _LCStreamBuilderState();
}

class _LCStreamBuilderState extends State<LCStreamBuilder> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
              width: 50,
              height: 50,
              color: Colors.orange,
              child: FlatButton(onPressed: () {
                _streamController.sink.add(--_counter);
              }, child: Text('减'))),
          StreamBuilder<int>(
              // 监听Stream，每次值改变的时候，更新Text中的内容
              stream: _streamController.stream,
              initialData: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('${snapshot.data}');
              }),
          Container(
              width: 50,
              height: 50,
              color: Colors.orange,
              child: FlatButton(onPressed: () {
                _streamController.sink.add(++_counter);
              }, child: Text('加')))
        ]));
  }
}