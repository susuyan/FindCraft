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

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  Future<void> storeToken(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', model.token);
  }

  // 登录
  Future<UserModel> requestLogin(
    LoginButtonPressed event,
  ) async {
    var api = API(API.login,
        params: {'user_phone': event.username, 'user_pwd': event.password});
    var result = await network.requestApi(api);

    return UserModel.fromJson(result.get());
  }

  Future<SignAccountModel> requestUserInfo(String username) async {
    var api = API(API.userInfo, params: {});
    var result = await network.requestApi(api);
    List list = result.get();
    List<SignAccountModel> model = list
        .map<SignAccountModel>((item) => SignAccountModel.fromJson(item))
        .toList();
    model.retainWhere((user) => user.userPhone == username);
    var currentAccount = model.first;
    StorageHelper.localStorage.setItem('SignAccount', currentAccount.toJson());

    return currentAccount;
  }

  Future<SignAccountModel> requestSign(SignButtonPressed event) async {
    var api = API(API.sign,
        params: {'user_phone': event.username, 'user_pwd': event.password});
    var result = await network.requestApi(api);
    var model = SignAccountModel.fromJson(result.get());
    StorageHelper.localStorage.setItem('SignAccount', model.toJson());
    return model;
  }

  Future<UserEntity> requestSignOwner(SignOwnerInfo event) async {
    SignAccountModel account = SignAccountModel.fromJson(
        StorageHelper.localStorage.getItem('SignAccount'));
    var api = API(API.signInfo, params: {
      'user_name': event.username,
      'user_wechat': event.wechat,
      'city': event.city,
      'user_id': account.id
    });

    var result = await network.requestApi(api);

    var entity = UserEntity.fromJson(result.get());

    return entity;
  }

  Future requestSignCraft(SignCraftInfo event) async {
    SignAccountModel account = SignAccountModel.fromJson(
        StorageHelper.localStorage.getItem('SignAccount'));

    var params = {
      'user_name': event.username,
      'user_wechat': event.wechat,
      'city': event.city,
      'user_id': account.id,
    };

    event.tags.forEach((tag) {
      params[tag.type] = tag.title;
    });

    var api = API(API.signInfo, params: params);

    await network.requestApi(api);

    // var entity = UserEntity.fromJson(result.get()['data']);

    // return entity;
  }
}
