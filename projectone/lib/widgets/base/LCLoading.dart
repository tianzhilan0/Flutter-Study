import 'package:flutter/material.dart';

class LCLoading extends StatelessWidget {
  const LCLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Container(width: 10, height: 10),
          Text(
            '数据加载中',
            style: TextStyle(color: Color.fromRGBO(115, 115, 115, 1.0)),
          )
        ],
      ),
    );
  }
}