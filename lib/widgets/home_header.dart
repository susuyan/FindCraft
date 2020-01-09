import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: Color(0xFF166DE8),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              '找个工',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image: AssetImage('assets/images/home_header_bg.png'),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              alignment: Alignment.bottomCenter,
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              '推荐',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
