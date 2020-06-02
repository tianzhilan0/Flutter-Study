import 'package:flutter/material.dart';
import 'package:jianyue/pages/home/page/HomeArticleList.dart';
import 'package:jianyue/pages/home/page/HomeAuthorList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    print("=========> homepage initState <=========");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('HomePage  build...');
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: _tabBarTop(),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search))
            ],
          ),
          preferredSize: Size.fromHeight(48)),
      body: _tabBarView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print("FloatingActionButton"),
          child: Image.asset('images/common/common_publish.png'),
          backgroundColor: Colors.white,
          heroTag: 'home'),
    );
  }

  _tabBarView() => TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeArticleList(),
            HomeAuthorList(),
          ]);

  _tabBarTop() => TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Tab(
          child: Text(
            '优美文章',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Tab(
          child: Text(
            '知名作者',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
      controller: _tabController);
}
