import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LCSwiper extends StatelessWidget {
  const LCSwiper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> swiperDataList = [
      "http://www.abchina.com/cn/advis/grfw_gggl/sygg/201912/P020191219559869771748.jpg",
      "http://www.abchina.com/cn/advis/grfw_gggl/sygg/201912/P020191219559869771748.jpg",
      "http://www.abchina.com/cn/advis/grfw_gggl/sygg/201912/P020191219559869771748.jpg",
      "http://www.abchina.com/cn/advis/grfw_gggl/sygg/201912/P020191219559869771748.jpg",
    ];
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('轮播组件'),
    //   ),
    //   body: Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: 200.0,
    //       child: Swiper(
    //           itemCount: swiperDataList.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return Image.network(
    //               swiperDataList[index],
    //               fit: BoxFit.fill,
    //             );
    //           },
    //           control: SwiperControl(),
    //           scrollDirection: Axis.horizontal,
    //           autoplay: true,
    //           itemWidth: 300,
    //           layout: SwiperLayout.STACK // stack样式
    //           )),
    // );

    return Scaffold(
        appBar: AppBar(title: Text("flutter_swiper")),
        body: Container(
            width: double.maxFinite,
            child: ListView(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 4,
                  child: Swiper(
                    outer: false,
                    itemBuilder: (c, i) {
                      if (swiperDataList != null) {
                        return CachedNetworkImage(
                          imageUrl: "${swiperDataList[i]}",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        );
                      } else {
                        return Container();
                      }
                    },
                    pagination: SwiperPagination(margin: EdgeInsets.all(0)),
                    itemCount:
                        swiperDataList == null ? 0 : swiperDataList.length,
                  )),
              ConstrainedBox(
                  child: Swiper(
                    autoplay: true,
                    outer: false,
                    itemBuilder: (c, i) {
                      if (swiperDataList != null) {
                        return CachedNetworkImage(
                          imageUrl: "${swiperDataList[i]}",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        );
                      } else {
                        return Container();
                      }
                    },
                    pagination: SwiperPagination(margin: EdgeInsets.all(0)),
                    itemCount:
                        swiperDataList == null ? 0 : swiperDataList.length,
                  ),
                  constraints: BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width, 180.0))),
              ConstrainedBox(
                  child: Swiper(
                    autoplay: true,
                    outer: false,
                    itemBuilder: (c, i) {
                      if (swiperDataList != null) {
                        return CachedNetworkImage(
                          imageUrl: "${swiperDataList[i]}",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        );
                      } else {
                        return Container();
                      }
                    },
                    pagination: SwiperPagination(
                      //指示器显示的位置
                      alignment: Alignment
                          .bottomCenter, // 位置 Alignment.bottomCenter 底部中间
                      // 距离调整
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      // 指示器构建
                      builder: FractionPaginationBuilder(
                          // 选中时字体大小
                          activeFontSize: 14,
                          // 字体大小
                          fontSize: 14,
                          // 字体颜色
                          color: Colors.red,
                          //选中时的颜色
                          activeColor: Colors.blue),
                    ),
                    itemCount:
                        swiperDataList == null ? 0 : swiperDataList.length,
                  ),
                  constraints: BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width, 180.0))),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Swiper(
                      autoplay: true,
                      itemWidth: 300.0,
                      layout: SwiperLayout.STACK,
                      itemCount: swiperDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // 用Container实现图片圆角的效果
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  NetworkImage(swiperDataList[index]), // 图片数组
                              fit: BoxFit.fitHeight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        );
                      })),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Swiper(
                      autoplay: true,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      itemCount: swiperDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // 用Container实现图片圆角的效果
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  NetworkImage(swiperDataList[index]), // 图片数组
                              fit: BoxFit.fitHeight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        );
                      })),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Swiper(
                    layout: SwiperLayout.CUSTOM,
                    customLayoutOption:
                        CustomLayoutOption(startIndex: -1, stateCount: 3)
                            .addRotate(
                                [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                      Offset(-370.0, -40.0),
                      Offset(0.0, 0.0),
                      Offset(370.0, -40.0)
                    ]),
                    itemWidth: 300.0,
                    itemHeight: 200.0,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(swiperDataList[index]),
                            // fit: BoxFit.fill
                          ),
                          // borderRadius:
                          //     BorderRadius.all(Radius.circular(10))
                        ),
                      );
                    },
                    itemCount: swiperDataList.length,
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.white, activeColor: Colors.blue)),
                    autoplay: true,
                    autoplayDisableOnInteraction: true,
                  )),
            ])));
  }
}
