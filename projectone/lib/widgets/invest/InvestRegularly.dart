import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InvestRegularly extends StatefulWidget {
  final String imageUrl;
  InvestRegularly({Key key, this.imageUrl}) : super(key: key);

  @override
  _InvestRegularlyState createState() => _InvestRegularlyState();
}

class _InvestRegularlyState extends State<InvestRegularly> {
  String imageUrl;
  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Text(
                    "定期投资",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )))
            ]));
  }
}
