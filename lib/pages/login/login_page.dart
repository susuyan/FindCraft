import 'package:bmprogresshud/progresshud.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/authentication/bloc.dart';
import 'package:find_craft/pages/login/login_bloc/bloc.dart';

import 'package:find_craft/pages/login/signpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocProvider(
            create: (context) => LoginBloc(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context)),
            child: ProgressHud(
              child: LoginForm(),
            ),
          ),
        ));
  }
}

// 注册按钮
class SignButton extends StatelessWidget {
  const SignButton({Key key}) : super(key: key);

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
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _onLoginPress() {
      FocusScope.of(context).requestFocus(FocusNode());
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    void _showLoading() async {
      ProgressHud.of(context).show(ProgressHudType.loading, "");
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          _showLoading();
        }

        return Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/login_bg.png'),
            )),
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(42, 80, 0, 0),
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      // 手机号
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 50, 40, 0),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          //设置四周边框
                          border: new Border.all(
                              width: 1, color: Color(0x47FFFFFF)),
                        ),
                        child: TextFormField(
                            style: CommonStyle.white12,
                            controller: _usernameController,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '手机号',
                              hintStyle: TextStyle(
                                  color: Color(0x47FFFFFF), fontSize: 12),
                              hasFloatingPlaceholder: false,
                              hoverColor: Colors.white,
                              border: InputBorder.none,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          //设置四周边框
                          border: new Border.all(
                              width: 1, color: Color(0x47FFFFFF)),
                        ),
                        child: // 密码
                            TextFormField(
                          obscureText: true,
                          style: CommonStyle.white12,
                          controller: _passwordController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              hintText: '密码',
                              hintStyle: TextStyle(
                                  color: Color(0x47FFFFFF), fontSize: 12),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(41, 30, 41, 0),
                        child: CupertinoButton(
                          color: Colors.white,
                          onPressed: state is! LoginButtonPressed
                              ? _onLoginPress
                              : null,
                          borderRadius: BorderRadius.circular(6),
                          child: Align(
                            child: Text(
                              '登录',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SignButton(),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    ));
  }
}
