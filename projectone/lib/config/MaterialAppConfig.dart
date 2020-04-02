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
      ),
      showPerformanceOverlay: false,
      supportedLocales: [
        Locale('en', ''),
        Locale('zh', 'CN'),
      ]);
}
