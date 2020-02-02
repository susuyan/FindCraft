import 'package:find_craft/application.dart';

import 'package:find_craft/pages/home/home_bloc.dart';
import 'package:find_craft/pages/home/home_event.dart';
import 'package:find_craft/pages/home/home_state.dart';
import 'package:find_craft/repositories/models/craft_models.dart';

import 'package:find_craft/repositories/models/home_order_models.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/craft_cell.dart';

import 'package:find_craft/widgets/home_header.dart';
import 'package:find_craft/widgets/home_order_cell.dart';
import 'package:find_craft/widgets/home_recommend.dart';
import 'package:find_craft/widgets/home_section_more.dart';
import 'package:find_craft/common/fluro/fluro.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<CraftModel> _craftList;
  List<HomeOrderModel> _orderList;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchOrder())..add(FetchCraft()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadedCraft) {
            _craftList = state.craftList;
          }

          if (state is LoadedOrder) {
            _orderList = state.orderList;
          }

          return Scaffold(
            body: SafeArea(
              top: false,
              bottom: false,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    stretch: false,
                    expandedHeight: 220,
                    flexibleSpace: HomeHeader(),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text('推荐',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      HomeRecommend(
                        tags: ['找木工', '找瓦工', '找水电工', '维修安装'],
                        onPressedTag: (index) {
                          Application.router.navigateTo(
                              context, Routes.craftList + '?tag_index=$index',
                              transition: TransitionType.cupertino);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HomeSectionMore(
                        '精选业主',
                        morePressed: () {
                          Application.router.navigateTo(
                              context, Routes.demandList,
                              transition: TransitionType.cupertino);
                        },
                      ),
                      _createOrder(context),
                      HomeSectionMore(
                        '师傅列表',
                        morePressed: () {
                          Application.router.navigateTo(
                              context, Routes.craftList,
                              transition: TransitionType.cupertino);
                        },
                      ),
                      _createCraft(context)
                    ]),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _createOrder(BuildContext context) {
    if (_orderList != null) {
      return Column(
        children: _orderList.map<Widget>((order) {
          return HomeOrderCell(
            order: order,
            didSelected: () {
              var orderId = order.id;
              Application.router.navigateTo(
                  context, Routes.demandDetails + '?order_id=$orderId',
                  transition: TransitionType.cupertino);
            },
          );
        }).toList(),
      );
    }

    return Container();
  }

  _createCraft(BuildContext context) {
    if (_craftList != null) {
      return Column(
        children: _craftList.map<Widget>((craft) {
          return CraftCell(
            craft: craft,
            didSelected: () {
              var craftId = craft.id;
              Application.router.navigateTo(
                  context, Routes.craftDetails + '?craft_id=$craftId',
                  transition: TransitionType.cupertino);
            },
          );
        }).toList(),
      );
    }

    return Container();
  }
}
