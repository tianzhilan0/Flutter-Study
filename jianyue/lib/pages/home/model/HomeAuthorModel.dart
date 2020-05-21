class HomeAuthorModels {
  List<HomeAuthorModel> users;
  int totalcount;

  HomeAuthorModels({
    this.users,
    this.totalcount
  });
    factory HomeAuthorModels.fromJson(Map<String, dynamic> json){
    return HomeAuthorModels(
      users: json['users'],
      totalcount: json['total_count'],
    );
  }
}


class HomeAuthorModel 
{
  String id;
  String slug;
  String nickname;
  String avatarsource;
  String totallikescount;
  String totalwordage;


  HomeAuthorModel({
    this.id,
    this.slug,
    this.nickname,
    this.avatarsource,
    this.totallikescount,
    this.totalwordage,
    });

  factory HomeAuthorModel.fromJson(Map<String, dynamic> json){
    return HomeAuthorModel(
      id: json['id'],
      slug: json['slug'],
      nickname: json['nickname'],
      avatarsource: json['avatar_source'],
      totallikescount: json['total_likes_count'],
      totalwordage: json['total_wordage'],
    );
  }
}