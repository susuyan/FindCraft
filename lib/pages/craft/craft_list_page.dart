import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/craft/bloc.dart';
import 'package:find_craft/widgets/craft_cell.dart';
import 'package:find_craft/widgets/filtration_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CraftListPage extends StatefulWidget {
  CraftListPage({Key key}) : super(key: key);

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
                    ['找木工', '找瓦工', '找水电工', '找瓦工', '维修安装', '接个人活']),
                Expanded(
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    onRefresh: _onRefresh,
                    child: state is LoadedCraftList
                        ? ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return CraftCell(
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
