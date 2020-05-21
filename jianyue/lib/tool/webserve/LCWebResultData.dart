// import 'package:virus/model/LCNewsModel.dart';
// import 'package:virus/model/LCNumorModel.dart';

import 'package:jianyue/pages/home/model/ArticleDetailCommentModel.dart';
import 'package:jianyue/pages/home/model/ArticleDetailModel.dart';
import 'package:jianyue/pages/home/model/HomeArticleModel.dart';
import 'package:jianyue/pages/home/model/HomeAuthorModel.dart';
import 'package:jianyue/pages/mine/model/UserDetailModel.dart';
import 'package:jianyue/pages/select/model/SelectDetailModel.dart';


class LCBaseArrayEntity<T> {

  List<T> data;
  LCBaseArrayEntity({this.data});

  factory LCBaseArrayEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json != null) {
      //遍历data并转换为我们传进来的类型
      (json as List).forEach((value) {
        mData.add(LCEntityFactory.generateOBJ<T>(value));
      });
    }
    return LCBaseArrayEntity(
      data: mData,
    );
  }
}



class LCBaseListEntity<T> {
  int code;
  String message;
  List<T> data;

  LCBaseListEntity({this.code, this.message, this.data});

  factory LCBaseListEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(LCEntityFactory.generateOBJ<T>(v));
      });
    }
    return LCBaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}

class LCBaseEntity<T> {
  int code;
  String message;
  T data;
  LCBaseEntity({this.code, this.message, this.data});

  factory LCBaseEntity.fromJson(json) {
    return LCBaseEntity(
      code: json["code"],
      message: json["msg"],
      // data值需要经过工厂转换为我们传进来的类型
      data: LCEntityFactory.generateOBJ<T>(json["data"]),
    );
  }
}

class LCEntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    } else {
      
      if (T.toString() == "HomeArticleModel") {
        return HomeArticleModel.fromJson(json['object']['data']) as T;
      } else if (T.toString() == "HomeAuthorModel") {
        return HomeAuthorModel.fromJson(json) as T;
      } 


      else if (T.toString() == "ArticleDetailModel") {
        // print(json);
        return ArticleDetailModel.fromJson(json) as T;
      } else if (T.toString() == "ArticleDetailCommentModels") {
        // print(json);
        return ArticleDetailCommentModels.fromJson(json) as T;
      }

      else if (T.toString() == "SelectDetailModel") {
        // print(json);
        return SelectDetailModel.fromJson(json) as T;
      }
      
      else if (T.toString() == "UserDetailModel") {
        // print(json);
        return UserDetailModel.fromJson(json) as T;
      }
      
      
      else {
        return null;
      }
    }
  }
}

class LCErrorEntity {
  int code;
  String message;

  LCErrorEntity({this.code, this.message});
}
