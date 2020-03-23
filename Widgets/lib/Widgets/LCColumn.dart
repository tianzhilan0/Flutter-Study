import 'package:flutter/material.dart';

class LCColumn extends StatelessWidget {
  const LCColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Column")),
        body: Column(
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.yellowAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        )
      ),
    );
  }
}