import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:find_craft/network/Task.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:find_craft/network/target_type.dart';
import 'package:find_craft/repositories/models/user_model.dart';

import 'api.dart';

void main() {
  Network.request(CraftTarget(API.loginAPI), success: (json) async {
    var model = UserModel.fromJson(json);
    print(model.token);
  });
}

typedef SuccessCallback = Function(dynamic json);
typedef FaliureCallback = Function(Error error);

class Network {
  static final Dio dio = Dio();
  // 配置Dio
  static void setupDio(TargetType targetType) {
    dio.interceptors.addAll(targetType.interceptors);
    dio.options.baseUrl = targetType.baseUrl;
    dio.options.method = targetType.method.value;
    dio.options.queryParameters = targetType.parameters;
  }

  static Future<int> request<T extends TargetType>(T targetType,
      {SuccessCallback success, FaliureCallback faliure}) async {
    setupDio(targetType);
    var resultCode = 0;
    try {
      Response<Map<String, dynamic>> response;

      switch (targetType.task) {
        case Task.multipart:
          response = await dio.request(targetType.path,
              data: FormData.fromMap(targetType.parameters));
          break;
        default:
          response = await dio.request(targetType.path,
              queryParameters: targetType.parameters);
      }

      if (success != null) {
        var json = response.data;

        switch (json['code']) {
          case 200:
            success(json['data']);
            resultCode = 1;
            break;
          default:
            faliure(Error());
            resultCode = 0;
        }
      }
    } catch (e) {
      resultCode = 0;
      faliure(e);
    }

    return resultCode;

    // TODO: 网络连接

    // TODO: 网络错误处理

    // TODO: 处理回调
  }
}
