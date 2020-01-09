import 'package:equatable/equatable.dart';
import 'package:find_craft/repositories/models/demand_models.dart';

abstract class DemandState extends Equatable {
  const DemandState();
  @override
  List<Object> get props => [];
}

class InitialDemandState extends DemandState {
  @override
  List<Object> get props => [];
}

class Loading extends DemandState {}

class LoadedDemandList extends DemandState {
  final List<DemandModel> demandList;

  LoadedDemandList(this.demandList);
}
