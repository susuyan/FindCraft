import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/demand_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemandRepository {
  Future<List<DemandModel>> requestDemandList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.demandList, params: {'token': token, 'city': '北京'});

    var result = await Network.share.request(api);

    return DemandModels.fromJson(result.get()).data;
  }
}