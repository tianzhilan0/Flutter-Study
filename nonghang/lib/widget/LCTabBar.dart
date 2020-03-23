import 'package:flutter/material.dart';

class LCTabBar extends StatefulWidget {
  final List<Map> tabbarData;
  final List<Widget> pages;
  final int currentIndex;

  LCTabBar({Key key, this.tabbarData, this.pages, this.currentIndex = 0}) : super(key: key);

  @override
  _LCTabBarState createState() => _LCTabBarState();
}

class _LCTabBarState extends State<LCTabBar> {

  int _currentIndex;

    @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: widget.pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black87,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(widget.tabbarData[0]["title"]), 
            icon: _currentIndex == 0 ? Image.asset(widget.tabbarData[0]["selectedIcon"], width: 24, height: 24,) : Image.asset(widget.tabbarData[0]["normalIcon"], width: 24, height: 24,)
          ),
          BottomNavigationBarItem(
            title: Text(widget.tabbarData[1]["title"]), 
            icon: _currentIndex == 1 ? Image.asset(widget.tabbarData[1]["selectedIcon"], width: 24, height: 24,) : Image.asset(widget.tabbarData[1]["normalIcon"], width: 24, height: 24,)
          ),
          BottomNavigationBarItem(
            title: Text(widget.tabbarData[2]["title"]), 
            icon: _currentIndex == 2 ? Image.asset(widget.tabbarData[2]["selectedIcon"], width: 24, height: 24,) : Image.asset(widget.tabbarData[2]["normalIcon"], width: 24, height: 24,)
          ),
          BottomNavigationBarItem(
            title: Text(widget.tabbarData[3]["title"]), 
            icon: _currentIndex == 3 ? Image.asset(widget.tabbarData[3]["selectedIcon"], width: 24, height: 24,) : Image.asset(widget.tabbarData[3]["normalIcon"], width: 24, height: 24,)
          ),
          BottomNavigationBarItem(
            title: Text(widget.tabbarData[4]["title"]), 
            icon: _currentIndex == 4 ? Image.asset(widget.tabbarData[4]["selectedIcon"], width: 24, height: 24,) : Image.asset(widget.tabbarData[4]["normalIcon"], width: 24, height: 24,)
          ),
        ],
      ),
    );
  }

  _onTap(index){
    setState(() {
      _currentIndex = index;
    });
  }
}