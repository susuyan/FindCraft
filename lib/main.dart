import 'package:find_craft/application.dart';

import 'package:find_craft/pages/login/login_page.dart';

import 'package:find_craft/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
