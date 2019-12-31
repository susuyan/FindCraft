
import 'package:dio/dio.dart';
import './api.dart';

class Network {
  final Dio dio = Dio();

  Network();

  Function a = () => Future;

  test() {
    _request(login);
  }

  Function _request(Function a) {}

  Future login() async {
    Response response = await dio.request(API.login);
  }
}
