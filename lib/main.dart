import 'package:flutter/material.dart';
// import 'package:find_craft/pages/homepage.dart';
import 'package:find_craft/pages/login/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter layout demo', home: LoginPage());
  }
}
