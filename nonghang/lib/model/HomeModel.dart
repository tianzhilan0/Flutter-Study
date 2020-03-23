class HomeModel {
  String backGround;
  String title;
  String subtitle;
  List<dynamic> header;
  List<dynamic> quickItems;
  List<dynamic> swiper;
  List<dynamic> hotActivity;
  List<dynamic> reActivity;

  HomeModel(
      {this.backGround,
      this.title,
      this.subtitle,
      this.header,
      this.quickItems,
      this.swiper,
      this.hotActivity,
      this.reActivity});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      backGround: json['backGround'],
      title: json['title'],
      subtitle: json['subtitle'],
      header: json['header'],
      quickItems: json['quickItems'],
      swiper: json['swiper'],
      hotActivity: json['hotActivity'],
      reActivity: json['reActivity'],
    );
  }
}
