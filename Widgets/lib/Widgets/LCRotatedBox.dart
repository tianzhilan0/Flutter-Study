import 'package:flutter/material.dart';

class LCRotatedBox extends StatelessWidget {
  const LCRotatedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("RotatedBox")),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //将Transform.rotate换成RotatedBox
              child:

             /* Transform.rotate(
                //旋转90度
                angle:math.pi/2 ,
                  child:RaisedButton(child : Text("Hello world"),onPressed: (){print(" rotate button");})
              ),*/
              RotatedBox(
                quarterTurns: 1, //旋转90度(1/4圈)
                child:RaisedButton(child : Text("Hello world"),onPressed: (){print("button");})
              ),

            ),
            Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
          ],
        ),
      ),
    );
  }
}