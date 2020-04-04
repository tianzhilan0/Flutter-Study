import 'package:first/config/ValidatorConfig.dart';
import 'package:first/widgets/base/LCTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LCRegisterPage extends StatefulWidget {
  final Map<String, dynamic> arguments;
  LCRegisterPage({Key key, this.arguments}) : super(key: key);

  @override
  _LCRegisterPageState createState() => _LCRegisterPageState();
}

class _LCRegisterPageState extends State<LCRegisterPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  TextEditingController _paswordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  FocusNode _focusNodePhone = FocusNode();
  FocusNode _focusNodeVcode = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodeRePassword = FocusNode();

  int isAgree = 0;

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.arguments["iphone"];
  }

  @override
  void dispose() {
    //定时器清除
    _phoneController.clear();
    _vCodeController.clear();
    _paswordController.clear();
    _rePasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    Widget inputArea() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: Divider.createBorderSide(context,
                          width: 0.6, color: Theme.of(context).dividerColor))),
              child: LCTextField(
                focusNode: _focusNodePhone,
                controller: _phoneController,
                placeHolder: '请输入手机号',
                maxLength: 11,
                keyboardType: TextInputType.phone,
                beforeTitle: "手机号码：",
                beforeTitleWidth: 90,
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: Divider.createBorderSide(context,
                          width: 0.6, color: Theme.of(context).dividerColor))),
              child: LCTextField(
                  key: lcTextFieldKey,
                  focusNode: _focusNodeVcode,
                  controller: _vCodeController,
                  placeHolder: '请输入六位验证码',
                  maxLength: 6,
                  keyboardType: TextInputType.phone,
                  beforeTitle: "验证码：",
                  beforeTitleWidth: 90,
                  isAvailableVCode: true,
                  vCodeAction: getVCode)),
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: Divider.createBorderSide(context,
                          width: 0.6, color: Theme.of(context).dividerColor))),
              child: LCTextField(
                focusNode: _focusNodePassword,
                controller: _paswordController,
                placeHolder: '请设置密码（6-20位）',
                isInputPwd: true,
                beforeTitle: "密码：",
                beforeTitleWidth: 90,
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: Divider.createBorderSide(context,
                          width: 0.6, color: Theme.of(context).dividerColor))),
              child: LCTextField(
                focusNode: _focusNodeRePassword,
                controller: _rePasswordController,
                placeHolder: '请再次输入密码',
                isInputPwd: true,
                beforeTitle: "确认密码：",
                beforeTitleWidth: 90,
              )),
        ]),
      );
    }

    Widget agreeArea() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 40),
        alignment: Alignment.centerLeft,
        child: Row(children: [
          Radio(
            groupValue: isAgree,
            activeColor: Colors.red,
            value: 1,
            onChanged: (_) {
              print("选择 Radio");
              this.setState(() {
                isAgree = 1;
              });
            },
          ),
          InkWell(
            child: Text.rich(TextSpan(
                text: "我已阅读并同意",
                style: Theme.of(context).textTheme.body1,
                children: <TextSpan>[
                  TextSpan(
                      text: '《京东用户注册协议》',
                      style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),)
                ])),
            onTap: registerPolicy,
          )
        ]),
      );
    }

    Widget registerArea() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          height: 60.0,
          child: RaisedButton(
            color: Color.fromARGB(0, 0, 0, 0),
            clipBehavior: Clip.hardEdge,
            // 设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.all(0.0),

            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.red, Colors.red[200]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                alignment: Alignment.center,
                child: Text(
                  "注册",
                  style: Theme.of(context).textTheme.title,
                )),

            onPressed: register,
          ));
    }

    Widget fooderArea(){
      return Container(
        margin: EdgeInsets.only(top:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(Icons.phone),
            InkWell(
            child: Text.rich(TextSpan(
                text: "遇到问题？请",
                style: Theme.of(context).textTheme.body1,
                children: <TextSpan>[
                  TextSpan(
                      text: '联系客服',
                      style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),)
                ])),
            onTap: registerPolicy,
          )
          ]
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          "注册",
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
          onTap: hiddenKeyboard,
          child: ListView(
            children: <Widget>[inputArea(), agreeArea(), registerArea(), fooderArea()],
          )),
    );
  }

  //收起键盘
  hiddenKeyboard() {
    _focusNodePhone.unfocus();
    _focusNodeVcode.unfocus();
    _focusNodePassword.unfocus();
    _focusNodeRePassword.unfocus();
  }

  //获取验证码
  getVCode() {
    hiddenKeyboard();
    String result = ValidatorConfig.checkMobile(_phoneController.text);
    if (result.length == 0) {
      print("开始获取验证码");
      lcTextFieldKey.currentState.starTimer();
      Future.delayed(Duration(seconds: 2)).then((_) {
        print("验证码为000000");
      });
    } else {
      EasyLoading.showToast(result);
      // throw;
    }
  }
  //注册
  register() {}

  //注册协议
  registerPolicy(){

  }
}
