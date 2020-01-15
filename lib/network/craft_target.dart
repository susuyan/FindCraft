import 'package:dio/dio.dart';
import 'package:find_craft/network/task.dart';

import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/noya.dart';
import 'package:find_craft/network/target_type.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CraftTarget extends TargetType {
  CraftTarget(this.api);
  final API api;

  @override
  String get baseUrl => API.base;

  @override
  Map<String, String> get headers => {};

  @override
  Map<String, dynamic> get parameters => api.params.isNotEmpty
      ? api.params
      : {};

  @override
  String get path => api.path;

  @override
  HttpMethod get method {
    switch (api.path) {
      case API.login:
      case API.sign:
      case API.sign:
      case API.homeCraft:
      case API.homeOrder:
      case API.demandList:
      case API.craftList:
        return HttpMethod.POST;
        break;
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

    return [log];
  }

  @override
  Task get task {
    switch (api.path) {
      default:
        return Task.multipart;
    }
  }
}
