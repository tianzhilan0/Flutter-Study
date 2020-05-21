import 'package:flutter/material.dart';
import 'package:jianyue/commom/LCMedia.dart';
import 'package:jianyue/commom/LCUI.dart';
import 'package:jianyue/manager/LCAppManager.dart';

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