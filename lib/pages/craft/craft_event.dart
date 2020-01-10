import 'package:equatable/equatable.dart';

abstract class CraftEvent extends Equatable {
  const CraftEvent();
  @override
  List<Object> get props => [];
}

class FetchCraftList extends CraftEvent {}

class FetchCraftDetails extends CraftEvent {
  final String craftId;

  FetchCraftDetails(this.craftId);
}