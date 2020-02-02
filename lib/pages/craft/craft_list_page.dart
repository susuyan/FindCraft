import 'package:find_craft/application.dart';
import 'package:find_craft/pages/craft/bloc.dart';
import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/craft_category.dart';
import 'package:find_craft/widgets/craft_cell.dart';
import 'package:find_craft/widgets/filtration_header.dart';
import 'package:find_craft/common/fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CraftListPage extends StatefulWidget {
  CraftListPage({Key key, this.tagIndex}) : super(key: key);

  final int tagIndex;

  @override
  _CraftListPageState createState() => _CraftListPageState();
}

class _CraftListPageState extends State<CraftListPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftBloc()..add(FetchCraftList()),
      child: BlocBuilder<CraftBloc, CraftState>(
        builder: (context, state) {
          void _onRefresh() {
            BlocProvider.of<CraftBloc>(context).add(FetchCraftList());
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('师傅列表'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FiltrationHeader(),
                CraftCategoryView(
                  ['找木工', '找瓦工', '找水电工', '维修安装'],
                  selectedIndex: widget.tagIndex,
                ),
                Expanded(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    onRefresh: _onRefresh,
                    child: state is LoadedCraftList
                        ? ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return CraftCell(
                                didSelected: () {
                                  var craftId = state.craftList[index].id;
                                  Application.router.navigateTo(
                                      context,
                                      Routes.craftDetails +
                                          '?craft_id=$craftId',
                                      transition: TransitionType.cupertino);
                                },
                                craft: state.craftList[index],
                                type: CraftCellType.craftList,
                              );
                            },
                            itemCount: state.craftList.length,
                          )
                        : Container(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
