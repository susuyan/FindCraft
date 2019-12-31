import 'package:find_craft/pages/craft_details_page.dart';
import 'package:find_craft/pages/home_page.dart';
import 'package:find_craft/pages/main_page.dart';
import 'package:find_craft/pages/requirements_page.dart';
import 'package:find_craft/pages/requiriments_details_page.dart';
import 'package:find_craft/pages/select_city_page.dart';
import 'package:find_craft/pages/craft_list_page.dart';
import 'package:find_craft/pages/worker_publish_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainPage();
});

var homeHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return HomePage();
});

var workPublishHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return WorkerPublishPage();
});

var selectCityHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return SelectCityPage();
});

var requirementsHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return RequirementsPage();
});

var requimentsDetailsHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return RequirementsDetailsPage();
});

var craftListHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return CraftListPage();
});

var craftDetailsHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return CraftDetailsPage();
});
