import 'package:find_craft/route/route_handles.dart';
import 'package:flutter/material.dart';
import 'package:find_craft/common/fluro/fluro.dart';

class Routes {
  static const root = '/tab';
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
  static const signAccount = '/sign_account';
  static const signRole = '/sign_role';
  static const signOrderInfo = '/sign_order_info';
  static const signCraftInfo = '/sign_craft_info';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Scaffold(
        body: Center(
          child: Text('No route defined for'),
        ),
      );
    });

    router.define(root, handler: rootHandler);

    router.define(splash, handler: splashHandler);

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

    router.define(login, handler: loginHandler);
  }
}
