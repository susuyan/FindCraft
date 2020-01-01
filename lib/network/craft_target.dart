import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/noya.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CraftTarget extends TargetType {
  CraftTarget(this.api);
  final API api;

  @override
  String get baseUrl => API.base;

  @override
  Map<String, String> get headers => {};

  @override
  Map<String, dynamic> get parameters =>
      api.params.isNotEmpty ? api.params : {};

  @override
  String get path => api.path;

  @override
  HttpMethod get method {
    switch (api.path) {
      case API.login:
        return HttpMethod.POST;
      default:
        return HttpMethod.GET;
    }
  }

  @override
  List<Interceptor> get interceptors {
    var log = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90);

    var cookieJar = CookieJar();

    return [log];
  }
}

abstract class TargetType {
  String get baseUrl;
  String get path;
  HttpMethod get method;
  Map<String, String> get headers;
  Map<String, dynamic> get parameters;
  List<Interceptor> get interceptors;
}
