import 'package:equatable/equatable.dart';

abstract class CraftEvent extends Equatable {
  const CraftEvent();
  @override
  List<Object> get props => [];
}

class FetchCraftList extends CraftEvent {}
