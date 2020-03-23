import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LifeFooter extends StatefulWidget {
  LifeFooter({Key key}) : super(key: key);

  @override
  _LifeFooterState createState() => _LifeFooterState();
}

class _LifeFooterState extends State<LifeFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text("服务精选",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: CachedNetworkImage(
                        imageUrl: "http://api.oyear.cn/nonghang/life/life6.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ))),
              SizedBox(width: 20),
              Expanded(
                  flex: 1,
                  child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: CachedNetworkImage(
                        imageUrl: "http://api.oyear.cn/nonghang/life/life6.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )))
            ]),
          ),
          AspectRatio(
                      aspectRatio: 3,
                      child: CachedNetworkImage(
                        imageUrl: "http://api.oyear.cn/nonghang/life/life6.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ))
        ],
      ),
    );
  }
}
