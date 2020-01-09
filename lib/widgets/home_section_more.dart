import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class HomeSectionMore extends StatelessWidget {
  const HomeSectionMore(this.title, {Key key, this.morePressed})
      : super(key: key);

  final String title;
  final Function morePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      height: 62,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: CommonStyle.black12_bold,
          ),
          Spacer(),
          GestureDetector(
            onTap: morePressed,
            child: Text(
              '更多',
              style: CommonStyle.black12,
            ),
          )
        ],
      ),
    );
  }
}
