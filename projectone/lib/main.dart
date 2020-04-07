import 'dart:io';

import 'package:first/config/AppConfig.dart';
import 'package:first/config/LCStorageConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MyApp.dart';
import 'config/AppLoading.dart';

void main() async {
  // 确保初始化
  WidgetsFlutterBinding.ensureInitialized();
  // Loading配置
  appLoadingConfig();

  // await LCStorageConfig().init();
  // String isLogin = await LCStorageConfig().getValue(AppConfig.sp_isLogin);
String isLogin = '0';
  runApp(MyApp(isLogin: isLogin,));

  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return Center(child: Text("App错误，快去反馈给作者!"));
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



