import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class LCSocket extends StatefulWidget {
  LCSocket({Key key}) : super(key: key);

  @override
  _LCSocketState createState() => _LCSocketState();
}

class _LCSocketState extends State<LCSocket> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Socket"),
            ),
            body: Column(children: [])));
  }

  _request() async {
    //建立连接
    var socket = await Socket.connect("baidu.com", 80);
    //根据http协议，发送请求头
    socket.writeln("GET / HTTP/1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:close");
    socket.writeln();
    await socket.flush(); //发送
    //读取返回内容
    // var _response = await socket.transform(utf8.decoder).join();
    await socket.close();
  }
}
