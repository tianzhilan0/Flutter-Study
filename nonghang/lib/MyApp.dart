import 'package:flutter/material.dart';
import 'package:nonghang/manager/LCAppManager.dart';
import 'package:nonghang/manager/LCRouteManager.dart';
import 'package:nonghang/pages/card/CardPage.dart';
import 'package:nonghang/pages/home/HomePage.dart';
import 'package:nonghang/pages/invest/InvestPage.dart';
import 'package:nonghang/pages/life/LifePage.dart';
import 'package:nonghang/pages/mine/MinePage.dart';
import 'package:nonghang/widget/LCTabBar.dart';


class MyApp extends StatelessWidget {

  final List<Map> tabbarData = [
    {
      "title":"首页",
      "normalIcon":"images/tabbar/tabbar_home.png",
      "selectedIcon":"images/tabbar/tabbar_home_selected.png",
    },{
      "title":"投资",
      "normalIcon":"images/tabbar/tabbar_invest.png",
      "selectedIcon":"images/tabbar/tabbar_invest_selected.png",
    },{
      "title":"信用卡",
      "normalIcon":"images/tabbar/tabbar_card.png",
      "selectedIcon":"images/tabbar/tabbar_card_selected.png",
    },{
      "title":"生活",
      "normalIcon":"images/tabbar/tabbar_life.png",
      "selectedIcon":"images/tabbar/tabbar_life_selected.png",
    },{
      "title":"我的",
      "normalIcon":"images/tabbar/tabbar_mine.png",
      "selectedIcon":"images/tabbar/tabbar_mine_selected.png",
    }
  ];
  final List<Widget> pages = [HomePage(),InvestPage(),CardPage(),LifePage(),MinePage()];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.blueGrey
      ),
      home: LCTabBar(tabbarData: tabbarData, pages: pages),
      locale: Locale('zh'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
    );
  }
}