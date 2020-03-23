import 'package:flutter/material.dart';

class LCFlex extends StatelessWidget {
  const LCFlex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("Flex")),
          body: Container(
            width: 375,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RaisedButton(
                    child: new Text("One"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                            color: Color(0xFFFFFFFF),
                            style: BorderStyle.solid,
                            width: 2)),
                    onPressed: () {},
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: RaisedButton(
                    child: new Text("Two"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                            color: Color(0xFFFFFFFF),
                            style: BorderStyle.solid,
                            width: 2)),
                    onPressed: () {},
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: RaisedButton(
                    child: new Text("Three"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                            color: Color(0xFFFFFFFF),
                            style: BorderStyle.solid,
                            width: 2)),
                    onPressed: () {},
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: RaisedButton(
                    child: new Text("Four"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                            color: Color(0xFFFFFFFF),
                            style: BorderStyle.solid,
                            width: 2)),
                    onPressed: () {},
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: RaisedButton(
                    child: new Text("Five"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                            color: Color(0xFFFFFFFF),
                            style: BorderStyle.solid,
                            width: 2)),
                    onPressed: () {},
                  ),
                  flex: 5,
                ),
              ])
          )),
    );
  }
}
