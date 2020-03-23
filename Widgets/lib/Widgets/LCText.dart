import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LCText extends StatelessWidget {
  const LCText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Text'),
        ),
        body:ListView(
          children: <Widget>[
            Text(
              "文本一",
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,

              style: new TextStyle(
                color: Colors.red,
                fontSize: 30
                ),
            ),
            Text(
              "文本二",
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,

              style: new TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.w100,
                letterSpacing: 20.0,
                ),
            ),
            Text(
              "文本三",
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,

              style: new TextStyle(
                color: Colors.red,
                fontSize: 30,
                backgroundColor: Colors.black
                ),
            ),
            Text(
              "文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四",
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 0.8,
              style: new TextStyle(
                color: Colors.red,
                fontSize: 30,
                ),
            )
          ],
        )
      ),
    );
  }
}


// const Text(
//     this.data, {//要展示的数据内容，必须填写的参数
//     Key key,
//     this.style,//text类型，一般使用TextStyle
//     this.strutStyle,//StrutStyle,影响Text在垂直方向上的布局
//     this.textAlign,//TextAlign,内容对齐方式
//     this.textDirection,//TextDirection,内容的走向方式
//     this.locale,//Locale，当相同的Unicode字符可以根据不同的地区以不同的方式呈现时，用于选择字体 
//     this.softWrap,//bool 文本是否应在软换行时断行
//     this.overflow,//TextOverflow，内容溢出时的处理方式
//     this.textScaleFactor,//double 设置文字的放大缩小，例如，fontSize=10，this.textScaleFactor=2.0，最终得到的文字大小为10*2.0
//     this.maxLines,//int 设置文字的最大展示行数
//     this.semanticsLabel,//string,语义描述标签，相当于此text的别名
//     this.textWidthBasis,//TextWidthBasis 测量一行或多行文本宽度
// })