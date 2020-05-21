import 'package:date_format/date_format.dart';
import 'package:jianyue/pages/home/model/UserModel.dart';

class ArticleDetailCommentModels {
  int page;
  int totalpages;
  List<ArticleDetailCommentModel> comments;

  ArticleDetailCommentModels({
    this.page,
    this.totalpages,
    this.comments,
  });

  factory ArticleDetailCommentModels.fromJson(Map<String, dynamic> json) {
    final originList = json['comments'] as List;
    List<ArticleDetailCommentModel> comments = originList.map((value) {
      ArticleDetailCommentModel model =
          ArticleDetailCommentModel.fromJson(value);
      model.createdat = formatDate(DateTime.parse(model.createdat), [mm, '-', dd, ' ', hh, ':', nn]);
      return model;
    }).toList();

    return ArticleDetailCommentModels(
      page: json['page'],
      totalpages: json['total_pages'],
      comments: comments,
    );
  }
}

class ArticleDetailCommentModel {
  int id;
  String createdat;
  String compiledcontent;
  int floor;
  int likescount;
  int childrencount;
  UserModel user;
  List<ArticleDetailCommentModel> children;

  ArticleDetailCommentModel({
    this.id,
    this.createdat,
    this.compiledcontent,
    this.floor,
    this.likescount,
    this.childrencount,
    this.user,
    this.children,
  });

  factory ArticleDetailCommentModel.fromJson(Map<String, dynamic> json) {
    // final originList = json['children'] as List;
    // List<ArticleDetailCommentModel> children = originList.map((value) {
    //   ArticleDetailCommentModel model =
    //       ArticleDetailCommentModel.fromJson(value);
    //   return model;
    // }).toList();

    return ArticleDetailCommentModel(
        id: json['id'],
        createdat: json['created_at'],
        compiledcontent: json['compiled_content'],
        floor: json['floor'],
        likescount: json['likes_count'],
        childrencount: json['children_count'],
        user: UserModel.fromJson(json['user']),
        // children: children,
        );
  }
}
