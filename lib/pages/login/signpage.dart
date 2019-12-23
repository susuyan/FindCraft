import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:find_craft/pages/login/selectIdentitypage.dart';

class Signpage extends StatefulWidget {
  @override
  _SignpageState createState() => _SignpageState();
}

class _SignpageState extends State<Signpage> {
  Widget title = Container(
    padding: EdgeInsets.fromLTRB(42, 61, 0, 0),
    child: Text(
      '注册账号',
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
  );

  Widget signForm = Form(
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
                labelText: '验证码',
                labelStyle: TextStyle(color: Color(0x47FFFFFF), fontSize: 12),
                hasFloatingPlaceholder: false,
                hoverColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white)),
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

  Widget lience = Center(
    child: Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        '阅读并同意使用条款和隐私协议',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
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
              SizedBox(
                width: double.infinity,
              ),
              NavibackButton(),
              title,
              signForm,
              SignButton(),
              lience
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
      padding: EdgeInsets.fromLTRB(11, 0, 20, 20),
      child: FlatButton(
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

class SignButton extends StatefulWidget {
  @override
  _SignButtonState createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(41, 30, 41, 0),
      child: CupertinoButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectIdentityPage()),
          );
        },
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
