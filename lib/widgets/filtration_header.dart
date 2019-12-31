import 'package:flutter/material.dart';

class FiltrationHeader extends StatefulWidget {
  FiltrationHeader({Key key}) : super(key: key);

  @override
  _FiltrationHeaderState createState() => _FiltrationHeaderState();
}

class _FiltrationHeaderState extends State<FiltrationHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        shadowColor: Color(0x1A000000),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0x1A000000),
              height: 1,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('推荐'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('最新'),
                  Spacer(),
                  Text('北京'),
                  Icon(Icons.arrow_right)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}