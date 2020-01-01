import 'package:find_craft/application.dart';
import 'package:find_craft/pages/login/loginpage.dart';
import 'package:find_craft/pages/main_page.dart';
import 'package:find_craft/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
