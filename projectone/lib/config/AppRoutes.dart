import 'package:first/pages/login/LCLoginPage.dart';
import 'package:flutter/material.dart';

// Map<String, WidgetBuilder> appRoutes = {
//   '/': (_) => LCLoginPage(),
// };

//路由配置
final routes = {
  '/': (context, {arguments}) => LCLoginPage(),

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
