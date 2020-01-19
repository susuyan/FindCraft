import 'package:find_craft/helper/storage_helper.dart';
import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/mine_models.dart';
import 'package:find_craft/repositories/models/sign_account_models.dart';

class MineRepository {
  Future<MineModel> requestMine() async {
    var token = StorageHelper.sharedPreferences.getString('token');
    SignAccountModel account = SignAccountModel.fromJson(
        StorageHelper.localStorage.getItem('SignAccount'));

    var api = API(API.mine, params: {'token': token, 'user_id': account.id});
    var result = await network.requestApi(api);
    List list = result.get();

    return list
        .map<MineModel>((item) => MineModel.fromJson(item))
        .toList()
        .first;
  }
}
