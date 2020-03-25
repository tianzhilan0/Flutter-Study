import 'package:flutter/material.dart';

class LCBaseline extends StatelessWidget {
  const LCBaseline({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text("Baseline")),
            body: Column(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Baseline(
                      baseline: 50.0,
                      baselineType: TextBaseline.ideographic,
                      child: Text(
                        'TjTjTj',
                        style: TextStyle(
                          fontSize: 20.0,
                          textBaseline: TextBaseline.ideographic,
                        ),
                      ),
                    ),
                    Baseline(
                      baseline: 50.0,
                      baselineType: TextBaseline.alphabetic,
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Baseline(
                      baseline: 50.0,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        'RyRyRy',
                        style: TextStyle(
                          fontSize: 35.0,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Baseline(
                      baseline: 80.0,
                      baselineType: TextBaseline.ideographic,
                      child: Text(
                        'AaBbCc',
                        style: TextStyle(
                          fontSize: 18.0,
                          textBaseline: TextBaseline.ideographic,
                        ),
                      ),
                    ),
                    Baseline(
                      baseline: 80.0,
                      baselineType: TextBaseline.alphabetic,
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        color: Colors.green,
                      ),
                    ),
                    Baseline(
                      baseline: 80.0,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        'DdEeFf',
                        style: TextStyle(
                          fontSize: 26.0,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }
}
