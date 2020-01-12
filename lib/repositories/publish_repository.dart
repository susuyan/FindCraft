import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublishRepository {
  Future requestPublishDemand() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var api = API(API.publishDemand, params: {'token': token, 'user_id': '2'});
    Network.share.request(api);

  }
}
