import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class OnTapHome extends MainEvent {}

class OnTapMine extends MainEvent {}
