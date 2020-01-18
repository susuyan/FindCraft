import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField(
      {Key key,
      this.controller,
      this.hintText = '',
      this.margin = EdgeInsets.zero})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Color(0xFFF8F5F9),
          border: Border.all(color: Color(0x47FFFFFF)),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: TextFormField(
          controller: controller,
          style: CommonStyle.black12,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hoverColor: Colors.grey,
            border: InputBorder.none,
          )),
    );
  }
}
