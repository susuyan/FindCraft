import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/repositories/models/demand_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemandRepository {
  Future<List<DemandModel>> requestDemandList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.demandList, params: {'token': token, 'city': '北京'});

    var result = await network.requestApi(api);
    List list = result.get();
    return list.map<DemandModel>((item) => DemandModel.fromJson(item)).toList();
  }

  Future<DemandModel> requestDemandDetails(String orderId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.demandDetails, params: {'token': token, 'id': orderId});

    var result = await network.requestApi(api);

    List list = result.get();

    return list
        .map<DemandModel>((item) => DemandModel.fromJson(item))
        .toList()
        .first;
  }
}
