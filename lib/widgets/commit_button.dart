import 'package:find_craft/common/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommitButton extends StatelessWidget {
  const CommitButton({Key key, @required this.onPressed}) : super(key: key);
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 30),
      child: CupertinoButton(
        onPressed: onPressed != null ? onPressed : () {},
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
        child: Text(
          '提交信息',
          style: CommonStyle.white12,
        ),
      ),
    );
  }
}
