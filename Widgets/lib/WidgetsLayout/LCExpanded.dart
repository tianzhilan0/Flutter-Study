import 'package:flutter/material.dart';

class LCExpanded extends StatefulWidget {
  LCExpanded({Key key}) : super(key: key);

  @override
  _LCExpandedState createState() => _LCExpandedState();
}

class _LCExpandedState extends State<LCExpanded> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text("Expanded")),
            body: Column(
              children: <Widget>[
                Row(children: [
                  Expanded(
                    flex: 1,
                      child: RaisedButton(
                        color: Colors.orangeAccent,
                          child: Text("Expanded"), onPressed: (){})),
                  Expanded(
                    flex: 2,
                      child: RaisedButton(
                        color: Colors.red,
                          child: Text("Expanded"), onPressed: (){}))
                ]),
                Row(children: [
                  Flexible(
                    flex: 2,
                      child: RaisedButton(
                        color: Colors.orangeAccent,
                          child: Text("Expanded"), onPressed: (){})),
                  Flexible(
                    flex: 1,
                      child: RaisedButton(
                        color: Colors.red,
                          child: Text("Expanded"), onPressed: (){}))
                ]),
                Container(
                  width: 300,
                  child: Row(children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                      child: RaisedButton(
                        color: Colors.orangeAccent,
                          child: Text("Expanded"), onPressed: (){})),
                  Flexible(
                    flex: 1,
                      child: RaisedButton(
                        color: Colors.red,
                          child: Text("Expanded"), onPressed: (){}))
                ])
                )
              ],
            )));
  }
}
