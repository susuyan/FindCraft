import 'package:flutter/material.dart';

class ModalBody extends StatefulWidget {
  const ModalBody({Key key, this.child}) : super(key: key);

  final Widget child;

  static showModalBottom(BuildContext context, Widget page) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (context) {
          return page;
        });
  }

  @override
  _ModalBodyState createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 100),
          child: this.widget.child,
        ),
      ],
    );
  }
}
