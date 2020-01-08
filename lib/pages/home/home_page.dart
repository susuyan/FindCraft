import 'dart:ui';

import 'package:find_craft/application.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/home/home_bloc.dart';
import 'package:find_craft/pages/home/home_event.dart';
import 'package:find_craft/pages/home/home_state.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/craft_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadOrder()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
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
                      RecommendTags(
                          tags: ['找木工', '找瓦工', '找水电工', '维修安装', '接个人活']),
                      Container(
                        height: 10,
                      ),
                      MoreHeaderView(
                        title: '业主需求',
                        morePressed: () {
                          Application.router
                              .navigateTo(context, Routes.requirements);
                        },
                      ),
                      OrderItem(
                        didSelect: () {
                          Application.router
                              .navigateTo(context, Routes.requirementsDetails);
                        },
                      ),
                      MoreHeaderView(
                        title: '师傅列表',
                        morePressed: () {
                          Application.router
                              .navigateTo(context, Routes.craftList);
                        },
                      ),
                      CraftCell(
                        didSelect: () {
                          Application.router
                              .navigateTo(context, Routes.craftDetails);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

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
}

class MoreHeaderView extends StatefulWidget {
  const MoreHeaderView({this.title, this.morePressed, Key key})
      : super(key: key);
  final String title;
  final Function morePressed;

  @override
  _MoreHeaderViewState createState() => _MoreHeaderViewState();
}

/// 更多 Header
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
            this.widget.title,
            style: CommonStyle.black12_bold,
          ),
          Spacer(),
          GestureDetector(
            onTap: this.widget.morePressed,
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

/// 精选雇主 Item
class OrderItem extends StatefulWidget {
  const OrderItem({
    this.didSelect,
    Key key,
  }) : super(key: key);
  final Function didSelect;

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
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
                Text(
                  '北京',
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

class RecommendTags extends StatelessWidget {
  const RecommendTags({this.tags, Key key}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    var _boxSize = MediaQuery.of(context).size;
    var _minWidth = (_boxSize.width - 30 - 40) / 3;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: tags.map<Widget>((tag) {
              return Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                    maxWidth: _minWidth, minWidth: _minWidth, minHeight: 44),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF3C4A7C), Color(0xFF253364)])),
                child: Text(
                  '$tag',
                  style: CommonStyle.white12,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
