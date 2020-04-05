import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _isLogin = "0";

  // 初始化时赋值
  LoginProvider(this._isLogin);

  void login() {
     _isLogin = "1";
      notifyListeners();
  }

  void logout() {
    _isLogin = "0";
    notifyListeners();
  }

  // 获取值
  get isLogin => _isLogin;
}
