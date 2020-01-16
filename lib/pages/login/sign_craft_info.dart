import 'package:find_craft/application.dart';
import 'package:find_craft/pages/login/sign_bloc/bloc.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/address_button.dart';
import 'package:find_craft/widgets/commit_button.dart';
import 'package:find_craft/widgets/demand_tag.dart';
import 'package:find_craft/widgets/sign_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class SignCraftInfoPage extends StatefulWidget {
  SignCraftInfoPage({Key key}) : super(key: key);

  @override
  _SignCraftInfoPageState createState() => _SignCraftInfoPageState();
}

class _SignCraftInfoPageState extends State<SignCraftInfoPage> {
  TextEditingController _usernameContrller = TextEditingController();
  TextEditingController _wechatContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('身份信息'),
      ),
      body: BlocProvider(
        create: (context) => SignBloc(),
        child: BlocListener<SignBloc, SignState>(listener: (context, state) {
          if (state is SignedCraftInfo) {
            showToast('注册完成');
            Application.router
                .navigateTo(context, Routes.login, clearStack: true);
          }
        }, child: BlocBuilder<SignBloc, SignState>(
          builder: (context, state) {
            _onCommit() {
              BlocProvider.of<SignBloc>(context).add(SignCraftInfo(
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
                      '已选择师傅',
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
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      '选择自己擅长的技能',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  DemandTag(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    tags: [
                      Tag('找木工'),
                      Tag('找瓦工'),
                      Tag('找水电工'),
                      Tag('维修安装'),
                      Tag('接个人活')
                    ],
                  ),
                  SignTextField(
                    controller: _usernameContrller,
                    hintText: '真实姓名',
                    margin: EdgeInsets.only(top: 30),
                  ),
                  SignTextField(
                    controller: _wechatContrller,
                    hintText: '输入微信号便于客户联系',
                    margin: EdgeInsets.only(top: 20),
                  ),
                  AddressButton(),
                  CommitButton(
                      onPressed: state is! SignLoading ? _onCommit : null)
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
