import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LCThread extends StatefulWidget {
  LCThread({Key key}) : super(key: key);

  @override
  _LCThreadState createState() => _LCThreadState();
}

class _LCThreadState extends State<LCThread> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("async/await"),
              onPressed: () {
                // dataReqeust();
                // loadData();
                loadData3();
              })
        ],
      ),
    );
  }

  Future<Response> dataReqeust() async {
    String requestURL = 'https://jsonplaceholder.typicode.com/posts';
    Client client = Client();
    Future<Response> response = client.get(requestURL);
    return response;
  }

  Future<String> loadData() async {
    Response response = await dataReqeust();
    return response.body;
  }

  loadData2() {
    Future.delayed(Duration(seconds: 1), () {
      int age = 18;
      return age;
    }).then((onValue) {
      onValue++;
      print('age $onValue');
    }).catchError((error) {
      print('报错');
    }).whenComplete(() {
      print('完成');
    });
  }

  loadData3() async {
    // 通过spawn新建一个isolate，并绑定静态方法
    ReceivePort receivePort = ReceivePort();
    print("1");
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    print("2");

    // 获取新isolate的监听port
    SendPort sendPort = await receivePort.first;
    print("3");

    // 调用sendReceive自定义方法
    List dataList = await sendReceive(
        sendPort, 'https://jsonplaceholder.typicode.com/posts');
    print("4");

    // print('dataList $dataList');
  }

// isolate的绑定方法
  static dataLoader(SendPort sendPort) async {
    // 创建监听port，并将sendPort传给外界用来调用
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    print("5");

    // 监听外界调用
    await for (var msg in receivePort) {
      print("6");

      String requestURL = msg[0];
      SendPort callbackPort = msg[1];

      Client client = Client();
      print("7");

      Response response = await client.get(requestURL);
      print("8");

      List dataList = json.decode(response.body);
      // 回调返回值给调用者
      callbackPort.send(dataList);
    }
  }

// 创建自己的监听port，并且向新isolate发送消息
  Future sendReceive(SendPort sendPort, String url) {
    print("9");

    ReceivePort receivePort = ReceivePort();
        print("10");

    sendPort.send([url, receivePort.sendPort]);
        print("11");

    // 接收到返回值，返回给调用者
    return receivePort.first;
  }
}
