import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/repositories/home_repository.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLoadOrder) {
      var model = await HomeRepository.requestHomeOrder();
    }
  }
}
