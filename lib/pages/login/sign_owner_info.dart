import 'package:find_craft/widgets/address_button.dart';
import 'package:find_craft/widgets/commit_button.dart';
import 'package:find_craft/widgets/sign_textfield.dart';
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
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                '已选择业主',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                '请填写你的真实信息,有助于提高接单率',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ),
            SignTextField(
              hintText: '输入自己的真实姓名',
              margin: EdgeInsets.only(top: 30),
            ),
            SignTextField(
              hintText: '输入自己的微信号',
              margin: EdgeInsets.only(top: 20),
            ),
            AddressButton(),
            CommitButton()
          ],
        ),
      ),
    );
  }
}
