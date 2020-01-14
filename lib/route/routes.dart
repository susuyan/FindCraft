import 'package:find_craft/route/route_handles.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static const root = '/';
  static const home = '/home';
  static const splash = '/splash';
  static const workerPublish = '/worker_publish';
  static const ownerPublish = '/home/onerPublish';
  static const selectCity = '/select_city';
  static const demandList = '/home/demand_list';
  static const demandDetails = '/demand_details';

  static const craftList = '/home/craft_list';
  static const craftDetails = '/craft_details';
  static const workGallery = '/work_gallery';
  static const settings = '/settings';

  static const login = '/login';
  static const signAccount = '/login/sign_account';
  static const signRole = '/login/sign_account/sign_role';
  static const signOrderInfo = '/login/sign_account/sign_role/sign_order_info';
  static const signCraftInfo = '/login/sign_account/sign_role/sign_craft_info';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(root, handler: rootHandler);

    router.define(signAccount, handler: signAccountHandler);

    router.define(signRole, handler: signRoleHandler);

    router.define(signOrderInfo, handler: signOrderInfoHandler);

    router.define(signCraftInfo, handler: signCraftInfoHandler);

    router.define(home, handler: homeHandler);

    router.define(ownerPublish, handler: ownerPublishHandler);

    router.define(selectCity, handler: selectCityHandler);

    router.define(demandList, handler: requirementsHandler);

    router.define(demandDetails, handler: requimentsDetailsHandler);

    router.define(craftList, handler: craftListHandler);

    router.define(craftDetails, handler: craftDetailsHandler);

    router.define(workGallery, handler: workgalleryHandler);

    router.define(settings, handler: settingsHandler);
  }
}
