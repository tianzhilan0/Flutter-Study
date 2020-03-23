
class LCWebConfig {

  static final LCWebConfig _share = LCWebConfig._internal();
  factory LCWebConfig() {
    return _share;
  }
  LCWebConfig._internal();

  // 请求的url
  String baseUrl = 'http://api.oyear.cn/';

}