import 'package:find_craft/application.dart';

import 'package:find_craft/pages/home/home_bloc.dart';
import 'package:find_craft/pages/home/home_event.dart';
import 'package:find_craft/pages/home/home_state.dart';
import 'package:find_craft/repositories/models/home_craft_models.dart';
import 'package:find_craft/repositories/models/home_order_models.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/home_craft_cell.dart';
import 'package:find_craft/widgets/home_header.dart';
import 'package:find_craft/widgets/home_recommend.dart';
import 'package:find_craft/widgets/home_section_more.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _createCraft(HomeState state) {
    if (state is LoadedCraft) {
      return Column(
        children: state.craftList.map<Widget>((craft) {
          return CraftCell(
            craft: craft,
          );
        }).toList(),
      );
    }

    return Container();
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context)..add(FetchOrder())..add(FetchCraft());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
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
                        HomeHeader(),
                        HomeRecommend(
                            tags: ['找木工', '找瓦工', '找水电工', '维修安装', '接个人活']),
                        SizedBox(
                          height: 10,
                        ),
                        HomeSectionMore(
                          '精选业主',
                          morePressed: () {
                            Application.router
                                .navigateTo(context, Routes.requirements);
                          },
                        ),
                        // OrderItems(state),
                        HomeSectionMore(
                          '师傅列表',
                          morePressed: () {
                            Application.router
                                .navigateTo(context, Routes.craftList);
                          },
                        ),
                        _createCraft(state)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}