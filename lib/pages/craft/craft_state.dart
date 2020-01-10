import 'package:equatable/equatable.dart';
import 'package:find_craft/repositories/models/craft_models.dart';

abstract class CraftState extends Equatable {
  const CraftState();
  @override
  List<Object> get props => [];
}

class InitialCraftState extends CraftState {
  @override
  List<Object> get props => [];
}

class Loading extends CraftState {}

class LoadedCraftList extends CraftState {
  final List<CraftModel> craftList;

  LoadedCraftList(this.craftList);
}

class LoadedCraftDetails extends CraftState {
  final CraftModel craftDetails;

  LoadedCraftDetails(this.craftDetails);
}
