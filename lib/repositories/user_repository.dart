import 'package:find_craft/helper/storage_helper.dart';
import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/pages/login/login_bloc/login_event.dart';
import 'package:find_craft/pages/login/sign_bloc/bloc.dart';
import 'package:find_craft/repositories/models/sign_account_models.dart';
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

  Future<SignAccountModel> requestSign(SignButtonPressed event) async {
    var api = API(API.sign,
        params: {'user_phone': event.username, 'user_pwd': event.password});
    var result = await Network.share.request(api);
    var model = SignAccountModel.fromJson(result.get()['data']);
    StorageHelper.localStorage.setItem('SignAccount', model.toJson());
    return model;
  }

  Future<UserEntity> requestSignOwner(SignOwnerInfo event) async {
    SignAccountModel account =  SignAccountModel.fromJson(
        StorageHelper.localStorage.getItem('SignAccount'));
    var api = API(API.signInfo, params: {
      'user_name': event.username,
      'user_wechat': event.wechat,
      'city': event.city,
      'user_id': account.id
    });

    var result = await Network.share.request(api);

    var entity = UserEntity.fromJson(result.get()['data']);

    return entity;
  }
}
