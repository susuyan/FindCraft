import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => TabHomeState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is OnTapHome) {
      if (state is TabHomeState) {
        return;
      }
      yield TabHomeState();
    }
    if (event is OnTapMine) {
      if (state is TabMineState) {
        return;
      }
      yield TabMineState();
    }
  }
}
