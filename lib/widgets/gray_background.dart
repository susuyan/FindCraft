import 'package:flutter/material.dart';

// class GrayBackground extends StatefulWidget {
//   GrayBackground({this.child,this.margin, Key key}) : super(key: key);
//   final Widget child;

//   EdgeInsets margin = EdgeInsets.only(top: 15);
//   EdgeInsets padding = EdgeInsets.fromLTRB(15, 12, 15, 12);

//   @override
//   _GrayBackgroundState createState() => _GrayBackgroundState();
// }

// class GrayBackground extends StatelessWidget {
//   GrayBackground({this.child, this.margin, Key key}) : super(key: key);
//   final Widget child;

//   EdgeInsets margin = EdgeInsets.only(top: 15);
//   EdgeInsets padding = EdgeInsets.fromLTRB(15, 12, 15, 12);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin,
//       padding: padding,
//       decoration: BoxDecoration(
//           color: Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(8)),
//       child: child,
//     );
//   }
// }

class GrayBackground extends StatefulWidget {
  GrayBackground(
      {this.child,
      this.margin = EdgeInsets.zero,
      Key key,
      this.padding = EdgeInsets.zero})
      : super(key: key);
  final Widget child;

  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  _GrayBackgroundState createState() => _GrayBackgroundState();
}

class _GrayBackgroundState extends State<GrayBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          color: Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(8)),
      child: widget.child,
    );
  }
}
