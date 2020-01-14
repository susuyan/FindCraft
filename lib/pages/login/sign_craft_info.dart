import 'package:flutter/material.dart';

class SignCraftInfoPage extends StatefulWidget {
  SignCraftInfoPage({Key key}) : super(key: key);

  @override
  _SignCraftInfoPageState createState() => _SignCraftInfoPageState();
}

class _SignCraftInfoPageState extends State<SignCraftInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('身份信息'),),
    );
  }
}