import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LCFont extends StatefulWidget {
  LCFont({Key key}) : super(key: key);

  @override
  _LCFontState createState() => _LCFontState();
}

class _LCFontState extends State<LCFont> {
  @override
  Widget build(BuildContext context) {

    readFont("assets/fonts/webfont.ttf");

    return Scaffold(
      appBar: AppBar(title: Text("自定义字体")),
      body: Column(
        children: [
            Text("说金钱是罪恶，都在捞;说美女是祸水，都想要;说高处不胜寒，都在爬;说烟酒伤身体，都不戒;说天堂最美好，都不去!",
            style: TextStyle(
              fontFamily: "webfont",
            ),)
        ]
      ),
    );
  }

  Future<void> readFont(String path) async {
    var fontLoader = FontLoader("webfont");
    fontLoader.addFont(getCustomFont(path));
    await fontLoader.load();
  }

  Future<ByteData> getCustomFont(String path) async {
    ByteData byteData = await rootBundle.load(path);
    return byteData;
  }
}