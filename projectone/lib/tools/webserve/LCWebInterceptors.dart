import 'package:dio/dio.dart';

class LCWebInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async{
    print("=======> 开始请求 <========");
    print("请求url：${options.baseUrl}${options.path}");
    print("请求方式：${options.method}");

    if (options.data != null) {
      print("请求数据："+options.data.toString());
    }
    return options;
  }
  
  @override
  onResponse(Response response) async {
    print("=======> 结束请求 <========");
    RequestOptions option = response.request;
    print("请求地址：${option.path}");
    try {
      print("请求结果：${response.data.toString()}");
    } catch (e) {
      print("请求失败："+e.toString());
    }
    return response;
  }

  @override
  onError(DioError err) async{
    print("=======> Error <========");
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return err;
  }
}