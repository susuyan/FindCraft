import 'package:flutter/material.dart';

class MineGallery extends StatelessWidget {
  const MineGallery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 160,
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8, left: 0),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              width: 130,
              height: 170,
            ),
          ],
        ),
      ),
    );
  }
}
