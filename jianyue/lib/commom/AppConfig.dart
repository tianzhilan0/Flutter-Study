
class AppConfig {
  // app名字
  static const String appName = '简阅';

  ///BaseURL
  static const String baseUrl = 'https://www.jianshu.com';

  ///连接超时时间为5秒
  static const int connectTimeOut = 5 * 1000;

  ///响应超时时间为7秒
  static const int receiveTimeOut = 7 * 1000;

  //本地存储Key 0未登录 1登录
  static const String sp_isLogin = "sp_isLogin"; 
  
}