import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LCTextField extends StatefulWidget {
  LCTextField({Key key}) : super(key: key);

  @override
  _LCTextFieldState createState() => _LCTextFieldState();
}

class _LCTextFieldState extends State<LCTextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          // controller: controller,
          maxLength: 30, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
          maxLines: 1, //最大行数
          autocorrect: true, //是否自动更正
          autofocus: true, //是否自动对焦
          // obscureText: true, //是否是密码
          textAlign: TextAlign.left, //文本对齐方式
          style: TextStyle(fontSize: 30.0, color: Colors.blue), //输入文本的样式
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly
          ], //允许的输入格式
          decoration: InputDecoration(
              fillColor: Colors.blue.shade100,
              filled: true,
              labelText: 'Hello'),
          onChanged: (text) {
            //内容改变的回调
            print('change $text');
          },
          onSubmitted: (text) {
            //内容提交(按回车)的回调
            print('submit $text');
          },
          enabled: true, //是否禁用
        ),
        TextField(
          decoration: InputDecoration(
              fillColor: Colors.blue.shade100,
              filled: true,
              helperText: 'help',
              labelText: 'Hello'),
          onChanged: (text) {
            //内容改变的回调
            print('change $text');
          },
          onSubmitted: (text) {
            //内容提交(按回车)的回调
            print('submit $text');
          },
        ),
        TextField(
          decoration: InputDecoration(
              fillColor: Colors.blue.shade100,
              filled: true,
              helperText: 'help',
              prefixIcon: Icon(Icons.local_airport),
              suffixText: 'airport'),
        ),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
              )),
        ),
        Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      height: 60.0,
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          border: new Border.all(color: Colors.black54, width: 4.0),
          borderRadius: new BorderRadius.circular(12.0)),
      child: new TextFormField(
        decoration: InputDecoration.collapsed(hintText: 'hello'),
      ),
    )
      ]),
    );
  }
}
