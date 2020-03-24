import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class LCHttpRequest extends StatefulWidget {
  LCHttpRequest({Key key}) : super(key: key);

  @override
  _LCHttpRequestState createState() => _LCHttpRequestState();
}

class _LCHttpRequestState extends State<LCHttpRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("网络请求")),
        body: Container(
            width: double.maxFinite,
            child: Column(children: [
              RaisedButton(
                color: Colors.orange,
                child: Text("原生网络请求GET"),
                onPressed: () {
                  nativeHttpGET();
                },
              ),
              RaisedButton(
                color: Colors.orange,
                child: Text("原生网络请求POST"),
                onPressed: () {
                  nativeHttpPOST();
                },
              ),
              SizedBox(height: 50),
              RaisedButton(
                color: Colors.orange,
                child: Text("第三方http网络请求GET"),
                onPressed: () {
                  httpGET();
                },
              ),
              RaisedButton(
                color: Colors.orange,
                child: Text("第三方http网络请求POST"),
                onPressed: () {
                  httpPOST();
                },
              ),
              SizedBox(height: 50),
              RaisedButton(
                color: Colors.orange,
                child: Text("第三方dio网络请求GET"),
                onPressed: () {
                  dioGET();
                },
              ),
              RaisedButton(
                color: Colors.orange,
                child: Text("第三方dio网络请求POST"),
                onPressed: () {
                  dioPOST();
                },
              ),
            ])));
  }

  Future<void> nativeHttpGET() async {
    var httpClient = HttpClient();
    var params = Map<String, String>();
    // uri方法1
    Uri uri = Uri(
        scheme: 'http', host: 'api.oyear.cn', path: "/api/Nonghanginvest/data");

    // uri方法2
    // Uri uri = Uri.https(
    //     'xxx.xxx.xxx.xxx', homeNoviceListUrl);

    // uri方法3
    // Uri uri = Uri.parse(njqbaseUrl + homeNoviceListUrl);
    var request = await httpClient.getUrl(uri);

    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    headers['useVersion'] = '3.1.0';
    headers['isEncoded'] = '1';
    headers['bundleId'] = 'com.nongfadai.iospro';

    request.headers.add("loginSource", "IOS");
    request.headers.add("useVersion", "3.1.0");
    request.headers.add("isEncoded", "1");
    request.headers.add("bundleId", "com.nongfadai.iospro");

    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();

    if (response.statusCode == HttpStatus.ok) {
      print('请求头：${response.headers}');

      print('111请求成功代发数据为:\n $responseBody');
      print('--------------');
      Map data = jsonDecode(responseBody);
      print('222请求成功代发数据为:\n $data');
    } else {
      print('\n\n\n11111==请求失败${response.statusCode}');
    }
  }

  Future<void> nativeHttpPOST() async {
    print('------loadData_sys_post--------');

    HttpClient httpClient = new HttpClient();

// queryParameters get请求的查询参数(适用于get请求？？？是吗？？？)
// Uri uri = Uri(
//     scheme: "https", host: "xxx.xxx.xxx.xxx", path: homeRegularListUrl);
// HttpClientRequest request = await httpClient.postUrl(uri);

    var url = "http://api.oyear.cn/api/Nonghanginvest/data";
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));

// 设置请求头
    request.headers.set("loginSource", "IOS");
    request.headers.set("useVersion", "3.1.0");
    request.headers.set("isEncoded", "1");
    request.headers.set("bundleId", "com.nongfadai.iospro");
// Content-Type大小写都ok
    request.headers.set('content-type', 'application/json');

    /// 添加请求体
    /// https://stackoverflow.com/questions/50278258/http-post-with-json-on-body-flutter-dart/50295533
    Map jsonMap = {'currentPage': '1'};
    request.add(utf8.encode(json.encode(jsonMap)));

    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    if (response.statusCode == HttpStatus.ok) {
      print('请求成功');
      print(response.headers);
      print(responseBody);
    }
  }

  Future<void> httpGET() async {
    var client = new http.Client();
    String _result;
    try {
      var url = 'http://api.oyear.cn/api/Nonghanginvest/data';
      http.Response response = await client.get(url);
      if (response.statusCode == 200) {
        _result = response.body.toString();
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      _result = '网络异常';
    }
    print(_result);
  }

  Future<void> httpPOST() async {
    var client = new http.Client();
    var url = 'http://api.oyear.cn/api/Nonghanginvest/data';

    String _result;
    try {
      var headers = Map<String, String>();
      // headers["loginSource"] = "IOS";
      // headers["useVersion"] = "3.1.0";
      // headers["isEncoded"] = "1";
      // headers["bundleId"] = "com.nongfadai.iospro";
      // headers["loginSource"] = "IOS";
      // headers["Content-Type"] = "application/json";

      Map params = {'currentPage': '1'};
      http.Response response =
          await client.post(url, body: params, headers: headers);
      if (response.statusCode == 200) {
        _result = response.body.toString();
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      _result = '网络异常';
    }
    print(_result);
  }

  Future<void> dioGET() async {
    Dio dio = new Dio();
    var url = 'http://api.oyear.cn/api/Nonghanginvest/data';
    String _result;

    try {
      var headers = Map<String, String>();
      headers['loginSource'] = 'IOS';
      headers['useVersion'] = '3.1.0';
      headers['isEncoded'] = '1';
      headers['bundleId'] = 'com.nongfadai.iospro';
      headers['Content-Type'] = 'application/json';

      dio.options.headers.addAll(headers);
      dio.options.baseUrl = "";

      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        _result = response.data.toString();
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      print('exc:$exception');
      _result = '网络异常';
    }
    print(_result);
  }

  Future<void> dioPOST() async {
    Dio dio = new Dio();

    var url = 'http://api.oyear.cn/api/Nonghanginvest/data';
    String _result;

    try {
      var headers = Map<String, String>();
      headers['loginSource'] = 'IOS';
      headers['useVersion'] = '3.1.0';
      headers['isEncoded'] = '1';
      headers['bundleId'] = 'com.nongfadai.iospro';
      headers['Content-Type'] = 'application/json';

      dio.options.headers.addAll(headers);
      dio.options.baseUrl = "";
      dio.options.connectTimeout = 60000;
      dio.options.receiveTimeout = 60000;
      dio.options.method = 'post';
      Options option = Options(method: 'post');

      Response response =
          await dio.post(url, data: {"currentPage": "1"}, options: option);
      if (response.statusCode == 200) {
        _result = response.data.toString();
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      print('exc:$exception');
      _result = '网络异常';
    }
    print(_result);
  }
}
