import 'package:flutter/material.dart';
import 'dart:math' as math;

class LCCustomScrollView extends StatefulWidget {
  LCCustomScrollView({Key key}) : super(key: key);

  @override
  _LCCustomScrollViewState createState() => _LCCustomScrollViewState();
}

class _LCCustomScrollViewState extends State<LCCustomScrollView> {

  double dragOffset;

  @override
  Widget build(BuildContext context) {
    // return

    return CustomScrollView(
      // scrollDirection: Axis.horizontal,
      primary: true,
      physics: ScrollPhysics(),
      slivers: <Widget>[
        //AppBar，包含一个导航栏
        SliverAppBar(
          title: const Text('CustomScrollView'),
          backgroundColor: null,
          floating: false,
          snap: false,
          pinned: true,
          expandedHeight: 200.0,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(Icons.list),
            ),
          ],
          leading: Icon(Icons.home),
          flexibleSpace: FlexibleSpaceBar(
            // title: const Text('SliverAppBar'),
            background: Image.network(
              "https://y.gtimg.cn/music/photo_new/T002R300x300M000001hGx1Z0so1YX_1.jpg?max_age=2592000",
              fit: BoxFit.cover,
            ),
          ),
        ),

        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 180.0,
            maxHeight: 180.0,
            child: Container(),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),

        //List
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            //创建列表项
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('list item $index'),
            );
          }, childCount: 20 //50个列表项
                  ),
        ),

        SliverToBoxAdapter(
          child: Container(color: Colors.brown, child: SizedBox(height: 100)),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
        color: Colors.orange, child: SizedBox.expand(child: child));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

// const SliverAppBar({
//     Key key,
//     this.leading,         //在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
//     this.automaticallyImplyLeading = true,//? 控制是否应该尝试暗示前导小部件为null
//     this.title,               //当前界面的标题文字
//     this.actions,          //一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
//     this.flexibleSpace,        //一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样， // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
//     this.bottom,         //一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
//     this.elevation,            //阴影
//     this.forceElevated = false,
//     this.backgroundColor,       //APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
//     this.brightness,   //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
//     this.iconTheme,  //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
//     this.textTheme,    //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
//     this.primary = true,  //此应用栏是否显示在屏幕顶部
//     this.centerTitle,     //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
//     this.titleSpacing = NavigationToolbar.kMiddleSpacing,//横轴上标题内容 周围的间距
//     this.expandedHeight,     //展开高度
//     this.floating = false,       //是否随着滑动隐藏标题
//     this.pinned = false,  //是否固定在顶部
//     this.snap = false,   //与floating结合使用
//   })
