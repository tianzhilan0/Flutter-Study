import 'package:flutter/material.dart';

class LCInvestPage extends StatefulWidget {
  LCInvestPage({Key key}) : super(key: key);

  @override
  _LCInvestPageState createState() => _LCInvestPageState();
}

class _LCInvestPageState extends State<LCInvestPage> {

  @override
  void initState() {
    super.initState();

    print("init  LCInvestPage");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("投资")),
      body: ListView(
        
      )
    );
  }
}