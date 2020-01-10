import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/mine_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MineRepository {
  Future<MineModel> requestMine() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.mine, params: {'token': token, 'user_id': '2'});
    var result = await Network.share.request(api);

    return MineModels.fromJson(result.get()).data.first;
  }
}
