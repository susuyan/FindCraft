import 'package:find_craft/widgets/bottom_clipper.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomClipper(),
      child: Container(
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
          ],
        ),
      ),
    );
  }
}
