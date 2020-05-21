class ValidatorConfig {
  /// 校验手机号
  static String checkMobile(value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '手机号不能为空!';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return "";
  }

  /// 校验验证码
  static String checkVCode(value) {
    if (value.isEmpty) {
      return '验证码不能为空';
    } else if (value.trim().length != 6) {
      return '请输入六位验证码';
    }
    return "";
  }

    /// 校验密码
  static String checkPassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 20) {
      return '密码长度不正确';
    }
    return "";
  }

    /// 校验密码
  static String checkRePassWord(value) {
    if (value.isEmpty) {
      return '确认密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 20) {
      return '确认密码长度不正确';
    }
    return "";
  }
}
