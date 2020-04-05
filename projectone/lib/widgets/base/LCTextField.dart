import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<_LCTextFieldState> lcTextFieldKey = GlobalKey();

class LCTextField extends StatefulWidget {
  final TextEditingController controller;

  /// 最大长度
  final int maxLength;
  final bool autoFocus; //是否自动获得焦点 比如进入搜索页面 一进页面就调起键盘
  final TextInputType keyboardType;
  final FocusNode focusNode; //焦点
  final String placeHolder;
  final bool isInputPwd;
  final bool isAvailableVCode;
  final Function vCodeAction;

  final String beforeTitle;
  final double beforeTitleWidth;

  final String rightTitle;
  final double rightTitleWidth;
  final Function rightAction;

  /// 倒计时的秒数，默认60秒。
  final int countdown;

  LCTextField(
      {Key key,
      this.controller,
      this.maxLength,
      this.autoFocus = false,
      this.keyboardType,
      this.focusNode,
      this.placeHolder = "",
      this.isInputPwd = false,
      this.vCodeAction,
      this.countdown = 60,
      this.beforeTitle = "",
      this.beforeTitleWidth = 0,
      this.rightTitle = "",
      this.rightTitleWidth = 0,
      this.rightAction,
      this.isAvailableVCode = false})
      : super(key: key);

  @override
  _LCTextFieldState createState() => _LCTextFieldState();
}

class _LCTextFieldState extends State<LCTextField> {
  bool _isShowDelete = true; //是否显示删除
  bool _isShowPwd = false;
  bool _isAvailableGetVCode = false; //是否可以获取验证码，默认为`false`
  String _verifyStr = '验证码';

  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {
          _isShowDelete = widget.controller.text.isEmpty;
        });
      }
    });
    _seconds = widget.countdown;
    _isAvailableGetVCode = widget.isAvailableVCode;
  }

  starTimer(){
    if (_seconds == widget.countdown){
        _startTimer();
      }
  }

  //倒计时
  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds--;
      _isAvailableGetVCode = false;
      _verifyStr = '$_seconds s';
      if (_seconds == 0) {
        _verifyStr = '重新获取';
        _isAvailableGetVCode = true;
        _seconds = widget.countdown;
        _cancelTimer();
      }
      setState(() {});
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          width: widget.beforeTitleWidth,
          child: Text(widget.beforeTitle,style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),),
        ),
        SizedBox(width:5),
        Expanded(
            flex: 1,
            child: TextField(
                controller: widget.controller,
                maxLength: widget.maxLength,
                autofocus: widget.autoFocus,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboardType,
                obscureText: widget.isInputPwd ? !_isShowPwd : false,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
                inputFormatters: (widget.keyboardType == TextInputType.number ||
                        widget.keyboardType == TextInputType.phone)
                    ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
                    : [
                        BlacklistingTextInputFormatter(
                            RegExp("[\u4e00-\u9fa5]"))
                      ],
                decoration: InputDecoration(
                  hintText: widget.placeHolder,
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  counterText: '',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(0, 0, 0, 0),
                    width: 0.8,
                  )),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(0, 0, 0, 0),
                    width: 0.8,
                  )),
                ))),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //删除按钮
            Offstage(
                offstage: _isShowDelete,
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  width: 40,
                  child: IconButton(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          widget.controller.text = "";
                        });
                      }),
                )),
            //密码显示
            Offstage(
              offstage: !widget.isInputPwd,
              child: Container(
                  // margin: EdgeInsets.only(left: 5),
                  width: 40,
                  child: IconButton(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )),
            ),
            //右侧按钮
            Offstage(
              offstage: widget.rightTitle.length == 0,
              child: Container(
                  width: widget.rightTitleWidth,
                  child: FlatButton(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      onPressed: widget.rightAction,
                      child: Text(
                        widget.rightTitle,
                        style: Theme.of(context).textTheme.body1,
                      ))),
            ),
            // 倒计时
            Offstage(
                offstage: widget.vCodeAction == null,
                child: Container(
                    width: 80,
                    height: 35,
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      color: Theme.of(context).primaryColor,
                      disabledColor: Colors.black45,
                      onPressed: _isAvailableGetVCode ? widget.vCodeAction : null,
                      child: Text(
                        '$_verifyStr',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )))
          ],
        )
      ],
    );
  }
}
