import 'package:flutter/material.dart';

import 'AppConfig.dart';

class MaterialAppConfig {
  final String appName;
  final String appLink;
  final ThemeData theme;
  final bool showPerformanceOverlay;
  final Iterable<Locale> supportedLocales;
  
  MaterialAppConfig(
      {this.appName,
      this.appLink,
      this.theme,
      this.showPerformanceOverlay,
      this.supportedLocales});
}

MaterialAppConfig get appConfig {
  return new MaterialAppConfig(
      appName: AppConfig.appName,
      appLink: '',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
        primaryColor:Colors.lightBlue,
        backgroundColor: Color.fromRGBO(248, 246, 252, 1),
        dividerColor: Color.fromRGBO(158, 158, 158, 1),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
        ),
        //导航图标
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
        textTheme: TextTheme(
          //导航标题
          title: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
          subtitle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          subhead: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
          //登录按钮
          button: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
          //一级标题
          display1: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
          //二级标题
          display2: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          //普通标题
          display3: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          //描述
          display4: TextStyle(
            color: Colors.black38,
            fontSize: 15,
            fontWeight: FontWeight.w400
          ),
          //text 默认设置
          body1: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          body2: TextStyle(
            color: Colors.lightBlue,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        )
      ),
      showPerformanceOverlay: false,
      supportedLocales: [
        Locale('en', ''),
        Locale('zh', 'CN'),
      ]);
}
