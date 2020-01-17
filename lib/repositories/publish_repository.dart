import 'package:find_craft/helper/storage_helper.dart';
import 'package:find_craft/network/api.dart';
import 'package:find_craft/network/network.dart';
import 'package:find_craft/pages/publish/publish_event.dart';
import 'package:find_craft/repositories/models/demand_models.dart';

import 'models/sign_account_models.dart';

class PublishRepository {
  Future<DemandModel> requestPublishDemand(PublishDemand event) async {
    SignAccountModel account = SignAccountModel.fromJson(
        StorageHelper.localStorage.getItem('SignAccount'));
    var token = StorageHelper.sharedPreferences.getString('token');

    var params = {
      'title': event.title,
      'content': event.content,
      'city': event.city,
      'user_id': account.id,
      'token': token,
      'address': event.address,
    };
    
    event.tags.forEach((tag){
      params[tag.type] = tag.title;
    });

    var api = API(API.publishDemand, params: params);

    var result = await Network.share.request(api);

    return DemandModel.fromJson(result.get()['data']);
  }
}
