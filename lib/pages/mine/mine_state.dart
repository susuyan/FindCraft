import 'package:equatable/equatable.dart';
import 'package:find_craft/repositories/models/mine_models.dart';

abstract class MineState extends Equatable {
  const MineState();
  @override
  List<Object> get props => [];
}

class InitialMineState extends MineState {
  @override
  List<Object> get props => [];
}

class LoadedMine extends MineState {
  final MineModel mine;

  LoadedMine(this.mine);
}
