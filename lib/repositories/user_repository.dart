import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/pages/login/login_bloc/login_event.dart';
import 'package:find_craft/pages/login/sign_bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user_model.dart';

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  static Future<void> storeToken(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', model.token);
  }

  static Future<UserModel> requestLogin(
    LoginButtonPressed event,
  ) async {
    var api = API(API.login,
        params: {'user_phone': event.username, 'user_pwd': event.password});
    var result = await Network.share.request(api);

    return UserModel.fromJson(result.get()['data']);
  }

  Future requestSign(SignButtonPressed event) async {
    var api = API(API.sign,
        params: {'user_phone': event.username, 'user_pwd': event.password});
    var result = Network.share.request(api);
  }
}
