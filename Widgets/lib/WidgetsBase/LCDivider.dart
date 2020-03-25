import 'package:flutter/material.dart';

class LCDivider extends StatefulWidget {
  LCDivider({Key key}) : super(key: key);

  @override
  _LCDividerState createState() => _LCDividerState();
}

class _LCDividerState extends State<LCDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("Divider")),
      body: ListView(children: [
        Divider(),
        SizedBox(height: 20),
        Divider(height: 10),
        SizedBox(height: 20),
        Divider(height: 2, thickness: 10),
        SizedBox(height: 20),
        Divider(
          height: 10,
          indent: 100,
        ),
        SizedBox(height: 20),
        Divider(
          height: 10,
          endIndent: 100,
        ),
        SizedBox(height: 20),
        Container(
          color: Colors.red,
          child: Divider(
            height: 10,
          ),
        )
      ]),
    ));
  }
}
