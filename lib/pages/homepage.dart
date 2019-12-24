import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:find_craft/widgets/navigation_dot_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget sectionHeader = Container(
    height: 240,
    color: Color(0xFF166DE8),
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 80,
          left: 20,
          child: Text(
            '找个工',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 35),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image(
              image: AssetImage('assets/images/home_header_bg.png'),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 50,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            alignment: Alignment.bottomCenter,
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 20, bottom: 15),
          child: Text(
            '推荐',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );

  Widget sectionRecommend = Container(
    height: 115,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TagsView(),
        Container(
          height: 10,
          color: Color(0xFFF8F8F8),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                sectionHeader,
                sectionRecommend,
                MoreHeaderView(),
                OrderItem(),
                OrderItem(),
                OrderItem(),
                OrderItem(),
                MoreHeaderView(),
                CraftCell(),
                CraftCell(),
                CraftCell(),
                CraftCell(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationDotBar(
              items: <BottomNavigationDotBarItem>[
                BottomNavigationDotBarItem(
                  icon: Icons.map,
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

class TagsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _createTags(List<String> tags) {
      var _tagArr = List<Widget>();

      for (var item in tags) {
        _tagArr.add(Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF253364), Color(0xFF3C4A7C)])),
          constraints: BoxConstraints(
              maxWidth: window.physicalSize.width / 8, minHeight: 40),
          child: Center(
            child: Text(
              '$item',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ));
      }

      return _tagArr;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
      child: Wrap(
        spacing: 15,
        runSpacing: 10,
        children: _createTags(['找木工', '找瓦工', '找水电工', '维修安装', '接个人活']),
      ),
    );
  }
}

class MoreHeaderView extends StatefulWidget {
  @override
  _MoreHeaderViewState createState() => _MoreHeaderViewState();
}

class _MoreHeaderViewState extends State<MoreHeaderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
      height: 40,
      color: Colors.white,
      child: Row(
        children: <Widget>[Text('精选雇主'), Spacer(), Text('更多')],
      ),
    );
  }
}

class OrderItem extends StatefulWidget {
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[Text('朝阳区青年路'), Text('2019-12-12')],
              ),
              Spacer(),
              Text('北京')
            ],
          ),
          Container(
            height: 1,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class CraftCell extends StatefulWidget {
  @override
  _CraftCellState createState() => _CraftCellState();
}

class _CraftCellState extends State<CraftCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
              Column(
                children: <Widget>[
                  Text('小名'),
                ],
              ),
              Spacer(),
              Text('北京')
            ],
          ),
          Container(
            height: 1,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
