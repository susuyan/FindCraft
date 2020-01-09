import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/repositories/home_repository.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => Loading();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchOrder) {
      try {
        var orderList = await HomeRepository.requestOrder();
        yield LoadedOrder(orderList);
      } catch (e) {
        print(e);
        yield Failure();
      }
    }

    if (event is FetchCraft) {
      try {
        var craftList = await HomeRepository.requestCraft();
        yield LoadedCraft(craftList);
      } catch (e) {
        print(e);
        yield Failure();
      }
    }
  }
}
