

import 'package:blocstudy/common/common.dart';
import 'package:blocstudy/data/api/apis.dart';
import 'package:blocstudy/models/LoginReq.dart';
import 'package:blocstudy/models/UserModel.dart';
import 'package:blocstudy/utils/LogUtil.dart';
import 'package:blocstudy/utils/sputil.dart';

class UserRepository {
  Future<UserModel> login(LoginReq req) async {
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
        .requestR<Map<String, dynamic>>(Method.post, LCApi.user_login,
            data: req.toJson());
    if (baseResp.code != Constant.status_success) {
      return Future.error(baseResp.msg);
    }
    baseResp.response.headers.forEach((String name, List<String> values) {
      if (name == "set-cookie") {
        String cookie = values.toString();
        LogUtil.e("set-cookie: " + cookie);
        SpUtil.putString(BaseConstant.keyAppToken, cookie);
        DioUtil().setCookie(cookie);
        //CacheUtil().setLogin(true);
      }
    });
    UserModel model = UserModel.fromJson(baseResp.data);
    //CacheUtil().setUserModel(model);
    SpUtil.putObject(BaseConstant.keyUserModel, model);
    return model;
  }

  // Future<UserModel> register(RegisterReq req) async {
  //   BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
  //       .requestR<Map<String, dynamic>>(
  //           Method.post, WanAndroidApi.user_register,
  //           data: req.toJson());
  //   if (baseResp.code != Constant.status_success) {
  //     return Future.error(baseResp.msg);
  //   }
  //   baseResp.response.headers.forEach((String name, List<String> values) {
  //     if (name == "set-cookie") {
  //       String cookie = values.toString();
  //       LogUtil.e("set-cookie: " + cookie);
  //       SpUtil.putString(BaseConstant.keyAppToken, cookie);
  //       DioUtil().setCookie(cookie);
  //       //CacheUtil().setLogin(true);
  //     }
  //   });
  //   UserModel model = UserModel.fromJson(baseResp.data);
  //   //CacheUtil().setUserModel(model);
  //   SpUtil.putObject(BaseConstant.keyUserModel, model);
  //   return model;
  // }
}
