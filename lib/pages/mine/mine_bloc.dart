import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/repositories/mine_repository.dart';
import './bloc.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  final MineRepository repository = MineRepository();

  @override
  MineState get initialState => InitialMineState();

  @override
  Stream<MineState> mapEventToState(
    MineEvent event,
  ) async* {
    if (event is FetchMine) {
      var mine = await repository.requestMine();

      yield LoadedMine(mine);
    }
  }
}
