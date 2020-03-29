import 'package:flutter/material.dart';

class LCStack extends StatelessWidget {
  const LCStack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("Stack")),
      body: Center(
          child: Column(
              // color: Colors.greenAccent,
              // width: 250,
              // height: 250,
              children: [
            Container(
              height: 200,
              child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text("I am center"),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Image.asset(
                    "assets/images/tabbar-home.png",
                    width: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            ),
            Container(
                            height: 200,

              child: Stack(
              children: <Widget>[
                Image.network(
                    "http://a.hiphotos.baidu.com/image/h%3D300/sign=ca66f12cffd3572c79e29adcba116352/3b87e950352ac65cd08fc0b6f6f2b21192138a69.jpg"),
                new Positioned(
                    top: 20.0,
                    left: 10.0,
                    right: 0.0,
                    bottom: 30.0,
                    child: new Text(
                      "Positioned",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    )),
              ],
            ),
            )
          ])),
    ));
  }
}
