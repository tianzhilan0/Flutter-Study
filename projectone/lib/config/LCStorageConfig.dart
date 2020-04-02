import 'package:shared_preferences/shared_preferences.dart';

import 'AppConfig.dart';

class LCStorageConfig {
  /// app全局配置
  static final LCStorageConfig _storage = LCStorageConfig._internal();

  factory LCStorageConfig() {
    //2
    return _storage;
  }
  LCStorageConfig._internal(); //3

  init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(AppConfig.sp_isLogin, "1");
  }

  setValue(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  Future<String> getValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userName = sp.getString(key);
    return userName;
  }
}
