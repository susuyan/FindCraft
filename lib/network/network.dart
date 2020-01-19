import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'package:find_craft/network/task.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:find_craft/network/noya_error.dart';
import 'package:find_craft/network/target_type.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
    init();
  }

  init();
}

/// 子类需要重写
abstract class NoyaResponseData {
  int code = 0;
  String message;
  dynamic data;

  bool get success;

  NoyaResponseData({this.code, this.message, this.data});

  @override
  String toString() {
    return 'RespData{code: $code, message: $message, data: $data}';
  }
}

class ResponseData extends NoyaResponseData {
  bool get success => 0 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['msg'];
    data = json['data'];
  }
}

final Network network = Network();

class Network extends NoyaProvider {
  @override
  init() {
    var log = PrettyDioLogger(
        requestHeader: false,
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90);
    interceptors.add(log);
  }

  // 配置Dio
  void setupDio(TargetType targetType) async {
    options.baseUrl = targetType.baseUrl;
    options.method = targetType.method.value;
    if (targetType.parameters != null || targetType.parameters.isNotEmpty) {
      options.queryParameters = targetType.parameters;
    }

    options.headers.addAll(targetType.headers);
  }

  Future<Result<dynamic, NoyaError>> requestApi(API api) async {
    var targetType = CraftTarget(api);
    setupDio(targetType);
    Response response;
    Result<dynamic, NoyaError> result;
    try {
      switch (targetType.task) {
        case Task.multipart:
          FormData formData = FormData.fromMap(targetType.parameters);
          response = await request(targetType.path, data: formData);
          break;
        default:
          response = await request(targetType.path,
              queryParameters: targetType.parameters);
      }

      switch (response.data['code']) {
        case 200:
          result = Result.success(response.data['data']);
          break;
        case 4001:
        case 4002:
        case 5001:
        case 5002:
          result = Result.failure(NoyaError(error: response.data['msg']));
          break;

        default:
          result = Result.failure(NoyaError(error: '网络异常'));
      }
    } on NoyaError catch (e) {
      result = Result.failure(NoyaError(error: e));
    }

    return result;
  }
}
