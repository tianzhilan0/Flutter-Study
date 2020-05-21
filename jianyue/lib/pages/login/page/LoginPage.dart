import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jianyue/commom/AppConfig.dart';
import 'package:jianyue/commom/LCTextField.dart';
import 'package:jianyue/commom/LoginProvider.dart';
import 'package:jianyue/commom/ValidatorConfig.dart';
import 'package:jianyue/manager/LCStorageManager.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //焦点
  FocusNode _focusNodePhone = FocusNode();
  FocusNode _focusNodePassWord = FocusNode();

  //用户名输入框控制器
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    // logo
    Widget headerArea() {
      return Container(
        alignment: Alignment.topCenter,
        // 设置图片为圆形
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/common/common_applogo.png",
                height: ScreenUtil().setWidth(180),
                width: ScreenUtil().setWidth(180),
                fit: BoxFit.cover,
              )),
          SizedBox(height: 10),
          Text(
            "每个人都是生活中的艺术家",
            style: TextStyle(fontSize: 15),
          )
        ]),
      );
    }

    // 输入框
    Widget inputTextArea() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: Divider.createBorderSide(context,
                            width: 0.6,
                            color: Theme.of(context).dividerColor))),
                child: LCTextField(
                  focusNode: _focusNodePhone,
                  controller: _phoneController,
                  placeHolder: '请输入手机号',
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  // beforeTitle: "手机号:",
                  // beforeTitleWidth: 100,
                )),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: Divider.createBorderSide(context,
                            width: 0.6,
                            color: Theme.of(context).dividerColor))),
                child: LCTextField(
                  focusNode: _focusNodePassWord,
                  controller: _passwordController,
                  placeHolder: '请输入密码',
                  isInputPwd: true,
                  rightTitle: "忘记密码",
                  rightTitleWidth: 80,
                  rightAction: forgotPassword,
                )),
          ]));
    }

    //登录
    Widget loginButtonArea() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  colors: [Colors.blue, Colors.blue[100]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                alignment: Alignment.center,
                child: Text(
                  "登录",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),

            onPressed: () {
              login();
            },
          ));
    }

    //新用户注册
    Widget bottomArea() {
      return Container(
        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text(
                "新用户注册",
                style: Theme.of(context).textTheme.body1,
              ),
              //点击快速注册、执行事件
              onPressed: register,
            )
          ],
        ),
      );
    }

    // 其他方式登录
    Widget marginArea() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(children: [
          Expanded(flex: 1, child: Divider()),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text("其他方式登录"),
          ),
          Expanded(flex: 1, child: Divider()),
        ]),
      );
    }

    Widget otherLoginArea() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            child: Column(children: [
              Image.asset(
                "images/common/common_login_weixin.png",
                width: 80,
                height: 80,
              ),
              Text("微信登录")
            ]),
            onTap: wechatLogin,
          ),
          InkWell(
            child: Column(children: [
              Image.asset(
                "images/common/common_login_qq.png",
                width: 80,
                height: 80,
              ),
              Text("QQ登录")
            ]),
            onTap: qqLogin,
          )
        ]),
      );
    }

    //隐私政策
    Widget foodArea() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          alignment: Alignment.center,
          child: InkWell(
            child: Text.rich(TextSpan(
                text: '登录即代表您已经同意',
                style: Theme.of(context).textTheme.body1,
                children: <TextSpan>[
                  TextSpan(
                      text: '《京东隐私政策》', style: TextStyle(color: Colors.blue)),
                ])),
            onTap: privacyPolicy,
          ));
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            FlatButton(onPressed: () {}, child: Text("帮助")),
          ],
        ),
        backgroundColor: Colors.white,
        body: GestureDetector(
            onTap: hiddenKeyboard,
            child: ListView(
              
              children: <Widget>[
              headerArea(),
              inputTextArea(),
              loginButtonArea(),
              bottomArea(),
              marginArea(),
              otherLoginArea(),
              foodArea()
            ])));
  }

  void hiddenKeyboard() {
    //点击登录按钮，解除焦点，回收键盘
    _focusNodePassWord.unfocus();
    _focusNodePhone.unfocus();
  }

  //登录
  login() {
    hiddenKeyboard();
    String phoneResult = ValidatorConfig.checkMobile(_phoneController.text);
    if (phoneResult.length != 0) {
      EasyLoading.showToast(phoneResult);
      return;
    }
    String passwordResult =
        ValidatorConfig.checkPassWord(_passwordController.text);
    if (passwordResult.length != 0) {
      EasyLoading.showToast(passwordResult);
      return;
    }

    print("${_phoneController.text} + ${_passwordController.text}");
    EasyLoading.show(status: 'loading...');

    Future.delayed(Duration(seconds: 2));
    Provider.of<LoginProvider>(context, listen: false).login();
    LCStorageManager().setValue(AppConfig.sp_isLogin, "1");
    EasyLoading.dismiss();
    // Map<String, dynamic> params = {
    //   "username": _phoneController.text,
    //   "password": _passwordController.text
    // };
    // LCWebRequstManager().request<LoginModel>(LCMethod.POST, RequestApi.login,
    //     params: params, success: (result) {
    //   Provider.of<LoginProvider>(context, listen: false).login();
    //   LCStorageConfig().setValue(AppConfig.sp_isLogin, "1");
    //   EasyLoading.dismiss();
    // }, error: (emsg) {
    //   // EasyLoading.dismiss();
    //   EasyLoading.showToast(emsg.message);
    // });
  }

  //忘记密码
  void forgotPassword() {
    hiddenKeyboard();
    Navigator.of(context).pushNamed("/forgotPassword",
        arguments: {"iphone": this._phoneController.text});
  }

  //注册
  void register() {
    hiddenKeyboard();
    var result =
        ValidatorConfig.checkMobile(this._phoneController.text); //验证手机号
    if (result.length == 0) {
      Navigator.of(context).pushNamed("/register",
          arguments: {"iphone": this._phoneController.text});
    } else {
      Navigator.of(context).pushNamed("/register", arguments: {"iphone": ""});
    }
  }

  //微信
  void wechatLogin() {}

  //QQ
  void qqLogin() {}
  //隐私政策
  void privacyPolicy() {
    Navigator.of(context).pushNamed("/webView", arguments: {
      "title": "隐私政策",
      "webURL": "https://in.m.jd.com/help/app/private_policy.html"
    });
  }
}
