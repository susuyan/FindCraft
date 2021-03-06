import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/widgets/gray_background.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatefulWidget {
  ContactInfo({this.icon, this.info, Key key}) : super(key: key);
  final String icon;
  final String info;
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  @override
  Widget build(BuildContext context) {
    return GrayBackground(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(15, 12, 12, 15),
      child: Row(
        children: <Widget>[
          Image(
            width: 20,
            image: AssetImage(this.widget.icon),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            this.widget.info,
            style: CommonStyle.black12,
          )
        ],
      ),
    );
  }
}
