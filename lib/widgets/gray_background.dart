import 'package:flutter/material.dart';

class GrayBackground extends StatefulWidget {
  GrayBackground({this.child, Key key}) : super(key: key);
  final Widget child;

  @override
  _GrayBackgroundState createState() => _GrayBackgroundState();
}

class _GrayBackgroundState extends State<GrayBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
      decoration: BoxDecoration(
          color: Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(8)),
      child: this.widget.child,
    );
  }
}
