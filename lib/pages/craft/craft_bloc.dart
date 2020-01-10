import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/repositories/craft_repository.dart';
import './bloc.dart';

class CraftBloc extends Bloc<CraftEvent, CraftState> {
  final CraftRepository repository = CraftRepository();
  @override
  CraftState get initialState => InitialCraftState();

  @override
  Stream<CraftState> mapEventToState(
    CraftEvent event,
  ) async* {
    if (event is FetchCraft) {
      var craftList = await repository.requestCraftList();

      yield LoadedCraftList(craftList);
    }
  }
}
