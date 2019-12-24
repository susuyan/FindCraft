import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectIdentityPage extends StatefulWidget {
  @override
  _SelectIdentityPageState createState() => _SelectIdentityPageState();
}

class _SelectIdentityPageState extends State<SelectIdentityPage> {
  Widget title = Container(
    padding: EdgeInsets.fromLTRB(42, 61, 0, 0),
    child: Text(
      '选择你的身份',
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
  );

  Widget selectForm = Form(
    child: Column(
      children: <Widget>[
        Container(
          height: 90,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.fromLTRB(40, 30, 40, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0x47FFFFFF)),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                height: 35,
                width: 30,
                image: AssetImage('assets/images/owner_icon.png'),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text('我是雇主',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              Image(
                height: 35,
                width: 30,
                image: AssetImage('assets/images/select_arrow_icon.png'),
              ),
            ],
          ),
        ),
        Container(
          height: 90,
          margin: EdgeInsets.fromLTRB(40, 15, 40, 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0x47FFFFFF)),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                height: 35,
                width: 30,
                image: AssetImage('assets/images/worker_icon.png'),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text('我是师傅',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              Image(
                height: 35,
                width: 30,
                image: AssetImage('assets/images/select_arrow_icon.png'),
              )
            ],
          ),
        )
      ],
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
            selectForm
          ],
        ),
      ),
    ));
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
      padding: EdgeInsets.zero,
      child: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(0),
        child: Image(
          width: 22,
          height: 22,
          image: AssetImage('assets/images/nav_back.png'),
        ),
      ),
    );
  }
}
