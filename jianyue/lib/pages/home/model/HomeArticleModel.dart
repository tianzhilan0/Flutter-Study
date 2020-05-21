
import 'package:jianyue/pages/home/model/UserModel.dart';

class HomeArticleModel {
  int id;
  String title;
  String slug;
  String listimageurl;
  String publicabbr;
  int totalfpamount;
  int likescount;
  int publiccommentscount;
  int totalrewardscount;

  UserModel user;

  HomeArticleModel({
    this.id,
    this.title,
    this.slug,
    this.listimageurl,
    this.publicabbr,
    this.totalfpamount,
    this.likescount,
    this.publiccommentscount,
    this.totalrewardscount,
    this.user,
  });
    factory HomeArticleModel.fromJson(Map<String, dynamic> json){
    return HomeArticleModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      listimageurl: json['list_image_url'],
      publicabbr: json['public_abbr'],
      totalfpamount: json['total_fp_amount'],
      likescount: json['likes_count'],
      publiccommentscount: json['public_comments_count'],
      totalrewardscount: json['total_rewards_count'],
      user: UserModel.fromJson(json['user']) ,
    );
  }
}