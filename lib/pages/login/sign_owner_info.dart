import 'package:flutter/material.dart';

class SignOwnerInfoPage extends StatefulWidget {
  SignOwnerInfoPage({Key key}) : super(key: key);

  @override
  _SignOwnerInfoPageState createState() => _SignOwnerInfoPageState();
}

class _SignOwnerInfoPageState extends State<SignOwnerInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('身份信息'),
      ),
    );
  }
}
