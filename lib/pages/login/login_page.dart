import 'dart:ui';

import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/login/signpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/login_bg.png'),
            )),
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(42, 100, 0, 0),
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                LoginForm(),
              ],
            )
          ],
        ));
  }
}

// 登录按钮
class LoginButton extends StatefulWidget {
  LoginButton({this.loginPressed, Key key}) : super(key: key);

  final Function loginPressed;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.loginPressed,
      child: Container(
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
      ),
    );
  }
}

// 注册按钮
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
      child: CupertinoButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Signpage()),
          );
        },
        color: Color(0xFF3F8FFF),
        padding: EdgeInsets.fromLTRB(38, 14, 38, 14),
        borderRadius: BorderRadius.circular(25),
        child: Align(
          child:
              Text('注册账号', style: TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ),
    ));
  }
}

// 账号密码表单
class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          // 手机号
          Container(
            decoration: new BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            //设置四周边框
            border: new Border.all(width: 1, color: Color(0x47FFFFFF)),
          ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('CN +86',
                  style: CommonStyle.white12),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: '手机号',
                      labelStyle:
                          TextStyle(color: Color(0x47FFFFFF), fontSize: 12),
                      hasFloatingPlaceholder: false,
                      hoverColor: Colors.white,
                      border: InputBorder.none,
                    )),
              ))
            ],
          ),
          ),
          // 密码
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: '密码',
              labelStyle: CommonStyle.white12,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))
            ),
          ),
          LoginButton(),
          SignButton(),
        ],
      ),
    );
  }
}
