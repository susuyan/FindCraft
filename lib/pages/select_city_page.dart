import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class SelectCityPage extends StatefulWidget {
  SelectCityPage({Key key}) : super(key: key);

  @override
  _SelectCityPageState createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择所在位置'),
      ),
      body: ListView(
        children: <Widget>[
          CityCell(
            city: '北京',
          )
        ],
      ),
    );
  }
}

class CityCell extends StatefulWidget {
  CityCell({this.city, Key key}) : super(key: key);

  final String city;

  @override
  _CityCellState createState() => _CityCellState();
}

class _CityCellState extends State<CityCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.widget.city,
            style: CommonStyle.black12,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 0.5,
            color: Color(0xFFF1F1F1),
          )
        ],
      ),
    );
  }
}
