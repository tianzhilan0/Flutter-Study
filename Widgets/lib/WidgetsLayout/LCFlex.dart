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
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("One"),
                Text("One"),
                Text("One"),
                Text("One"),
              ])
          )),
    );
  }
}
