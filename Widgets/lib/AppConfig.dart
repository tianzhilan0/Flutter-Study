import 'package:flutter/material.dart';

class AppConfig {
  final String appName;
  final String appLink;
  final ThemeData theme;
  final bool showPerformanceOverlay;

  AppConfig(
      {this.appName, this.appLink, this.theme, this.showPerformanceOverlay});
}


AppConfig get defaultConfig {
  return new AppConfig(
    appName: 'Flutter-Study',
    appLink: '',
    theme: new ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.lightBlue,
    ),
    showPerformanceOverlay: false,
  );
}