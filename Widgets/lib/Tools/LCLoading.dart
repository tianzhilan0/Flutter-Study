import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LCLoading extends StatefulWidget {
  LCLoading({Key key}) : super(key: key);

  @override
  _LCLoadingState createState() => _LCLoadingState();
}

class _LCLoadingState extends State<LCLoading> {
  Timer _timer;
  double _progress;

  @override
  void initState() {
    super.initState();

    /// Schedule a callback for the end of this frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      EasyLoading.showSuccess('Use in initState!');
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('dismiss'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.dismiss();
                    },
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('show'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.show(status: 'loading...');
                    },
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('showProgress'),
                    onPressed: () {
                      _progress = 0;
                      _timer?.cancel();
                      _timer = Timer.periodic(const Duration(milliseconds: 100),
                          (Timer timer) {
                        EasyLoading.showProgress(_progress,
                            status: '${(_progress * 100).toStringAsFixed(0)}%');
                        _progress += 0.03;

                        if (_progress >= 1) {
                          _timer?.cancel();
                          EasyLoading.dismiss();
                        }
                      });
                    },
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('showSuccess'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showSuccess('Great Success!');
                    },
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('showError'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showError('Failed with Error');
                    },
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('showInfo'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showInfo('Useful Information.');
                    },
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('showToast'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showToast('Toast');
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('Style'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<EasyLoadingStyle>(
                        selectedColor: Colors.blue,
                        children: {
                          EasyLoadingStyle.dark: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("dark"),
                          ),
                          EasyLoadingStyle.light: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("light"),
                          ),
                          EasyLoadingStyle.custom: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("custom"),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.loadingStyle = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('MaskType'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<EasyLoadingMaskType>(
                        selectedColor: Colors.blue,
                        children: {
                          EasyLoadingMaskType.none: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("none"),
                          ),
                          EasyLoadingMaskType.clear: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("clear"),
                          ),
                          EasyLoadingMaskType.black: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("black"),
                          ),
                          EasyLoadingMaskType.custom: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("custom"),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.maskType = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Text('IndicatorType(total: 23)'),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child:
                          CupertinoSegmentedControl<EasyLoadingIndicatorType>(
                        selectedColor: Colors.blue,
                        children: {
                          EasyLoadingIndicatorType.circle: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("circle"),
                          ),
                          EasyLoadingIndicatorType.wave: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("wave"),
                          ),
                          EasyLoadingIndicatorType.ring: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("ring"),
                          ),
                          EasyLoadingIndicatorType.pulse: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("pulse"),
                          ),
                          EasyLoadingIndicatorType.cubeGrid: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("cubeGrid"),
                          ),
                          EasyLoadingIndicatorType.threeBounce: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("threeBounce"),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.indicatorType = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
