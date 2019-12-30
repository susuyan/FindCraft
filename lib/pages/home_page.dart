import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/helper/screen_helper.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:flutter/material.dart';

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
                MoreHeaderView(),
                CraftCell(),
              ],
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
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      height: 62,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(
            '精选雇主',
            style: CommonStyle.black12_bold,
          ),
          Spacer(),
          Text('更多',style: CommonStyle.black12,)
        ],
      ),
    );
  }
}

/// 精选雇主 Item
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Text(
                      '朝阳区青年路',
                      style: CommonStyle.black12,
                    ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '2019-12-12',
                      style: CommonStyle.black12,
                    ),
                  )
                ],
              ),
              Spacer(),
              Text('北京',style: CommonStyle.black12,)
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
              FLAvatar(
                height: 50,
                width: 50,
                radius: 25,
                color: Colors.blue,
                text: 'TE',
                textStyle: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('小名'),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: CraftTags(
                          tags: ['木工', '水电', '吊顶'],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text('北京'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CraftTags extends StatelessWidget {
  const CraftTags({Key key, this.tags}) : super(key: key);

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: tags.map<Widget>((tag) {
        return Container(
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: BoxDecoration(
              color: Color(0xFF8D9DB5), borderRadius: BorderRadius.circular(3)),
          child: Text(
            '$tag',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }).toList(),
    );
  }
}
