import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/repositories/demand_repository.dart';
import './bloc.dart';

class DemandBloc extends Bloc<DemandEvent, DemandState> {
  final repository = DemandRepository();

  @override
  DemandState get initialState => InitialDemandState();

  @override
  Stream<DemandState> mapEventToState(
    DemandEvent event,
  ) async* {
    if (event is FetchDemand) {
      yield Loading();
      var demandList = await repository.requestDemandList();
      yield LoadedDemandList(demandList);
    }
    if (event is FetchDemandDetails) {
      yield Loading();
      var demandDetails = await repository.requestDemandDetails();
      yield LoadedDemandDetails(demandDetails);
    }
  }
}
