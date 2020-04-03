import 'package:flutter/material.dart';

class LCHomePage extends StatefulWidget {
  LCHomePage({Key key}) : super(key: key);

  @override
  _LCHomePageState createState() => _LCHomePageState();
}

class _LCHomePageState extends State<LCHomePage> {

  @override
  void initState() {
    super.initState();

    print("init  LCHomePage");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose  LCHomePage");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: ListView(

      )
    );
  }
}