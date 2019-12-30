import 'package:find_craft/route/route_handles.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static const root = '/';
  static const home = '/home';
  static const workerPublish = '/worker_publish';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(root, handler: rootHandler);

    router.define(workerPublish, handler: workPublishHandler);
  }
}
