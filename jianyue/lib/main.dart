import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jianyue/commom/AppConfig.dart';
import './manager/LCStorageManager.dart';
import './MyApp.dart';

void main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 配置初始化
  await LCStorageManager().init();
  String isLogin = await LCStorageManager().getValue(AppConfig.sp_isLogin);

  // App入口
  runApp(MyApp(isLogin: isLogin,));


  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return new Center(child: new Text(""));//App错误，快去反馈给作者!
  };

  /// Android状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
