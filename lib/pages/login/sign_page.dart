import 'package:find_craft/application.dart';
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) => SignBloc(),
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
            ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: CupertinoButton(
                    onPressed: () {
                      Application.router.pop(context);
                    },
                    child: Image(
                      image: AssetImage('assets/images/nav_back.png'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(42, 50, 0, 0),
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
    );
  }
}
