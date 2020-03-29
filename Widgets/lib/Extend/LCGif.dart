import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LCGif extends StatefulWidget {
  LCGif({Key key}) : super(key: key);

  @override
  _LCGifState createState() => _LCGifState();
}

class _LCGifState extends State<LCGif> {
  @override
  Widget build(BuildContext context) {
    String avatar = "https://imgconvert.csdnimg.cn/aHR0cHM6Ly91c2VyLWdvbGQtY2RuLnhpdHUuaW8vMjAyMC8xLzkvMTZmODlhNGVhMzBlNjQ5Mg?x-oss-process=image/format,png";
    return Scaffold(
      appBar: AppBar(title: Text("gif")),
      body: Column(children: [
        CachedNetworkImage(
            imageUrl: avatar ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(),
                  ),
                ),
            // errorWidget: (context, url, error) =>
            //     Image(image: AssetImage('assets/images/ic_default_head.jpg'))
            )
      ]),
    );
  }
}
