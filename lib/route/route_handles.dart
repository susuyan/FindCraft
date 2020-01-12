import 'package:find_craft/pages/craft/craft_details_page.dart';
import 'package:find_craft/pages/craft/craft_list_page.dart';
import 'package:find_craft/pages/demand/demand_details_page.dart';
import 'package:find_craft/pages/demand/demand_list_page.dart';

import 'package:find_craft/pages/home/home_page.dart';
import 'package:find_craft/pages/main/main_page.dart';
import 'package:find_craft/pages/publish/owner_publish_page.dart';


import 'package:find_craft/pages/select_city_page.dart';
import 'package:find_craft/pages/settings_page.dart';
import 'package:find_craft/pages/work_gallery_page.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainPage();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var ownerPublishHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OwnerPublshPage();
});

var selectCityHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SelectCityPage();
});

var requirementsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DemandListPage();
});

var requimentsDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String orderId = params['order_id'].first;
  return DemandDetailsPage(orderId: orderId,);
});

var craftListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CraftListPage();
});

var craftDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String craftId = params['craft_id'].first;
  return CraftDetailsPage(
    craftId: craftId,
  );
});

var workgalleryHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WorkGalleryPage();
});
var settingsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingsPage();
});
