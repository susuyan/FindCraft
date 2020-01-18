import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'package:find_craft/network/task.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:find_craft/network/noya_error.dart';
import 'package:find_craft/network/target_type.dart';
import 'package:flutter/foundation.dart';

import 'package:result/result.dart';

import 'api.dart';

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class NoyaProvider extends DioForNative {
  NoyaProvider() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  init<T extends TargetType>(T targetType);
}

/// 子类需要重写
abstract class ResponseData {
  int code = 0;
  String message;
  dynamic data;

  bool get success;

  ResponseData({this.code, this.message, this.data});

  @override
  String toString() {
    return 'RespData{code: $code, message: $message, data: $data}';
  }
}

class Network {
  static Network share = Network();
  final Dio dio = Dio();
  // 配置Dio
  void setupDio(TargetType targetType) async {
    dio.interceptors.addAll(targetType.interceptors);
    dio.options.baseUrl = targetType.baseUrl;
    dio.options.method = targetType.method.value;
    dio.options.queryParameters = targetType.parameters;
    dio.options.headers.addAll(targetType.headers);
  }

  Future<Result> request<T extends API>(T api) async {
    var targetType = CraftTarget(api);

    Response response;
    Result<dynamic, NoyaError> result;

    FormData();

    try {
      switch (targetType.task) {
        case Task.multipart:
          FormData formData = FormData.fromMap(targetType.parameters);
          response = await dio.request(targetType.path, data: formData);
          break;
        default:
          response = await dio.request(targetType.path,
              queryParameters: targetType.parameters);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = response.data;

        switch (json['code']) {
          case 200:
            result = Result.success(json);
            break;
          case 4001:
          case 4002:
          case 5001:
          case 5002:
            result = Result.failure(NoyaError(error: json['msg']));
            break;

          default:
            result = Result.failure(NoyaError(error: '网络异常'));
        }
      }
    } on NoyaError catch (e) {
      result = Result.failure(NoyaError(error: e));
    }

    return result;
  }
}
