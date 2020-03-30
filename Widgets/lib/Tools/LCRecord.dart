import 'package:flutter/material.dart';
import 'package:flutter_plugin_record/flutter_plugin_record.dart';

class LCRecord extends StatefulWidget {
  LCRecord({Key key}) : super(key: key);

  @override
  _LCRecordState createState() => _LCRecordState();
}

class _LCRecordState extends State<LCRecord> {
  FlutterPluginRecord recordPlugin = FlutterPluginRecord();
  String filePath = "";

  @override
  void dispose() {
    recordPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    ///初始化方法的监听
    recordPlugin.responseFromInit.listen((data) {
      if (data) {
        print("初始化成功");
      } else {
        print("初始化失败");
      }
    });

    /// 开始录制或结束录制的监听
    recordPlugin.response.listen((data) {
      if (data.msg == "onStop") {
        ///结束录制时会返回录制文件的地址方便上传服务器
        print("onStop  文件路径" + data.path);
        filePath = data.path;
        print("onStop  时长 " + data.audioTimeLength.toString());
      } else if (data.msg == "onStart") {
        print("onStart --");
      } else {
        print("--" + data.msg);
      }
    });

    ///录制过程监听录制的声音的大小 方便做语音动画显示图片的样式
    recordPlugin.responseFromAmplitude.listen((data) {
      var voiceData = double.parse(data.msg);
      print("振幅大小   " + voiceData.toString());
    });

    recordPlugin.responsePlayStateController.listen((data) {
      print("播放路径   " + data.playPath);
      print("播放状态   " + data.playState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("录音")),
      body: Column(children: [
        FlatButton(
          child: Text("初始化"),
          onPressed: () {
            _init();
          },
        ),
        FlatButton(
          child: Text("开始录制"),
          onPressed: () {
            start();
          },
        ),
        FlatButton(
          child: Text("停止录制"),
          onPressed: () {
            stop();
          },
        ),
        FlatButton(
          child: Text("播放"),
          onPressed: () {
            play();
          },
        ),
        FlatButton(
          child: Text("播放本地指定路径录音文件"),
          onPressed: () {
            playByPath(filePath);
          },
        ),
      ]),
    );
  }

  ///初始化语音录制的方法
  void _init() async {
    recordPlugin.init();
  }

  ///开始语音录制的方法
  void start() async {
    recordPlugin.start();
  }

  ///停止语音录制的方法
  void stop() {
    recordPlugin.stop();
  }

  ///播放语音的方法
  void play() {
    recordPlugin.play();
  }

  ///播放指定路径录音文件
  void playByPath(String path) {
    recordPlugin.playByPath(path);
  }
}
