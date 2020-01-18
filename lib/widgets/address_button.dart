import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({Key key, @required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: Color(0xFFF8F5F9),
            border: Border.all(color: Color(0x47FFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Row(
          children: <Widget>[
            Text(
              '所在位置',
              style: CommonStyle.gray12,
            ),
            Spacer(),
            Text('北京', style: CommonStyle.black12),
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
