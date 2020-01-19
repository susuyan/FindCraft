import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/craft_models.dart';

import 'package:find_craft/repositories/models/home_order_models.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  static Future<List<HomeOrderModel>> requestOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.homeOrder, params: {'token': token});
    var result = await network.requestApi(api);
    List list = result.get();
    return list.map<HomeOrderModel>((item) => HomeOrderModel.fromJson(item)).toList();
  }

  static Future<List<CraftModel>> requestCraft() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.homeCraft, params: {'token': token});
    var result = await network.requestApi(api);
    List list = result.get();

    return list.map<CraftModel>((item) => CraftModel.fromJson(item)).toList();
  }
}
