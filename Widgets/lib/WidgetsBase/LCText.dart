import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LCText extends StatelessWidget {
  const LCText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '学习Text',
              textAlign: TextAlign.center, //文本对齐方式  居中
              textDirection: TextDirection.ltr, //文本方向
              softWrap: false, //是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
              overflow: TextOverflow
                  .ellipsis, //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
              textScaleFactor: 2.0, //字体显示的赔率
              maxLines: 10, //最大行数
              style: TextStyle(
                decorationColor: const Color(0x00000000), //线的颜色
                decoration: TextDecoration
                    .none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                decorationStyle: TextDecorationStyle
                    .solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
                fontStyle: FontStyle.italic, //文字样式，斜体和正常
                fontSize: 20.0, //字体大小
                fontWeight: FontWeight.w900, //字体粗细  粗体和正常
                color: const Color(0x33333333), //文字颜色
              ),
            ),
            Text.rich(TextSpan(
              text: 'TextSpan',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 30.0,
                decoration: TextDecoration.none,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '拼接1',
                ),
                TextSpan(
                  text: '拼接2',
                ),
                TextSpan(
                  text: '拼接3',
                ),
                TextSpan(
                  text: '拼接4',
                ),
                TextSpan(
                  text: '拼接5',
                ),
                TextSpan(
                  text: '拼接6',
                ),
                TextSpan(
                  text: '拼接7',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //增加一个点击事件
                      print(
                          '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                    },
                ),
              ],
            )),
            Text(
              "文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四文本四",
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 0.8,
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            )
          ],
        ));
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
