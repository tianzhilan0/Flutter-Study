import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LCToast extends StatelessWidget {
  const LCToast({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Toast")),
        body: Container(
            width: double.maxFinite,
            child: Column(children: [
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("Toast"),
                onPressed: () {
                  showToast();
                },
              ),
            ])));
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "网络连接错误",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }
}
