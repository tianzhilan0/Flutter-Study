

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/pages/home/page/ArticleDetailPage.dart';
import 'package:jianyue/pages/select/page/SelectDetailPage.dart';

//路由配置
final routes = {
  '/newsDeatil':(context,{arguments}) => ArticleDetailPage(arguments: arguments,),
  '/selectDetailPage':(context,{arguments}) => SelectDetailPage(arguments: arguments,),
};

//固定写法
var onGenerateRoute = (RouteSettings setting){
  final String name = setting.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (setting.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments: setting.arguments),
      );
      return route;
    }else{
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
};