import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画学习'),
        ),
        body: ListView(children: [
          // TestAnimation(),
          TweenAnimation(),
        ]));
  }
}


class TestAnimation extends StatefulWidget {
  TestAnimation({Key key}) : super(key: key);

  @override
  _TestAnimationState createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation> with SingleTickerProviderStateMixin {

   Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
//lowerBound和upperBound值只能在0.0到1.0之间变化
    _animationController = new AnimationController(vsync: this,lowerBound: 0.0,upperBound: 0.5,duration: new Duration(milliseconds: 2000));
// 添加监听
    _animationController.addListener((){
      setState(() { });
    });
// 开启动画
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Container(
          // 取AnimationController 对象value直接用
          width: _animationController.value*300,
          height: _animationController.value*300,
          child: new FlutterLogo(),
        ),
      );
  }

   @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


class TweenAnimation extends StatefulWidget {
  TweenAnimation({Key key}) : super(key: key);

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;
  Tween<double> _sizeTween;
  Tween<Color> _colorTween;

    @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(vsync: this,duration: new Duration(milliseconds: 3000));
    _animation = new CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
      ..addListener((){
        setState(() {
        });
      });
    _sizeTween = new Tween(begin: 0.0,end: 300.0);
    _colorTween = new ColorTween(begin: Colors.transparent,end: Colors.amberAccent);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: _colorTween.evaluate(_animation),
          width: _sizeTween.evaluate(_animation),
          height: _sizeTween.evaluate(_animation),
        // color: Colors.orange,
          // width: _animation.value,
          // height: _animation.value,
        ),
      );
  }
   @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}