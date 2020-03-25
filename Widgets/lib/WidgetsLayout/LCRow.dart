import 'package:flutter/material.dart';

class LCRow extends StatelessWidget {
  const LCRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Row")),
        body: ListView(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.orangeAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        ),Row(
              mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.orangeAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        ),Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.orangeAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.orangeAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.orangeAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        ),
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("我是第一个", style: TextStyle(fontSize: 20, color: Colors.red)),
            Text("我是第二个", style: TextStyle(fontSize: 20, color: Colors.orangeAccent)),
            Text("我是第三个", style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]
        )
          ]
        )
      ),
    );
  }
}