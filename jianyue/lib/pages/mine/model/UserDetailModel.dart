class UserDetailModel {
  int id;
  String slug;
  String nickname;
  String intro;
  String introcompiled;
  String avatar;
  String backgroundimage;
  int followinguserscount;
  int followerscount;
  int totalwordage;
  int totallikescount;
  int jsdbalance;
  int lastupdatedat;

  UserDetailModel({
    this.id,
    this.slug,
    this.nickname,
    this.intro,
    this.introcompiled,
    this.avatar,
    this.backgroundimage,
    this.followinguserscount,
    this.followerscount,
    this.totalwordage,
    this.totallikescount,
    this.jsdbalance,
    this.lastupdatedat,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      id: json['id'],
      slug: json['slug'],
      nickname: json['nickname'],
      intro: json['intro'],
      introcompiled: json['intro_compiled'],
      avatar: json['avatar'],
      backgroundimage: json['background_image'],
      followinguserscount: json['following_users_count'],
      followerscount: json['followers_count'],
      totalwordage: json['total_wordage'],
      totallikescount: json['total_likes_count'],
      jsdbalance: json['jsd_balance'],
      lastupdatedat: json['last_updated_at'],
    );
  }
}
