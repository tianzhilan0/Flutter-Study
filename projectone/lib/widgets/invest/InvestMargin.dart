import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InvestMargin extends StatefulWidget {
  final String imageUrl;
  InvestMargin({Key key, this.imageUrl}) : super(key: key);

  @override
  _InvestMarginState createState() => _InvestMarginState();
}

class _InvestMarginState extends State<InvestMargin> {
  String imageUrl;
  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )));
  }
}
