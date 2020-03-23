import 'package:flutter/material.dart';
import 'package:nonghang/commom/LCMedia.dart';
import 'package:nonghang/commom/LCUI.dart';
import 'package:nonghang/manager/LCAppManager.dart';

class LCLoading extends StatelessWidget {
  const LCLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: winWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          LCSpace(),
          Text(
            '数据加载中',
            style: TextStyle(color: mainTextColor),
          )
        ],
      ),
    );
  }
}