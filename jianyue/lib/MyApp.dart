import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jianyue/commom/LoginProvider.dart';
import 'package:jianyue/manager/LCAppManager.dart';
import 'package:jianyue/manager/LCRouteManager.dart';
import 'package:jianyue/pages/MyHomePage.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  final String isLogin;
  MyApp({Key key, this.isLogin}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _isLogin;
  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: MultiProvider(
        // 注意MultiProvider的用法！
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider(_isLogin)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primaryColor: Colors.white),
          home: MyHomePage(
            isLogin: _isLogin,
          ),
          locale: Locale('zh'),
          onGenerateRoute: onGenerateRoute,
          initialRoute: '/',
        )));
  }
}
