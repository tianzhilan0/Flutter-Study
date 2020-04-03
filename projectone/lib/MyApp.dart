import 'package:first/config/AppConfig.dart';
import 'package:first/config/LCStorageConfig.dart';
import 'package:first/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'config/MaterialAppConfig.dart';
import 'config/AppRoutes.dart';
import 'pages/base/MyHomePage.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _isLogin;
  @override
  void initState() {
    super.initState();
    _validateLogin();
  }

    void _validateLogin() async {
    String isLogin = await LCStorageConfig().getValue(AppConfig.sp_isLogin);
    print("当前LoginState == $isLogin");
    setState(() {
      _isLogin = isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: MultiProvider(
            /// 注意MultiProvider的用法！
            providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider(_isLogin)),
        ],
            child: MaterialApp(
              title: appConfig.appName,
              theme: appConfig.theme,
              debugShowCheckedModeBanner: false,
              // localizationsDelegates: [
              //   GlobalEasyRefreshLocalizations.delegate,
              // ],
              supportedLocales: appConfig.supportedLocales,
              showPerformanceOverlay: appConfig.showPerformanceOverlay,
              home: MyHomePage(isLogin: _isLogin,),
              initialRoute: "/",
              onGenerateRoute: onGenerateRoute,
              // routes: appRoutes
            )));
  }
}
