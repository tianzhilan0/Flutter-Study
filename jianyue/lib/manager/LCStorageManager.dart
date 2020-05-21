import 'package:jianyue/commom/AppConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LCStorageManager {
    /// app全局配置
  static final LCStorageManager _storage = LCStorageManager._internal();

  factory LCStorageManager() {
    //2
    return _storage;
  }
  LCStorageManager._internal(); //3

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