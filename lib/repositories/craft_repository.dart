import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/craft_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CraftRepository {
  Future<List<CraftModel>> requestCraftList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.craftList, params: {'token': token, 'city': '北京'});

    var result = await Network.share.request(api);

    return CraftModels.fromJson(result.get()).data;
  }

  Future<CraftModel> requestCraftDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.craftDetails, params: {'token': token, 'id': '2'});

    var result = await Network.share.request(api);

    return CraftModels.fromJson(result.get()).data.first;
  }
}
