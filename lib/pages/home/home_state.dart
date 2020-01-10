import 'package:equatable/equatable.dart';
import 'package:find_craft/repositories/models/craft_models.dart';

import 'package:find_craft/repositories/models/home_order_models.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeOrderLoadingState extends HomeState {}

class Loading extends HomeState {}

class LoadedOrder extends HomeState {
  final List<HomeOrderModel> orderList;

  LoadedOrder(this.orderList);

  @override
  List<Object> get props => [orderList];

  @override
  String toString() => 'Loaded { items: ${orderList.length} }';
}

class LoadedCraft extends HomeState {
  final List<CraftModel> craftList;

  LoadedCraft(this.craftList);

  @override
  List<Object> get props => [craftList];

  @override
  String toString() => 'Loaded { items: ${craftList.length} }';
}

class Failure extends HomeState {}
