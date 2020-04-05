import 'package:cached_network_image/cached_network_image.dart';
import 'package:first/model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  final HomeModel model;
  HomeSwiper({Key key, this.model}) : super(key: key);

  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  HomeModel model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    List swiperDataList = model.swiper;

    return ConstrainedBox(
        child: Swiper(
          autoplay: true,
          itemCount: swiperDataList == null ? 0 : swiperDataList.length,
          itemBuilder: (BuildContext context, int index) {
            if (swiperDataList != null) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "${swiperDataList[index]}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )));
            } else {
              return Container();
            }
          },
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  // 指示器构建
                  space: 5, // 点之间的间隔
                  size: 8, // 没选中时的大小
                  activeSize: 8, // 选中时的大小
                  color: Colors.white, // 没选中时的颜色
                  activeColor: Colors.green)),
        ),
        constraints: BoxConstraints.loose(
            Size(MediaQuery.of(context).size.width, 180.0)));
  }
}
