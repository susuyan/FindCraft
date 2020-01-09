import 'package:find_craft/pages/demand/bloc.dart';
import 'package:find_craft/widgets/demand_cell.dart';
import 'package:find_craft/widgets/filtration_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DemandListPage extends StatefulWidget {
  const DemandListPage({Key key}) : super(key: key);

  @override
  _DemandListPageState createState() => _DemandListPageState();
}

class _DemandListPageState extends State<DemandListPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    void _onRefresh() {
      _refreshController.refreshCompleted();
    }

    return BlocProvider(
      create: (context) => DemandBloc()..add(FetchDemand()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('需求列表'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FiltrationHeader(),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                onRefresh: _onRefresh,
                child: BlocBuilder<DemandBloc, DemandState>(
                  builder: (context, state) {
                    if (state is LoadedDemandList) {
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return DemandCell(
                            demand: state.demandList[index],
                          );
                        },
                        itemCount: state.demandList.length,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
