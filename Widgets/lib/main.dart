import 'package:flutter/material.dart';
import 'package:demo2/MyHomePage.dart';
//基础类 Widget
import 'package:demo2/Widgets/LCText.dart';
import 'package:demo2/Widgets/LCButton.dart';
import 'package:demo2/Widgets/LCImage.dart';
import 'package:demo2/Widgets/LCCheckBox.dart';
import 'package:demo2/Widgets/LCSwitch.dart';
//容器类 Widget
import 'package:demo2/Widgets/LCPadding.dart';
import 'package:demo2/Widgets/LCConstrainedBox.dart';
import 'package:demo2/Widgets/LCDecoratedBox.dart';
import 'package:demo2/Widgets/LCTransform.dart';
import 'package:demo2/Widgets/LCRotatedBox.dart';
import 'package:demo2/Widgets/LCContainer.dart';
//布局类 Widget
import 'package:demo2/Widgets/LCRow.dart';
import 'package:demo2/Widgets/LCColumn.dart';
import 'package:demo2/Widgets/LCFlex.dart';
import 'package:demo2/Widgets/LCWrap.dart';
import 'package:demo2/Widgets/LCStack.dart';
import 'package:demo2/Widgets/LCAlign.dart';
import 'package:demo2/Widgets/LCFittedBox.dart';
import 'package:demo2/Widgets/LCAspectRatio.dart';
import 'package:demo2/Widgets/LCBaseline.dart';
import 'package:demo2/Widgets/LCFractionallySizedBox.dart';
import 'package:demo2/Widgets/LCLimitedBox.dart';
import 'package:demo2/Widgets/LCOffstage.dart';
import 'package:demo2/Widgets/LCOverflowBox.dart';
import 'package:demo2/Widgets/LCSizedOverflowBox.dart';
//滚动布局
//SingleChildScrollView
//ListView
//GridView
//CustomScrollView



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder> {
        
        //基础类 Widget
        '/text': (_) => LCText(),
        '/button': (_) => LCButton(),
        '/image': (_) => LCImage(),
        '/checkbox': (_) => LCCheckBox(),
        '/switch': (_) => LCSwitch(),
        
        //容器类 Widget
        '/padding': (_) => LCPadding(),
        '/constrainedbox': (_) => LCConstrainedBox(),
        '/decoratedbox': (_) => LCDecoratedBox(),
        '/transform': (_) => LCTransform(),
        '/rotatedbox': (_) => LCRotatedBox(),
        '/container': (_) => LCContainer(),
        
        //布局类 Widget
        '/row': (_) => LCRow(),
        '/column': (_) => LCColumn(),
        '/flex': (_) => LCFlex(),
        '/wrap': (_) => LCWrap(),
        '/stack': (_) => LCStack(),
        '/align': (_) => LCAlign(),
        '/fittedbox': (_) => LCFittedBox(),
        '/aspectratio': (_) => LCAspectRatio(),
        '/baseline': (_) => LCBaseline(),
        '/fractionallySizedBox': (_) => LCFractionallySizedBox(),
        '/limitedBox': (_) => LCLimitedBox(),
        '/offstage': (_) => LCOffstage(),
        '/overflowBox': (_) => LCOverflowBox(),
        '/sizedOverflowBox': (_) => LCSizedOverflowBox(),
      },
    );
  }
}