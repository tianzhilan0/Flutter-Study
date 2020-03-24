
import 'package:flutter/material.dart';

class LCImage extends StatefulWidget {
  LCImage({Key key}) : super(key: key);

  @override
  _LCImageState createState() => _LCImageState();
}

class _LCImageState extends State<LCImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Image")),
          body: Column(children: [
            Image.network(
              "http://img2018.cnblogs.com/news/66372/201809/66372-20180921155512352-228425089.jpg",
              // color: Colors.blue,
              //  colorBlendMode: BlendMode.screen,
              width: 400,
              height: 400,
              fit: BoxFit.contain,
              // repeat: ImageRepeat.repeat, //设置图片重复填充方式

              // centerSlice: Rect.fromLTWH(10, 10, 10, 10),
            ),
            Center(
                child: Image.asset(
              "images/tabbar-home.png",
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            )),

            //  Image.file(File("/sdcard/flutter.jpeg"))
          ])),
    );
  }
}
