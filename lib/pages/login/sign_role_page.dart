import 'package:find_craft/application.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/common/fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignRolePage extends StatefulWidget {
  @override
  _SignRolePageState createState() => _SignRolePageState();
}

class _SignRolePageState extends State<SignRolePage> {
  Widget title = Container(
    padding: EdgeInsets.fromLTRB(42, 61, 0, 0),
    child: Text(
      '选择你的身份',
      style: TextStyle(color: Colors.white, fontSize: 12),
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
              width: double.infinity,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, top: 50),
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
            ),
            title,
            RoleButton(
              title: '我是业主',
              image: 'assets/images/owner_icon.png',
              onPressed: () {
                Application.router.navigateTo(context, Routes.signOrderInfo,
                    transition: TransitionType.cupertinoFullScreenDialog);
              },
            ),
            RoleButton(
              title: '我是师傅',
              image: 'assets/images/worker_icon.png',
              onPressed: () {
                Application.router.navigateTo(context, Routes.signCraftInfo,
                    transition: TransitionType.cupertinoFullScreenDialog);
              },
            )
          ],
        ),
      ),
    ));
  }
}

class RoleButton extends StatelessWidget {
  const RoleButton(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.onPressed})
      : super(key: key);
  final String image;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
              image: AssetImage(image),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(title,
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
      ),
    );
  }
}
