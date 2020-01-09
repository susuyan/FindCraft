import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

/// 精选雇主 Item
class HomeOrderCell extends StatefulWidget {
  const HomeOrderCell({
    this.didSelect,
  });
  final Function didSelect;

  @override
  _HomeOrderCellState createState() => _HomeOrderCellState();
}

class _HomeOrderCellState extends State<HomeOrderCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.didSelect,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'order.address',
                      style: CommonStyle.black12,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'order.changeData',
                        style: CommonStyle.black12,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  'order.city',
                  style: CommonStyle.black12,
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 0.5,
              color: Color(0x80A0A0A0),
            )
          ],
        ),
      ),
    );
  }
}
