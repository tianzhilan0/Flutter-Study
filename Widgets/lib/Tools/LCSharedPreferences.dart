import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LCSharedPreferences extends StatelessWidget {
  const LCSharedPreferences({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SharedPreferences")),
        body: Container(
            width: double.maxFinite,
            child: Column(children: [
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("添加"),
                onPressed: () {
                  addContent();
                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("读取"),
                onPressed: () {
                  readContent();
                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("修改"),
                onPressed: () {
                  changeContent();
                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("移除"),
                onPressed: () {
                  removeContent();
                },
              ),
            ])));
  }

  addContent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", "xiaoming"); //没有该key是添加键值对，有该key时修改对应的值
    sharedPreferences.setString("age", "18");
  }

  readContent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    for (String key in sharedPreferences.getKeys()) {
      debugPrint("所有的key分别为： $key");
    }
    debugPrint("获取存储的值：name= ${sharedPreferences.get("name")}");
    debugPrint("获取存储的值：age= ${sharedPreferences.get("age")}");
  }

  changeContent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("name", "lisi");

    debugPrint("获取修改后存储的值：name= ${sharedPreferences.get("name")}");
  }

  removeContent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove("name"); //清除指定key
    debugPrint("获取删除后的值：name= ${sharedPreferences.get("name")}");

    sharedPreferences.clear(); //清除所有
    debugPrint("获取清除所有后的值：name= ${sharedPreferences.get("name")}");
  }
}
