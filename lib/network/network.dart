import 'package:dio/dio.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api.dart';

void main() async {
  Network.request(CraftTarget(API.loginAPI));
  // Dio dio = Dio();
  // dio.interceptors.add(PrettyDioLogger());
  // dio.post('http://zhaogegong.beituokj.com/api/login/',
  //     queryParameters: {'user_phone': '', 'user_pwd': '123'});
}

class Network {
  static final Dio dio = Dio();
  // 配置Dio
  static void setupDio(TargetType targetType) {
    dio.interceptors.addAll(targetType.interceptors);
    dio.options.baseUrl = targetType.baseUrl;
    dio.options.method = targetType.method.value;
    dio.options.queryParameters = targetType.parameters;
    // dio.options.contentType = 'application/json';
  }

  static void request<T extends TargetType>(T targetType) async {
    setupDio(targetType);

    await dio.request(targetType.path);
  }
}
