import 'package:flutter/material.dart';

class LCBaseline extends StatelessWidget {
  const LCBaseline({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Baseline")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Baseline(
                baseline: 50.0,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'TjTjTj',
                  style: TextStyle(
                    fontSize: 20.0,
                    textBaseline: TextBaseline.alphabetic,
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
      ),
    );
  }
}
