import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LifeGoods extends StatefulWidget {
  LifeGoods({Key key}) : super(key: key);

  @override
  _LifeGoodsState createState() => _LifeGoodsState();
}

class _LifeGoodsState extends State<LifeGoods> {
  String _currentTab = "推荐";
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    List data = [
      {"title": "推荐"},
      {"title": "本地"},
      {"title": "上传"},
    ];

    void _selectTab(String tab) {
      setState(() {
                _currentTab = tab;
        switch (tab) {
          case "推荐":
            _tabIndex = 0;
            break;
          case "本地":
            _tabIndex = 1;
            break;
          case "上传":
            _tabIndex = 2;
            break;
          default:
        }
      });
    }

    List<Widget> tabs() {
      return data.map((item) {
        return GestureDetector(
            //手势监听控件，用于监听各种手势
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Text(
                item["title"],
                style: TextStyle(
                    fontSize: _currentTab == item["title"] ? 20 : 18,
                    fontWeight: _currentTab == item["title"]
                        ? FontWeight.w500
                        : FontWeight.w300),
              ),
            ),
            onTap: () => _selectTab(
                  item["title"],
                )
            //onSelectTab函数的使用非常巧妙，
            //相当于定义了一个接口，可操控当前控件以外的数据
            );
      }).toList();
    }

    List goods = [
      [
        {
          "title": "瑞幸咖啡1",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life1.jpg"
        },
        {
          "title": "瑞幸咖啡2",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life2.jpg"
        },
        {
          "title": "瑞幸咖啡3",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life3.jpg"
        },
        {
          "title": "瑞幸咖啡4",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life4.jpg"
        },
        {
          "title": "瑞幸咖啡5",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life5.jpg"
        },
        {
          "title": "瑞幸咖啡6",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life6.jpg"
        },
        {
          "title": "瑞幸咖啡7",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life7.jpg"
        },
        {
          "title": "瑞幸咖啡8",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life8.jpg"
        },
        {
          "title": "瑞幸咖啡9",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life9.jpg"
        },
        {
          "title": "瑞幸咖啡10",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life10.jpg"
        },
      ],
      [
        {
          "title": "星巴克咖啡1",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life10.jpg"
        },
        {
          "title": "星巴克咖啡2",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life9.jpg"
        },
        {
          "title": "星巴克咖啡3",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life8.jpg"
        },
        {
          "title": "星巴克咖啡4",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life7.jpg"
        },
        {
          "title": "星巴克咖啡5",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life6.jpg"
        },
        {
          "title": "星巴克咖啡6",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life6.jpg"
        },
        {
          "title": "星巴克咖啡7",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life7.jpg"
        },
        {
          "title": "星巴克咖啡8",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life8.jpg"
        },
        {
          "title": "星巴克咖啡9",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life9.jpg"
        },
        {
          "title": "星巴克咖啡10",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life10.jpg"
        },
      ],
      [
        {
          "title": "美式咖啡1",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life5.jpg"
        },
        {
          "title": "美式咖啡2",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life4.jpg"
        },
        {
          "title": "美式咖啡3",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life3.jpg"
        },
        {
          "title": "美式咖啡4",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life2.jpg"
        },
        {
          "title": "美式咖啡5",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life1.jpg"
        },
        {
          "title": "美式咖啡6",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life10.jpg"
        },
        {
          "title": "美式咖啡7",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life7.jpg"
        },
        {
          "title": "美式咖啡8",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life8.jpg"
        },
        {
          "title": "美式咖啡9",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life5.jpg"
        },
        {
          "title": "美式咖啡10",
          "detail": "我是描述描述",
          "image": "http://api.oyear.cn/nonghang/life/life6.jpg"
        },
      ]
    ];

    Widget gridItem(int tabIndex, int index) {
      return Container(
          // color: Colors.grey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AspectRatio(
            aspectRatio: 4 / 3.0, // 宽高比
            child: CachedNetworkImage(
              imageUrl: goods[tabIndex][index]["image"],
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        SizedBox(height: 5),
        Text(
          goods[tabIndex][index]["title"],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 5),
        Text(
          goods[tabIndex][index]["detail"],
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black54),
        )
      ]));
    }

    return Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start, children: tabs()),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true, //增加
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            itemCount: 10,
            itemBuilder: (content, index) {
              return gridItem(_tabIndex, index);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: 2,
                //纵轴间距
                mainAxisSpacing: 20.0,
                //横轴间距
                crossAxisSpacing: 20.0,
                //子组件宽高长度比例
                childAspectRatio: 0.9
                ),
          )
        ]));
  }
}
