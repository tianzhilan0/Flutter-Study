import 'package:flutter/material.dart';

class AppConfig {
  // app名字
  static const String appName = '项目一';

  ///BaseURL
  static const String baseUrl = 'http://api.oyear.cn/';

  ///连接超时时间为5秒
  static const int connectTimeOut = 5 * 1000;

  ///响应超时时间为7秒
  static const int receiveTimeOut = 7 * 1000;

  //本地存储Key
  static const String sp_isLogin = "sp_isLogin";
  
}
