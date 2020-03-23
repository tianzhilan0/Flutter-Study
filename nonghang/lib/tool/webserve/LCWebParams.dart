
// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:convert/convert.dart';

class LCWebParams {

  static Map getEmptyMap() {
    var map = Map<String, dynamic>();
    return map;
  }

  static Map getBaseMap() {
    var map = Map<String, dynamic>();
    map["platform"] = "1";
    map["system"] = "android";
    map["channel"] = "official";
    map["time"] = DateTime.now().millisecondsSinceEpoch.toString();
    return map;
  }

  // static encryptParams(Map<String, dynamic> map) {
  //   var buffer = StringBuffer();
  //   map.forEach((key, value) {
  //     buffer.write(key);
  //     buffer.write(value);
  //   });

  //   buffer.write("SERECT");
  //   print('bustring--->:' + buffer.toString());
  //   var sign = string2MD5(buffer.toString());
  //   map["sign"] = sign;
  //   print("sign--->" + sign);
  //   return map;
  // }

  // static string2MD5(String data) {
  //   var content = Utf8Encoder().convert(data);
  //   var digest = md5.convert(content);
  //   return hex.encode(digest.bytes);
  // }
  
}