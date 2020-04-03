import 'package:first/pages/base/MyHomePage.dart';
import 'package:first/pages/login/LCForgotPasswordPage.dart';
import 'package:first/pages/login/LCLoginPage.dart';
import 'package:first/pages/login/LCRegisterPage.dart';
import 'package:flutter/material.dart';

//路由配置
final routes = {
  '/': (context, {arguments}) => MyHomePage(),

  //登录模块
  '/login': (context, {arguments}) => LCLoginPage(),
  '/register': (context, {arguments}) => LCRegisterPage(arguments: arguments),
  '/forgotPassword': (context, {arguments}) => LCForgotPasswordPage(arguments: arguments),

  


  // '/newsDeatil':(context,{arguments}) => LCNewDetailPage(arguments: arguments,)
};

//固定写法
var onGenerateRoute = (RouteSettings setting) {
  final String name = setting.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (setting.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: setting.arguments),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
};
