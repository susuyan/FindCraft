import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadOrder extends HomeEvent {}
class HomeLoadCraft extends HomeEvent {}




