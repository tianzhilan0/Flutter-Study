import 'package:first/config/AppConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    if (!sp.getKeys().contains(AppConfig.sp_isLogin)) {
      setValue(AppConfig.sp_isLogin, "0");
    }
  }

  setValue(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  Future<String> getValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String value = sp.getString(key);
    return value;
  }
}
