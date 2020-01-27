import 'package:find_craft/application.dart';

import 'package:find_craft/pages/login/sign_bloc/bloc.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/address_button.dart';
import 'package:find_craft/widgets/commit_button.dart';
import 'package:find_craft/widgets/sign_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class SignOwnerInfoPage extends StatefulWidget {
  SignOwnerInfoPage(this.signBloc, {Key key}) : super(key: key);
  final SignBloc signBloc;

  @override
  _SignOwnerInfoPageState createState() => _SignOwnerInfoPageState();
}

class _SignOwnerInfoPageState extends State<SignOwnerInfoPage> {
  TextEditingController _usernameContrller = TextEditingController();
  TextEditingController _wechatContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('身份信息'),
        ),
        body: BlocListener<SignBloc, SignState>(listener: (context, state) {
          if (state is SignedOwnerInfo) {
            showToast('注册完成');
            Application.router
                .navigateTo(context, Routes.login, clearStack: true);
          }
        }, child: BlocBuilder<SignBloc, SignState>(
          builder: (context, state) {
            _onCommit() {
              if (_usernameContrller.text.isEmpty) {
                showToast('请输入名字');
                return;
              }
              if (_wechatContrller.text.isEmpty) {
                showToast('请输入微信号');
                return;
              }
              BlocProvider.of<SignBloc>(context).add(SignOwnerInfo(
                  username: _usernameContrller.text,
                  wechat: _wechatContrller.text,
                  city: '北京'));
            }

            return Container(
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
                    controller: _usernameContrller,
                  ),
                  SignTextField(
                    hintText: '输入自己的微信号',
                    margin: EdgeInsets.only(top: 20),
                    controller: _wechatContrller,
                  ),
                  AddressButton(
                    onPressed: () {},
                  ),
                  CommitButton(
                      onPressed: state is! SignLoading ? _onCommit : null)
                ],
              ),
            );
          },
        )));
  }
}
