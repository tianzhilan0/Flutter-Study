import 'dart:convert';

import 'package:flutter/material.dart';

class LCJson extends StatefulWidget {
  LCJson({Key key}) : super(key: key);

  @override
  _LCJsonState createState() => _LCJsonState();
}

class _LCJsonState extends State<LCJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("JSON解析")),
        body: Container(
            width: double.maxFinite,
            child: Column(children: [
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("Map解析"),
                onPressed: () {
                  json1();
                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("对象解析"),
                onPressed: () {
                  json2();
                },
              )
            ])));
  }

  json1() {
    String data =
        '{"userId": 1,"id": 1,"title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipitsuscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"}';
    final responseJson = json.decode(data.toString());
    Map<String, dynamic> newTitle = responseJson;
    print(newTitle['title']);
  }

  json2() {
    String data =
        '{"userId": 1,"id": 1,"title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipitsuscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"}';

    final responseJson = json.decode(data);
    print(responseJson.toString());
    Post postBean = Post.fromJson(responseJson);
    print(postBean.userId);
    print(postBean.title);
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        id = json["id"],
        title = json["title"],
        body = json["body"];

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'id': id, 'title': title, 'body': body};
}
