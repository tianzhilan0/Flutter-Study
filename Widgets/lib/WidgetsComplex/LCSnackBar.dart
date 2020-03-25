import 'package:flutter/material.dart';

class LCSnackBar extends StatefulWidget {
  LCSnackBar({Key key}) : super(key: key);

  @override
  _LCSnackBarState createState() => _LCSnackBarState();
}

class _LCSnackBarState extends State<LCSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("SnackBar"),
            ),
            body: Column(children: [
              
              SnackButton()
            ])));
  }
}


class SnackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Open SnackBar'),
      onPressed: (){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Processing...'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: (){
                
              },
            ),
          )
        );
      },
    );
  }
}