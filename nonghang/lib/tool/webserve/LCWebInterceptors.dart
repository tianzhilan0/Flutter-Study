import 'package:dio/dio.dart';

class LCWebInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async{
    print("=======> 开始请求 <========");
    print("请求url：${options.baseUrl}${options.path}");
    if (options.data != null) {
      print('请求params: ' + options.data.toString());
    }
    return options;
  }
  
  // @override
  // onResponse(Response response) async {
  //   print("=======> 结束请求 <========");

  //   RequestOptions option = response.request;
  //   try {
  //     ///一般只需要处理200的情况，300、400、500保留错误信息，外层为http协议定义的响应码
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       ///内层需要根据公司实际返回结构解析，一般会有code，data，msg字段
  //         return LCErrorEntity(200, response.data, "请求成功");
  //     }else{
  //         return LCErrorEntity(response.statusCode, response.data, "请求失败");
  //     }
  //   } catch (e) {
  //     print(e.toString() + option.path);
  //     return LCErrorEntity(response.statusCode, response.data, "");
  //   }
  // }

  // @override
  // onError(DioError err) async{
  //   print("=======> Error <========");
  //   print('请求异常: ' + err.toString());
  //   print('请求异常信息: ' + err.response?.toString() ?? "");
  //   return err;
  // }
}