import 'package:first/config/AppConfig.dart';
import 'package:first/config/LCStorageConfig.dart';
import 'package:first/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LCMinePage extends StatefulWidget {
  LCMinePage({Key key}) : super(key: key);

  @override
  _LCMinePageState createState() => _LCMinePageState();
}

class _LCMinePageState extends State<LCMinePage> {
  @override
  void initState() {
    super.initState();
    print("init  LCMinePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("我的")),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 100),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                  child: Text(
                    "退出",
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    LCStorageConfig().setValue(AppConfig.sp_isLogin, "0");
                    Provider.of<LoginProvider>(context, listen: false).logout();
                  }),
            )
          ],
        ));
  }
}
