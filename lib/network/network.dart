import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:find_craft/network/Task.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:find_craft/network/target_type.dart';
import 'package:find_craft/repositories/models/base_model.dart';

import 'api.dart';

void main() async {
  Network.request(CraftTarget(API.loginAPI));
}

class Network {
  static final Dio dio = Dio();
  // 配置Dio
  static void setupDio(TargetType targetType) {
    dio.interceptors.addAll(targetType.interceptors);
    dio.options.baseUrl = targetType.baseUrl;
    dio.options.method = targetType.method.value;
    dio.options.queryParameters = targetType.parameters;
  }

  static void request<T extends TargetType>(T targetType) async {
    setupDio(targetType);

    Response response;

    switch (targetType.task) {
      case Task.multipart:
        response = await dio.request(targetType.path,
            data: FormData.fromMap(targetType.parameters));
        break;
      default:
        response = await dio.request(targetType.path,
            queryParameters: targetType.parameters);
    }
    var d = jsonDecode(response.toString());
    var b = BaseModel.fromJson(d);

    print(b.msg);
  }
}
