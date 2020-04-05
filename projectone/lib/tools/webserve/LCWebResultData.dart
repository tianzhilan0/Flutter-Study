

// import 'package:nonghang/model/HomeModel.dart';
// import 'package:nonghang/model/InvestModel.dart';

import 'package:first/model/LoginModel.dart';

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
      message: json["message"],
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
      message: json["message"],
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
      if (T.toString() == "LoginModel") {
        return LoginModel.fromJson(json) as T;
      } 
      // else if (T.toString() == "InvestModel") {
      //   return InvestModel.fromJson(json) as T;
      // } else {
      //   return null;
      // }
      return json as T;
    }
  }
}

class LCErrorEntity {
  int code;
  String message;

  LCErrorEntity({this.code, this.message});
}
