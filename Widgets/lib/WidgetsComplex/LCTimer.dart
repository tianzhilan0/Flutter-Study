import 'dart:async';

import 'package:flutter/material.dart';

class LCTimer extends StatefulWidget {
  LCTimer({Key key}) : super(key: key);

  @override
  _LCTimerState createState() => _LCTimerState();
}

class _LCTimerState extends State<LCTimer> {
  Timer _timer;
  int _countdownTime = 0;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            if (_countdownTime == 0) {
              setState(() {
                _countdownTime = 60;
              });
              //开始倒计时
              startCountdownTimer();
            }
          },
          child: Text(
            _countdownTime > 0 ? '$_countdownTime后重新获取' : '获取验证码',
            style: TextStyle(
              fontSize: 14,
              color: _countdownTime > 0
                  ? Color.fromARGB(255, 183, 184, 195)
                  : Color.fromARGB(255, 17, 132, 255),
            ),
          ),
        )
      ]),
    );
  }

  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) {
          setState(() {
            if (_countdownTime < 1) {
              _timer.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          });
        };

    _timer = Timer.periodic(oneSec, callback);
  }
}
