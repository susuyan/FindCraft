import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'package:find_craft/network/Task.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:find_craft/network/noya_error.dart';
import 'package:find_craft/network/target_type.dart';
import 'package:find_craft/repositories/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:result/result.dart';

import 'api.dart';

void main() async {
  var api =
      API(API.employer, params: {'token': '73ea2e4943f9ab9c98d49370dcd87b8a'});

  Network.share.request(api);
}

typedef SuccessCallback = Function(dynamic json);
typedef FaliureCallback = Function(NoyaError error);

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

    var cookieJar=CookieJar();

    print(cookieJar.loadForRequest(Uri.parse(targetType.path)));

    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<Result> request<T extends API>(T api, {bool isList}) async {
    var targetType = CraftTarget(api);

    setupDio(targetType);

    Response response;
    Result<dynamic, NoyaError> result;
    try {
      switch (targetType.task) {
        case Task.multipart:
          response = await dio.request(targetType.path,
              data: FormData.fromMap(targetType.parameters));
          break;
        default:
          response = await dio.request(targetType.path,
              queryParameters: targetType.parameters);
      }

      if (response.statusCode == 201) {
        var json = response.data;

        switch (json['code']) {
          case 200:
            result = Result.success(json['data']);
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
