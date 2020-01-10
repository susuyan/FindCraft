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
    if (event is FetchCraftList) {
      var craftList = await repository.requestCraftList();
      yield LoadedCraftList(craftList);
    }

    if (event is FetchCraftDetails) {
      var craftDetails = await repository.requestCraftDetails(event.craftId);
      yield LoadedCraftDetails(craftDetails);
    }
  }
}
