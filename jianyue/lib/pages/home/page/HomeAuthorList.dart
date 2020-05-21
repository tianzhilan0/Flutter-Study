import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jianyue/manager/LCApi.dart';
import 'package:jianyue/pages/home/model/HomeAuthorModel.dart';
import 'package:jianyue/tool/LCLoading.dart';
import 'package:jianyue/tool/webserve/LCMethod.dart';
import 'package:jianyue/tool/webserve/LCWebRequstManager.dart';

class HomeAuthorList extends StatefulWidget {
  HomeAuthorList({Key key}) : super(key: key);

  @override
  _HomeAuthorListState createState() => _HomeAuthorListState();
}

class _HomeAuthorListState extends State<HomeAuthorList> {

  bool isRequest = false;
  HomeAuthorModels model = HomeAuthorModels();

  @override
  void initState() { 
    super.initState();
    isRequest = true;
    getData();
  }

  // 网络请求
  getData() async {
    await Future.delayed(Duration(seconds: 1));

    LCWebRequstManager().requestModel<HomeAuthorModels>(LCMethod.GET, LCApi.authorlist, {},
        success: (result) {
      print("========> 结束 <========");
      setState(() {
        isRequest = false;
        model = result;
        print(model.users.length);
      });
    }, error: (emsg) {
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> datas = getDataList();
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: isRequest
            ? LCLoading()
            :GridView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return getItemContainer(datas[index]);
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //单个子Widget的水平最大宽度
            maxCrossAxisExtent: 200,
            //水平单个子Widget之间间距
            mainAxisSpacing: 20.0,
            //垂直单个子Widget之间间距
            crossAxisSpacing: 10.0,
            //子Widget宽高比例
            childAspectRatio: 1),
      ),
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(children: [
        CachedNetworkImage(
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          imageUrl:
              'https://upload.jianshu.io/users/upload_avatars/9988193/fc26c109-1ae6-4327-a298-2def343e9cd8.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/180/h/180',
          placeholder: (context, url) => CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          ),
          errorWidget: (context, url, error) => SizedBox(
            width: 50,
            height: 50,
            child: Icon(Icons.image),),
        ),
        Text("名字名字"),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "222349\n文字",
            textAlign: TextAlign.center,
          ),
          Text(
            "289\n喜欢",
            textAlign: TextAlign.center,
          )
        ])
      ]),
      color: Colors.blue,
    );
  }
}
