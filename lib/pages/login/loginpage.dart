import 'dart:ui';

import 'package:find_craft/pages/login/signpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title = "登录";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextFormField passwordField() => TextFormField(
        decoration: InputDecoration(
            labelText: '密码',
            labelStyle: TextStyle(color: Color(0x47FFFFFF), fontSize: 12),
            hasFloatingPlaceholder: false,
            hoverColor: Colors.white,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white)),
      );

  Widget navBack = Container(
    padding: EdgeInsets.fromLTRB(11, 0, 20, 20),
    child: Image.asset('assets/images/nav_back.png'),
  );

  Widget loginTitle = Container(
    padding: EdgeInsets.fromLTRB(42, 61, 0, 0),
    child: Text(
      '登录',
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
  );

  Widget loginForm = Form(
    child: Column(
      children: <Widget>[
        Container(
          height: 50,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.fromLTRB(40, 30, 40, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0x47FFFFFF)),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('CN +86',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: TextFormField(
                    decoration: InputDecoration(
                  labelText: '手机号',
                  labelStyle: TextStyle(color: Color(0x47FFFFFF), fontSize: 12),
                  hasFloatingPlaceholder: false,
                  hoverColor: Colors.white,
                  border: InputBorder.none,
                )),
              ))
            ],
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(40, 15, 40, 10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0x47FFFFFF)),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: '密码',
                labelStyle: TextStyle(color: Color(0x47FFFFFF), fontSize: 12),
                hasFloatingPlaceholder: false,
                hoverColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ),
  );

  Widget loginButton = Container(
    margin: EdgeInsets.fromLTRB(41, 30, 41, 0),
    child: CupertinoButton(
      onPressed: () {},
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      child: Align(
        child: Text(
          '登录',
          style: TextStyle(color: Colors.blue, fontSize: 12),
        ),
      ),
    ),
  );

  Widget forgetButton = Container(
    child: Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Text('忘记密码?', style: TextStyle(color: Colors.white, fontSize: 12)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_bg.png'),
              fit: BoxFit.fill)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight,
            ),
            navBack,
            loginTitle,
            loginForm,
            loginButton,
            forgetButton,
            SignButton(),
          ],
        ),
      ),
    ));
  }
}

class SignButton extends StatefulWidget {
  @override
  _SignButtonState createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.fromLTRB(41, 71, 41, 0),
      alignment: Alignment.center,
      width: 123,
      height: 50,
      child: Align(
        child: CupertinoButton(
          color: Color(0xFF3F8FFF),
          padding: EdgeInsets.fromLTRB(38, 14, 38, 14),
          borderRadius: BorderRadius.circular(25),
          child: Align(
            child: Text('注册账号',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signpage()),
            );
          },
        ),
      ),
    ));
  }
}
