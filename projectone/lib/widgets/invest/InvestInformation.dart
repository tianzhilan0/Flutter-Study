import 'package:cached_network_image/cached_network_image.dart';
import 'package:first/model/InvestModel.dart';
import 'package:flutter/material.dart';

class InvestInformation extends StatefulWidget {
  final InvestModel model;
  InvestInformation({Key key, this.model}) : super(key: key);

  @override
  _InvestInformationState createState() => _InvestInformationState();
}

class _InvestInformationState extends State<InvestInformation> {
  InvestModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = model.information.map((item) {
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                        child: Text(
                          item["title"],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Text(
                          "${item["user"]} | ${item["date"]}",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ]),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CachedNetworkImage(
                      imageUrl: item["url"],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 20),
        ],
      );
    }).toList();

    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Text(
                      "资讯",
                      style:
                          TextStyle(
                            color: Colors.black87,
                            fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child:Icon(Icons.chevron_right,size: 30,),)
              ]),
              Column(children: items)
            ]));
  }
}
