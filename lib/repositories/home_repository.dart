import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/home_order_models.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  static Future<HomeOrderModels> requestHomeOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.homeCraft, params: {'token': token});
    var result = await Network.share.request(api);
    return HomeOrderModels.fromJson(result.get());
  }
}
