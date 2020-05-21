import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatefulWidget {
  SelectPage({Key key}) : super(key: key);

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("精选文集"),
          ),
          preferredSize: Size.fromHeight(48)),
      body: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: GridView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return getItemContainer(items[index]);
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //单个子Widget的水平最大宽度
                maxCrossAxisExtent: 200,
                //水平单个子Widget之间间距
                mainAxisSpacing: 10.0,
                //垂直单个子Widget之间间距
                crossAxisSpacing: 10.0,
                //子Widget宽高比例
                childAspectRatio: 3),
          )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => print("FloatingActionButton"),
      //   child: Image.asset('images/common/common_publish.png'),
      //   backgroundColor: Colors.white,
      //   heroTag:'select'
      // )
    );
  }

  Widget getItemContainer(Map item) {
    return InkWell(
        onTap: () {
          jumpToDetail(item['slug'], item['id'], item['title']);
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.black12,
          child: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  imageUrl: item["image_url"],
                )),
            SizedBox(width: 8),
            Text(
              item["title"],
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ));
  }

  //进入文章详情
  void jumpToDetail(String slug, int id, String title) {
    Navigator.of(context).pushNamed("/selectDetailPage", arguments: {
      "slug": slug,
      "id": id,
      "title": title,
    });
  }

  List items = [
    {
      "id": 14,
      "image_url":
          "https://upload.jianshu.io/collections/images/14/6249340_194140034135_2.jpg",
      "title": "@IT·互联网",
      "slug": "V2CqjW"
    },
    {
      "id": 83,
      "image_url": "https://upload.jianshu.io/collections/images/83/1.jpg",
      "title": "摄影",
      "slug": "7b2be866f564"
    },
    {
      "id": 95,
      "image_url": "https://upload.jianshu.io/collections/images/95/1.jpg",
      "title": "故事",
      "slug": "fcd7a62be697"
    },
    {
      "id": 4,
      "image_url":
          "https://upload.jianshu.io/collections/images/4/sy_20091020135145113016.jpg",
      "title": "读书",
      "slug": "yD9GAd"
    },
    {
      "id": 76,
      "image_url": "https://upload.jianshu.io/collections/images/76/12.jpg",
      "title": "自然科普",
      "slug": "cc7808b775b4"
    },
    {
      "id": 283250,
      "image_url":
          "https://upload.jianshu.io/collections/images/283250/%E6%BC%AB%E7%94%BB%E4%B8%93%E9%A2%98.jpg",
      "title": "手绘",
      "slug": "8c92f845cd4d"
    },
    {
      "id": 13,
      "image_url":
          "https://upload.jianshu.io/collections/images/13/%E5%95%8A.png",
      "title": "旅行·在路上",
      "slug": "5AUzod"
    },
    {
      "id": 21,
      "image_url":
          "https://upload.jianshu.io/collections/images/21/20120316041115481.jpg",
      "title": "简书电影",
      "slug": "1hjajt"
    },
    {
      "id": 38,
      "image_url":
          "https://upload.jianshu.io/collections/images/38/android.graphics.Bitmap_f3edcb1.jpeg",
      "title": "诗",
      "slug": "vHz3Uc"
    },
    {
      "id": 514184,
      "image_url":
          "https://upload.jianshu.io/collections/images/514184/WechatIMG959.jpeg",
      "title": " 原创儿童文学",
      "slug": "6fba5273f339"
    },
    {
      "id": 11,
      "image_url":
          "https://upload.jianshu.io/collections/images/11/20100120161805563.jpg",
      "title": "短篇小说",
      "slug": "dqfRwQ"
    },
    {
      "id": 256739,
      "image_url":
          "https://upload.jianshu.io/collections/images/256739/461792731394569594.jpg",
      "title": "婚姻育儿",
      "slug": "70b8514fb442"
    },
    {
      "id": 30,
      "image_url":
          "https://upload.jianshu.io/collections/images/30/IMG_2226.jpg",
      "title": "美食",
      "slug": "qqfxgN"
    },
    {
      "id": 264569,
      "image_url":
          "https://upload.jianshu.io/collections/images/264569/2.pic.jpg",
      "title": "@产品",
      "slug": "ad41ba5abc09"
    },
    {
      "id": 16,
      "image_url":
          "https://upload.jianshu.io/collections/images/16/computer_guy.jpg",
      "title": "程序员",
      "slug": "NEt52a"
    },
    {
      "id": 1628248,
      "image_url":
          "https://upload.jianshu.io/collections/images/1628248/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20180529152808.jpg",
      "title": "脱单",
      "slug": "accb04610749"
    },
    {
      "id": 25920,
      "image_url":
          "https://upload.jianshu.io/collections/images/25920/enhanced-buzz-wide-16461-1372163238-8.jpg",
      "title": "生活家",
      "slug": "f6b4ca4bb891"
    },
    {
      "id": 540903,
      "image_url":
          "https://upload.jianshu.io/collections/images/540903/1f2936a662509e7d64528466be5546f4_r.jpg",
      "title": "漫画",
      "slug": "263e0ef8c3c3"
    },
    {
      "id": 28,
      "image_url":
          "https://upload.jianshu.io/collections/images/28/%E4%B8%8A%E7%8F%AD%E8%BF%99%E7%82%B9%E4%BA%8B%E5%84%BF.jpeg",
      "title": "上班这点事儿",
      "slug": "Jgq3Wc"
    },
    {
      "id": 61,
      "image_url":
          "https://upload.jianshu.io/collections/images/61/0__15815600_401_00.jpg",
      "title": "连载小说",
      "slug": "xYuZYD"
    },
    {
      "id": 1747638,
      "image_url":
          "https://upload.jianshu.io/collections/images/1747638/%E6%9C%AA%E5%91%BD%E5%90%8D%E8%AE%BE%E8%AE%A1_WPS%E5%9B%BE%E7%89%87.jpg",
      "title": "向茶点故事投稿",
      "slug": "6dc0aa18b9b5"
    },
    {
      "id": 277031,
      "image_url":
          "https://upload.jianshu.io/collections/images/277031/645317897236768460.png",
      "title": "娱乐圈",
      "slug": "e50258a6a44b"
    },
    {
      "id": 105,
      "image_url": "https://upload.jianshu.io/collections/images/105/2.jpg",
      "title": "国学与传统文化",
      "slug": "742422443ad3"
    },
    {
      "id": 26,
      "image_url":
          "https://upload.jianshu.io/collections/images/26/android.graphics.Bitmap_34d0eb2.jpeg",
      "title": "创业",
      "slug": "LLCyGH"
    }
  ];
}
