import 'package:flutter/material.dart';

class LCStack extends StatelessWidget {
  const LCStack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Stack")),
        body: Center(
        child: Container(
          color: Colors.greenAccent,
          width: 250,
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Text("I am center"),

              Positioned(
                top: 10,
                right: 10,
                child:Image.asset("images/tabbar-home.png",width: 100,fit: BoxFit.fitWidth,) ,
              ),
            ],
          ),
        )
      ),
      )
    );
  }
}