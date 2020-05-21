class UserModel {
  int id;
  String nickname;
  String slug;
  String avatar;
  String intro;
  // List<UserBadgesModel> badges;

  UserModel(
      {this.id,
      this.nickname,
      this.slug,
      this.avatar,
      this.intro,
      // this.badges
      });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        nickname: json['nickname'],
        slug: json['slug'],
        avatar: json['avatar'],
        intro: json['intro'],
        // badges: UserBadgesModel.fromJson(json['badges'])
        );
  }
}

class UserBadgesModel {
  String text;
  String imageurl;
  String introurl;

  UserBadgesModel({
    this.text,
    this.imageurl,
    this.introurl,
  });

  factory UserBadgesModel.fromJson(Map<String, dynamic> json) {
    return UserBadgesModel(
      text: json['text'],
      imageurl: json['image_url'],
      introurl: json['intro_url'],
    );
  }
}
