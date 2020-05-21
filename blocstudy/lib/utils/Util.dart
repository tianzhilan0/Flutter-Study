import 'package:blocstudy/common/common.dart';
import 'package:blocstudy/utils/ObjectUtil.dart';
import 'package:blocstudy/utils/sputil.dart';
import 'package:flutter/material.dart';

class Util {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getFileName(String urlPath) {
    if (ObjectUtil.isEmpty(urlPath)) return '';
    List<String> listStr = urlPath.split("/");
    String name = listStr[listStr.length - 1];
    return name;
  }

  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text("$msg")),
    );
  }

  static bool isLogin() {
    return ObjectUtil.isNotEmpty(SpUtil.getString(BaseConstant.keyAppToken));
  }
}
