import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first/config/AppConfig.dart';
import 'package:first/tools/webserve/LCMethod.dart';
import 'package:first/tools/webserve/LCWebInterceptors.dart';
import 'package:first/tools/webserve/LCWebResultData.dart';

class LCWebRequstManager {
  static final LCWebRequstManager _instance = LCWebRequstManager._internal();
  factory LCWebRequstManager() => _instance;

  Dio _client;

  ///通用全局单例，第一次使用时初始化
  LCWebRequstManager._internal({String baseUrl}) {
    if (null == _client) {
      _client = Dio(BaseOptions(
        baseUrl: AppConfig.baseUrl, //请求基地址,可以包含子路径
        connectTimeout: AppConfig.connectTimeOut, //连接服务器超时时间，单位是毫秒.
        receiveTimeout: AppConfig.receiveTimeOut, //响应流上前后两次接受到数据的间隔，单位为毫秒。
        headers: {"version": "1.0.0"}, //Http请求头.
        contentType: ContentType.json.toString(), //请求的Content-Type，默认值是[ContentType.json]
        responseType: ResponseType.json, //表示期望以那种格式(方式)接受响应数据
      ));
      _client.interceptors.add(LCWebInterceptors()); //拦截器
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(LCMethod method, String api,
      {Map<String, dynamic> params, Function(T) success, Function(LCErrorEntity) error}) async {
    try {
      FormData data = FormData.fromMap(params);
      Response response = await _client.request(
        api,
        data: data,
        // queryParameters: params,
        options: Options(method: LCMethodValues[method]),
      );

      if (response != null) {
        
        LCBaseEntity entity = LCBaseEntity<T>.fromJson(response.data);
        if (entity.code == 0) {
          success(entity.data);
        } else {
          error(LCErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(LCErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(resultError(e));
    }
  }

  // 请求，返回参数为 List<T>
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(
      LCMethod method, String api, Map<String, dynamic> params,
      {Function(List<T>) success, Function(LCErrorEntity) error}) async {
    try {
      Response response = await _client.request(
        api,
        queryParameters: params,
        options: Options(method: LCMethodValues[method]),
      );
      if (response != null) {
        LCBaseListEntity entity = LCBaseListEntity<T>.fromJson(response.data);
        if (entity.code == 0) {
          success(entity.data);
        } else {
          error(LCErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(LCErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(resultError(e));
    }
  }

  ///清除当前的Dio实例等待队列。
  cancel() {
    _client.clear();
  }
}
//错误信息处理
LCErrorEntity resultError(DioError error) {
  Response errorResponse;
  if (error.response != null) {
    errorResponse = error.response;
  } else {
    errorResponse = Response(statusCode: 500);
  }

  if (error.type == DioErrorType.CONNECT_TIMEOUT) {
    return LCErrorEntity(code: errorResponse.statusCode, message: "连接超时");
  } else if (error.type == DioErrorType.SEND_TIMEOUT) {
    return LCErrorEntity(code: errorResponse.statusCode, message: "请求超时");
  } else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
    return LCErrorEntity(code: errorResponse.statusCode, message: "响应超时");
  } else if (error.type == DioErrorType.RESPONSE) {
    try {
      //400 请求语法错误
      //403 服务器拒绝执行
      //404 无法连接服务器
      //405 请求方法被禁止
      //500 服务器内部错误
      //502 无效的请求
      //503 服务器挂了
      //505 不支持HTTP协议请求
      //502 无效的请求
      switch (errorResponse.statusCode) {
        case 400:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "请求语法错误");
          }
          break;
        case 403:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "服务器拒绝执行");
          }
          break;
        case 404:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "无法连接服务器");
          }
          break;
        case 405:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "请求方法被禁止");
          }
          break;
        case 500:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "服务器内部错误");
          }
          break;
        case 502:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "无效的请求");
          }
          break;
        case 503:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "服务器挂了");
          }
          break;
        case 505:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "不支持HTTP协议请求");
          }
          break;
        default:
          {
            return LCErrorEntity(
                code: errorResponse.statusCode, message: "未知错误");
          }
      }
    } on Exception catch (_) {
      return LCErrorEntity(code: errorResponse.statusCode, message: "未知错误");
    }
  } else if (error.type == DioErrorType.CANCEL) {
    return LCErrorEntity(code: errorResponse.statusCode, message: "请求取消");
  } else {
    return LCErrorEntity(code: errorResponse.statusCode, message: "未知错误");
  }
}
