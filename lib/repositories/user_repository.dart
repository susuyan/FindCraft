import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/craft_target.dart';
import 'package:find_craft/network/network.dart';

import 'package:find_craft/pages/login/bloc/login_event.dart';
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

  static Future<int> requestLogin(LoginButtonPressed event) async =>
      Network.request(
          CraftTarget(API(API.login, params: {
            'user_phone': event.username,
            'user_pwd': event.password
          })), success: (json) async {
        UserModel model = UserModel.fromJson(json);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', model.token);
      });
}
