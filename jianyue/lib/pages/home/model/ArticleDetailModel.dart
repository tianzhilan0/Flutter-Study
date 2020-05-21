import 'package:jianyue/pages/home/model/UserModel.dart';

class ArticleDetailModel {
  int id;
  String publictitle;
  String slug;
  int likescount;
  String freecontent;
  String firstsharedat;
  int wordage; //字数
  int publiccommentcount;
  // String listimageurl;
  // String publicabbr;
  // int totalfpamount;
  // int publiccommentscount;
  // int totalrewardscount;

  UserModel user;

  ArticleDetailModel({
    this.id,
    this.publictitle,
    this.slug,
    this.likescount,
    this.freecontent,
    this.firstsharedat,
    this.wordage,
    this.user,
    this.publiccommentcount,
  });
  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) {
    
    return ArticleDetailModel(
      id: json['id'],
      publictitle: json['public_title'],
      slug: json['slug'],
      likescount: json['likes_count'],
      freecontent: json['free_content'],
      firstsharedat: json['first_shared_at'],
      wordage: json['wordage'],
      user: UserModel.fromJson(json['user']),
      publiccommentcount: json['public_comment_count'],
    );
  }
}
