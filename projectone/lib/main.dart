import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MyApp.dart';
import 'config/AppLoading.dart';
import 'config/LCStorageConfig.dart';

void main() async {
  // 确保初始化
  WidgetsFlutterBinding.ensureInitialized();
  // Loading配置
  appLoadingConfig();

    /// 配置初始化
  await LCStorageConfig().init();

  runApp(MyApp());

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



