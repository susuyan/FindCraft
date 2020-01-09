import 'package:find_craft/route/route_handles.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static const root = '/';
  static const home = '/home';
  static const splash = '/splash';
  static const workerPublish = '/worker_publish';
  static const ownerPublish = '/wonerPublish';
  static const selectCity = '/select_City';
  static const requirements = '/home/requirements';
  static const requirementsDetails = '/requirements_details';

  static const craftList = '/home/craft_list';
  static const craftDetails = '/craft_details';
  static const workGallery = '/work_gallery';
  static const settings = '/settings';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(root, handler: rootHandler);

    router.define(home, handler: homeHandler);

    router.define(workerPublish, handler: workPublishHandler);

    router.define(selectCity, handler: selectCityHandler);

    router.define(requirements, handler: requirementsHandler);

    router.define(requirementsDetails, handler: requimentsDetailsHandler);

    router.define(craftList, handler: craftListHandler);

    router.define(craftDetails, handler: craftDetailsHandler);

    router.define(workGallery, handler: workgalleryHandler);

    router.define(settings, handler: settingsHandler);
  }
}
