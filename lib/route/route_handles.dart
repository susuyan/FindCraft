import 'package:find_craft/pages/main_page.dart';
import 'package:find_craft/pages/worker_publish_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainPage();
});

var workPublishHandler =
    Handler(handlerFunc: (BuildContext, Map<String, List<String>> params) {
  return WorkerPublishPage();
});
