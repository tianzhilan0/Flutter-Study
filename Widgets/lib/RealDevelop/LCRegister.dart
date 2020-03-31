import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LCRegister extends StatefulWidget {
  LCRegister({Key key}) : super(key: key);

  @override
  _LCRegisterState createState() => _LCRegisterState();
}

class _LCRegisterState extends State<LCRegister> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _veriCode = TextEditingController();
  FocusNode _mobileFocus = FocusNode();
  FocusNode _veriFocus = FocusNode();
  Timer _timer;
  int _start = 60;

  void countdown() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel(); //定时器清除
            _start = 60;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    //定时器清除
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    // logo 图片区域
    Widget logoImageArea = Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形
      child: Image.asset(
        "assets/images/applogo.png",
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );

    Widget usernameArea = Container(
        margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20.0),
            ScreenUtil().setHeight(20.0), ScreenUtil().setHeight(20.0), 0),
        width: ScreenUtil().setWidth(710),
        height: ScreenUtil().setHeight(90),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(160),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("+86",
                      style: TextStyle(fontSize: ScreenUtil().setSp(28.0))),
                  Icon(Icons.arrow_drop_down, size: 30.0)
                ],
              ),
            ),
            Expanded(
              child: TextFormField(
                focusNode: _mobileFocus,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '请输入手机号',
                  border: InputBorder.none,
                ),
                controller: _mobile,
              ),
            )
          ],
        ));

    Widget vcodeArea = Container(
        margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20.0),
            ScreenUtil().setHeight(20.0), ScreenUtil().setHeight(20.0), 0),
        width: ScreenUtil().setWidth(710),
        height: ScreenUtil().setHeight(90),
        child: Row(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              width: ScreenUtil().setWidth(444),
              height: ScreenUtil().setWidth(90),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Center(
                        child: Text("验证码",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(28.0),
                            )),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        focusNode: _veriFocus,
                        controller: _veriCode,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "请输入验证码",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ])),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Builder(builder: (BuildContext context) {
                    return FlatButton(
                        onPressed: clickVcode,
                        color: _start == 60 ? Colors.blue : Colors.grey,
                        textColor: _start == 60 ? Colors.white : Colors.black54,
                        child: Container(
                          height: ScreenUtil().setHeight(80),
                          child: Center(
                            child: Text(_start == 60 ? "获取验证码" : "${_start} S"),
                          ),
                        ));
                  })))
        ]));

    Widget loginArea = Container(
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20.0),
          ScreenUtil().setHeight(20.0), ScreenUtil().setHeight(20.0), 0),
      child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text("登录"),
          onPressed: () async{
            setState(() {
              _veriFocus.unfocus();
            _mobileFocus.unfocus();
            });
            // Scaffold.of(context).hideCurrentSnackBar();
            // Scaffold.of(context).showSnackBar(SnackBar(
            //     duration: Duration(seconds: 1),
            //     backgroundColor: Colors.green,
            //     content: new Text("注册成功")));
          }),
    );

    Widget forgetArea = Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20.0),
          ScreenUtil().setHeight(20.0), ScreenUtil().setHeight(20.0), 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FlatButton(onPressed: () {}, child: Text("忘记密码？")),
        FlatButton(onPressed: () {}, child: Text("立即注册"))
      ]),
    );

    return Scaffold(
      appBar: AppBar(title: Text("验证码登录")),
      body: GestureDetector(
          onTap: () {
            // 点击空白区域，回收键盘
            print("点击了空白区域");
            _mobileFocus.unfocus();
            _veriFocus.unfocus();
          },
          child: ListView(
            children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(80)),
              logoImageArea,
              SizedBox(height: ScreenUtil().setHeight(40)),
              usernameArea,
              // SizedBox(height: ScreenUtil().setHeight(10)),
              vcodeArea,
              loginArea,
              forgetArea,
            ],
          )),
    );
  }

  clickVcode() {
    _mobileFocus.unfocus();
    if (_start != 60) {
      //简单判断是否可以触发获取验证
      return null;
    }
    var result = Validator.checkMobile(this._mobile.text); //验证手机号
    if (result == true) {
      print("验证通过");
      countdown();
    } else {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.orangeAccent,
          content: new Text(result)));
    }
  }
}

class Validator {
  static checkMobile(value) {
    if (value.isEmpty) {
      return "请输入手机号";
    }
    RegExp reg = new RegExp(r'^\d{11}$');
    if (!reg.hasMatch(value)) {
      return "请输入11位手机号码";
    }
    return true;
  }
}
