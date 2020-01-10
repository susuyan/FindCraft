import 'dart:ui';

import 'package:find_craft/widgets/publish_button.dart';
import 'package:flutter/material.dart';

class PublishPage extends StatefulWidget {
  @override
  _PublishPageState createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xCCFFFFFF),
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 16,
                sigmaY: 16,
              ),
              child: Container(color: Colors.white.withOpacity(0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: RaisedButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              color: Colors.orangeAccent,
              child: Text(
                '关闭',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 203),
            child: PublishButton(
              title: '找个工\n我要找个人施工',
              image: Image.asset('assets/images/worker_icon.png'),
              colors: [Color(0xFF1F8FE5), Color(0xFF3BA7FD)],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 112),
            child: PublishButton(
              title: '发布需求\n我要发布用工信息',
              image: Image.asset('assets/images/owner_icon.png'),
              color: Color(0xFF563BFD),
            ),
          ),
        ],
      ),
    );
  }
}
