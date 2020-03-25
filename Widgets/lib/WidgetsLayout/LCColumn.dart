import 'package:flutter/material.dart';

class LCColumn extends StatelessWidget {
  const LCColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text("Column")),
            body: Column(children: [
              Container(
                  color: Colors.grey,
                  height: 300,
                  child: Row(
                      // scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("我是第一个",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red)),
                              Text("我是第二个",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.orangeAccent)),
                              Text("我是第三个",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue)),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("我是第一个",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red)),
                              Text("我是第二个",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.orangeAccent)),
                              Text("我是第三个",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue)),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("我是第一个",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red)),
                              Text("我是第二个",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.orangeAccent)),
                              Text("我是第三个",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue)),
                            ]),
                      ])),
            ])));
  }
}
