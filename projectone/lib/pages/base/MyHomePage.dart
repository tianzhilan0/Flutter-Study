import 'package:first/pages/base/LCTabbar.dart';
import 'package:first/pages/login/LCLoginPage.dart';
import 'package:first/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String isLogin;
  MyHomePage({Key key,this.isLogin}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String _isLogin = "0";

  // @override
  // void initState() {
  //   super.initState();
  //   listenLoginState();
  //   _isLogin = widget.isLogin;
  // }

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =  Provider.of<LoginProvider>(context);

    if (loginProvider.isLogin == "1") {
      return LCTabbar();
    } else {
      return LCLoginPage();
    }
  }
}
