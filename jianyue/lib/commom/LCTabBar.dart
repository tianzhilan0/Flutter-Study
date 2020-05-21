import 'package:flutter/material.dart';
import 'package:jianyue/pages/home/page/HomePage.dart';
import 'package:jianyue/pages/life/LifePage.dart';
import 'package:jianyue/pages/mine/page/MinePage.dart';
import 'package:jianyue/pages/select/page/SelectPage.dart';

class LCTabBar extends StatefulWidget {
  LCTabBar({Key key}) : super(key: key);

  @override
  _LCTabBarState createState() => _LCTabBarState();
}

class _LCTabBarState extends State<LCTabBar> {
  List<Map> _tabbarData = [
    {
      "title": "推荐",
      "normalIcon": "images/tabbar/tabbar_home.png",
      "selectedIcon": "images/tabbar/tabbar_home_selected.png",
    },
    {
      "title": "精选",
      "normalIcon": "images/tabbar/tabbar_invest.png",
      "selectedIcon": "images/tabbar/tabbar_invest_selected.png",
    },
    {
      "title": "生活",
      "normalIcon": "images/tabbar/tabbar_life.png",
      "selectedIcon": "images/tabbar/tabbar_life_selected.png",
    },
    {
      "title": "我的",
      "normalIcon": "images/tabbar/tabbar_mine.png",
      "selectedIcon": "images/tabbar/tabbar_mine_selected.png",
    }
  ];
  List<Widget> _pages = [HomePage(), SelectPage(), LifePage(), MinePage()];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> items() {
    List<BottomNavigationBarItem> items = List();
    for (int i = 0; i < _tabbarData.length; i++) {
      var item = _tabbarData[i];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black87,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
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
