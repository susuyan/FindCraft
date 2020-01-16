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
    var api = API(API.publishDemand, params: {
      'title': event.title,
      'content': event.content,
      'city': event.city,
      'user_id': account.id,
      'token': token,
      'address': event.address,
      'type01': '找木工',
      'type02': '找瓦工'
    });

    var result = await Network.share.request(api);

    return DemandModel.fromJson(result.get()['data']);
  }
}
