import 'package:first/config/LCStorageConfig.dart';
import 'package:first/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:first/config/AppConfig.dart';
import 'package:provider/provider.dart';

class LCLoginPage extends StatefulWidget {
  LCLoginPage({Key key}) : super(key: key);

  @override
  _LCLoginPageState createState() => _LCLoginPageState();
}

class _LCLoginPageState extends State<LCLoginPage> {
  //焦点
  FocusNode _focusNodeUserName = FocusNode();
  FocusNode _focusNodePassWord = FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    super.initState();
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  /*
   * 验证用户名
   */
  String validateUserName(value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  /*
   * 验证密码
   */
  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    Widget headerArea() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          alignment: Alignment.topCenter,
          // 设置图片为圆形
          child: Image.asset(
            "assets/images/applogo.png",
            height: ScreenUtil().setWidth(180),
            width: ScreenUtil().setWidth(180),
            fit: BoxFit.cover,
          ),
        )
      ]);
    }

    Widget inputTextArea() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(8)),
          //     color: Colors.white),
          child: Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                TextFormField(
                  controller: _userNameController,
                  focusNode: _focusNodeUserName,
                  //设置键盘类型
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    // labelText: "用户名",
                    hintText: "请输入手机号",
                    prefixIcon: Icon(Icons.person),
                    //尾部添加清除按钮
                    suffixIcon: (_isShowClear)
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              // 清空输入框内容
                              _userNameController.clear();
                            },
                          )
                        : null,
                  ),
                  //验证用户名
                  validator: validateUserName,
                  //保存数据
                  onSaved: (String value) {
                    _username = value;
                  },
                ),
                TextFormField(
                  focusNode: _focusNodePassWord,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      // labelText: "密码",
                      hintText: "请输入密码",
                      prefixIcon: Icon(Icons.lock),
                      // 是否显示密码
                      suffixIcon: IconButton(
                        icon: Icon((_isShowPwd)
                            ? Icons.visibility
                            : Icons.visibility_off),
                        // 点击改变显示或隐藏密码
                        onPressed: () {
                          setState(() {
                            _isShowPwd = !_isShowPwd;
                          });
                        },
                      )),
                  obscureText: !_isShowPwd,
                  //密码验证
                  validator: validatePassWord,
                  //保存数据
                  onSaved: (String value) {
                    _password = value;
                  },
                )
              ])));
    }

    // 登录按钮区域
    Widget loginButtonArea() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 45.0,
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              "登录",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            // 设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              //点击登录按钮，解除焦点，回收键盘
              _focusNodePassWord.unfocus();
              _focusNodeUserName.unfocus();

              if (_formKey.currentState.validate()) {
                //只有输入通过验证，才会执行这里
                _formKey.currentState.save();
                // 登录操作
                EasyLoading.show(status: 'loading...');
                print("$_username + $_password");

                Future.delayed(Duration(seconds: 3)).then((_) {
                  EasyLoading.dismiss();
                  LCStorageConfig().setValue(AppConfig.sp_isLogin, "1");
                  Provider.of<LoginProvider>(context, listen: false).login();
                });
              }
            },
          ));
    }

    //忘记密码  立即注册
    Widget bottomArea() {
      return Container(
        margin: EdgeInsets.only(right: 20, left: 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Text(
                "忘记密码?",
                style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 16.0,
                ),
              ),
              //忘记密码按钮，点击执行事件
              onPressed: () {
                // Navigator.of(context).pushNamed("/register");
              },
            ),
            FlatButton(
              child: Text(
                "快速注册",
                style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 16.0,
                ),
              ),
              //点击快速注册、执行事件
              onPressed: () {
                Navigator.of(context).pushNamed("/register",arguments: {"iphone":""});
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: GestureDetector(
            onTap: () {
              // 点击空白区域，回收键盘
              _focusNodePassWord.unfocus();
              _focusNodeUserName.unfocus();
            },
            child: ListView(children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(80)),
              headerArea(),
              SizedBox(height: ScreenUtil().setHeight(40)),
              inputTextArea(),
              SizedBox(height: ScreenUtil().setHeight(40)),
              loginButtonArea(),
              SizedBox(height: ScreenUtil().setHeight(20)),
              bottomArea()
            ])));
  }
}
