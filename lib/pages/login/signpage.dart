import 'package:find_craft/pages/login/sign_bloc/sign_bloc.dart';
import 'package:find_craft/pages/login/sign_bloc/sign_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signpage extends StatefulWidget {
  @override
  _SignpageState createState() => _SignpageState();
}

class _SignpageState extends State<Signpage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignBloc(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/login_bg.png'),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                left: 10,
                top: 20,
                child: NavibackButton(),
              ),
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(42, 100, 0, 0),
                    child: Text(
                      '注册账号',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SignForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavibackButton extends StatefulWidget {
  @override
  _NavibackButtonState createState() => _NavibackButtonState();
}

class _NavibackButtonState extends State<NavibackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 4, top: 10),
      child: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Image(
          width: 22,
          height: 22,
          image: AssetImage('assets/images/nav_back.png'),
        ),
      ),
    );
  }
}
