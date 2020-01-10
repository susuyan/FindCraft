import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/craft/bloc.dart';

import 'package:find_craft/widgets/filtration_header.dart';
import 'package:find_craft/widgets/home_craft_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CraftListPage extends StatefulWidget {
  CraftListPage({Key key}) : super(key: key);

  @override
  _CraftListPageState createState() => _CraftListPageState();
}

class _CraftListPageState extends State<CraftListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('师傅列表'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FiltrationHeader(),
            CraftCategoryView(['找瓦工', '找木工', '找电工', '找瓦工', '找木工', '找电工']),
            Expanded(
              child: ListView(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CraftCategoryView extends StatefulWidget {
  const CraftCategoryView(this.categories, {Key key}) : super(key: key);
  final List<String> categories;

  @override
  _CraftCategoryViewState createState() => _CraftCategoryViewState();
}

class _CraftCategoryViewState extends State<CraftCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: this.widget.categories.map<Widget>((item) {
          return Container(
            margin: EdgeInsets.only(left: 10),
            constraints: BoxConstraints(minWidth: 74, minHeight: 35),
            decoration: BoxDecoration(
                color: Color(0xFF8D9DB5),
                borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Text(
              item,
              style: CommonStyle.white12,
            ),
          );
        }).toList(),
      ),
    );
  }
}
