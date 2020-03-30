import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LCVideoPlayer extends StatefulWidget {
  LCVideoPlayer({Key key}) : super(key: key);

  @override
  _LCVideoPlayerState createState() => _LCVideoPlayerState();
}

class _LCVideoPlayerState extends State<LCVideoPlayer> {
  VideoPlayerController _controller;
  VideoProgressIndicator _progress;
  // String url = 'https://www.runoob.com/try/demo_source/movie.mp4';
  String url =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      this.url,
      // closedCaptionFile: _loadCaptions(),
    );

    _progress = VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                              playedColor: Colors.green, //播放颜色
                              backgroundColor: Colors.brown, //背景色
                              bufferedColor: Colors.orange //缓冲颜色
                              ),
                        );
    // 播放状态
    _controller.addListener(() {
      print("duration ==  ${_controller.value.duration}");
      print("size == ${_controller.value.size}");
      print("position == ${_controller.value.position}");
      print("isPlaying == ${_controller.value.isPlaying}");
      print("buffered == ${_controller.value.buffered}");

      // print("allowScrubbing == ${_progress.allowScrubbing}");

      setState(() {
      });
    });
    //是否循环播放
    _controller.setLooping(false);
    // 在初始化完成后必须更新界面
    _controller.initialize().then((_) {
      starVideo();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("视频播放")),
        body: Column(children: [
          Center(
            child: _controller.value.initialized
                // 加载成功
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        ClosedCaption(text: _controller.value.caption.text),
                        // _PlayPauseOverlay(controller: _controller),
                        _progress,
                      ],
                    ),
                  )
                : Container(),
          ),
          Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                    child: Text("开始"),
                    onPressed: () {
                      starVideo();
                    }),
                RaisedButton(
                    child: Text("暂停"),
                    onPressed: () {
                      pauseVideo();
                    }),
                RaisedButton(child: Text("开始"), onPressed: starVideo),
                RaisedButton(child: Text("开始"), onPressed: starVideo),
              ])
        ]));
  }

  starVideo() {
    setState(() {
      if (!_controller.value.isPlaying) {
        print("开始");
        _controller.play();
      }
    });
  }

  pauseVideo() {
    setState(() {
      if (_controller.value.isPlaying) {
        print("暂停");
        _controller.pause();
      }
    });
  }
}
