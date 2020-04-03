import 'package:first/pages/card/LCCardPage.dart';
import 'package:first/pages/home/LCHomePage.dart';
import 'package:first/pages/invest/LCInvestPage.dart';
import 'package:first/pages/life/LCLifePage.dart';
import 'package:first/pages/mine/LCMinePage.dart';
import 'package:flutter/material.dart';

class LCTabbar extends StatefulWidget {
  LCTabbar({Key key}) : super(key: key);

  @override
  _LCTabbarState createState() => _LCTabbarState();
}

class _LCTabbarState extends State<LCTabbar> {
  List<Map> tabbarData = [
    {
      "title": "首页",
      "normalIcon": "assets/images/tabbar/tabbar_home.png",
      "selectedIcon": "assets/images/tabbar/tabbar_home_selected.png",
    },
    {
      "title": "投资",
      "normalIcon": "assets/images/tabbar/tabbar_invest.png",
      "selectedIcon": "assets/images/tabbar/tabbar_invest_selected.png",
    },
    {
      "title": "信用卡",
      "normalIcon": "assets/images/tabbar/tabbar_card.png",
      "selectedIcon": "assets/images/tabbar/tabbar_card_selected.png",
    },
    {
      "title": "生活",
      "normalIcon": "assets/images/tabbar/tabbar_life.png",
      "selectedIcon": "assets/images/tabbar/tabbar_life_selected.png",
    },
    {
      "title": "我的",
      "normalIcon": "assets/images/tabbar/tabbar_mine.png",
      "selectedIcon": "assets/images/tabbar/tabbar_mine_selected.png",
    }
  ];
  List<Widget> pages = [
    LCHomePage(),
    LCInvestPage(),
    LCCardPage(),
    LCLifePage(),
    LCMinePage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items() {
      List<BottomNavigationBarItem> items = List();
      for (int i = 0; i < tabbarData.length; i++) {
        var item = tabbarData[i];
        items.add(BottomNavigationBarItem(
            title: Text(item["title"]),
            icon: _currentIndex == i
                ? Image.asset(
                    item["selectedIcon"],
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    item["normalIcon"],
                    width: 24,
                    height: 24,
                  )));
      }
      return items;
    }

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black87,
        currentIndex: _currentIndex,
        items: items(),
      ),
    );
  }

  _onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
