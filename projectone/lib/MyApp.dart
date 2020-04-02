import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'config/AppConfig.dart';
import 'config/MaterialAppConfig.dart';
import 'config/AppRoutes.dart';
import 'config/LCStorageConfig.dart';
import 'pages/base/MyHomePage.dart';
import 'pages/login/LCLoginPage.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loginState;

  @override
  void initState() {
    super.initState();
    _validateLogin();
  }

  void _validateLogin() async {
    String isLogin = await LCStorageConfig().getValue(AppConfig.sp_isLogin);
    setState(() {
      loginState = isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: MaterialApp(
      title: appConfig.appName,
      theme: appConfig.theme,
      // localizationsDelegates: [
      //   GlobalEasyRefreshLocalizations.delegate,
      // ],
      supportedLocales: appConfig.supportedLocales,
      showPerformanceOverlay: appConfig.showPerformanceOverlay,
      home: loginState == "1" ? LCLoginPage() : MyHomePage(),
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      // routes: appRoutes
    ));
  }
}
