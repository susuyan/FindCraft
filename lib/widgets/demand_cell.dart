import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/repositories/models/demand_models.dart';
import 'package:flutter/material.dart';

/// 需求列表
class DemandCell extends StatefulWidget {
  const DemandCell({
    Key key,
    this.demand,
  }) : super(key: key);

  final DemandModel demand;

  @override
  _DemandCellState createState() => _DemandCellState();
}

class _DemandCellState extends State<DemandCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.widget.demand != null ? this.widget.demand.title : '',
                    style: CommonStyle.black12,
                  ),
                  Spacer(),
                  Text(
                      this.widget.demand != null
                          ? this.widget.demand.changeData
                          : '',
                      style: CommonStyle.black12)
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
                decoration: BoxDecoration(
                    color: Color(0xFF207DFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '详情',
                  style: CommonStyle.white12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
