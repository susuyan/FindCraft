import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();
  @override
  List<Object> get props => [];
}

class InitialMainState extends MainState {}

class TabHomeState extends MainState {}

class TabMineState extends MainState {}
