
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LCRxDart extends StatefulWidget {
  LCRxDart({Key key}) : super(key: key);

  @override
  _LCRxDartState createState() => _LCRxDartState();
}

class _LCRxDartState extends State<LCRxDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart')),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();
    // 创建Observable的几种方法
  //  Observable<String> _observable = Observable(Stream.fromIterable(['Hello', 'World']));
//    Observable<String> _observable = Observable.fromFuture(Future.value('Future创建的'));
//    Observable<String> _observable = Observable.just('just创建的');
    // 使用 periodic 这个工厂方法可以创建在指定时间间隔重复触发事件的 observable
    // Duration ：间隔的时间，后面提供重复要做的方法，这个方法可以接收一个参数就是重复的次数用x来表示，在方法里可以制作并且返回每次的数据，这里返回每间隔3秒中返回重复的次数
//    Observable<String> _observable = Observable.periodic(Duration(seconds: 3), (x) => x.toString());
//    _observable.listen(print);

    // 使用subject控制Observable
    // PublishSubject 需要先设置监听再添加数据才能监听到
//    PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject 可以把最后一次添加的数据作为第一个项目交给新来的监听
//    BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // ReplaySubject 把添加到subject的数据全部交给监听器，maxSize可以设置最大接收数据的个数
  //  ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 1);

  //  _subject.add('add Data 1');
  //  _subject.add('add Data 2');
  //  _subject.listen((data) => print('listen 1: $data'));
  //  _subject.add('add Data 3');
  //  _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
  //  _subject.add('add Data 4');
  //  _subject.close();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
       .map((item) => 'item : $item') // RxDart利用 map 可以实现数据转换
      //  .where((item) => item.length > 10) // RxDart利用 where 可以给数据添加筛选条件
        // .debounce(Duration(milliseconds: 500)) // debounce 设置一个间隔的时间，用户停止输入以后过了这个时间才会让数据通过
        .listen((data) => print(data));
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.redAccent),
      child: TextField(
        decoration: InputDecoration(labelText: 'Title', filled: true),
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
      ),
    );
  }
}