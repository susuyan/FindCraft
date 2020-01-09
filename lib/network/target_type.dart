import 'package:dio/dio.dart';
import 'package:find_craft/network/task.dart';
import 'package:find_craft/network/noya.dart';

abstract class TargetType {
  // 基础路径
  String get baseUrl;
  // 路径
  String get path;
  // 请求方法
  HttpMethod get method;
  // 设置请求头
  Map<String, String> get headers;
  // 请求参数
  Map<String, dynamic> get parameters;
  // 设置拦截器
  List<Interceptor> get interceptors;
  // 设置参数方式
  Task get task;
}
