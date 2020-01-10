import 'package:equatable/equatable.dart';

abstract class MineEvent extends Equatable {
  const MineEvent();
  @override
  List<Object> get props => [];
}

class FetchMine extends MineEvent {}
