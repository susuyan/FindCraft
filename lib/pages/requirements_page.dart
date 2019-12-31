import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/widgets/filtration_header.dart';
import 'package:flutter/material.dart';

class RequirementsPage extends StatefulWidget {
  const RequirementsPage({Key key}) : super(key: key);

  @override
  _RequirementsPageState createState() => _RequirementsPageState();
}

class _RequirementsPageState extends State<RequirementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('需求列表'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FiltrationHeader(),
          Expanded(
            child: ListView(
              children: <Widget>[RequirementCell()],
            ),
          )
        ],
      ),
    );
  }
}

/// 需求列表
class RequirementCell extends StatefulWidget {
  const RequirementCell({
    Key key,
  }) : super(key: key);

  @override
  _RequirementCellState createState() => _RequirementCellState();
}

class _RequirementCellState extends State<RequirementCell> {
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
                    '海淀区空调移机',
                    style: CommonStyle.black12,
                  ),
                  Spacer(),
                  Text('2019.06.16 12:00', style: CommonStyle.black12)
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


