import 'package:find_craft/application.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/login/sign_bloc/bloc.dart';
import 'package:find_craft/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _repeatPasswordController = TextEditingController();

    _onSignpressd() {
      FocusScope.of(context).requestFocus(FocusNode());
      BlocProvider.of<SignBloc>(context).add(SignButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
          repeatPassword: _repeatPasswordController.text));
    }

    return BlocListener<SignBloc, SignState>(
        listener: (context, state) {
          if (state is SignFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 700),
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is SignedAccount) {
            Application.router.navigateTo(context, Routes.signRole,
                transition: TransitionType.cupertino);
          }
        },
        child: BlocProvider(
          create: (context) => SignBloc(),
          child: BlocBuilder<SignBloc, SignState>(
            builder: (context, state) {
              return Form(
                child: Column(
                  children: <Widget>[
                    _createTextFormField(
                        hintText: '手机号', controller: _usernameController),
                    _createTextFormField(
                        hintText: '密码', controller: _passwordController),
                    _createTextFormField(
                        hintText: '再输入一遍密码',
                        controller: _repeatPasswordController),
                    SignButton(
                      onPressed: state is! SignLoading ? _onSignpressd : null,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        '阅读并同意使用条款和隐私协议',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _createTextFormField(
      {String hintText = '', TextEditingController controller}) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0x47FFFFFF)),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: TextFormField(
          controller: controller,
          style: CommonStyle.white12,
          cursorColor: Colors.white,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0x47FFFFFF), fontSize: 12),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hoverColor: Colors.white,
            border: InputBorder.none,
          )),
    );
  }
}

class SignButton extends StatelessWidget {
  final Function onPressed;

  SignButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(41, 30, 41, 0),
      child: CupertinoButton(
        onPressed: onPressed,
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: Align(
          child: Text(
            '注册',
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
