import 'package:equatable/equatable.dart';

abstract class DemandEvent extends Equatable {
  const DemandEvent();
  @override
  List<Object> get props => [];
}

class FetchDemand extends DemandEvent {}

class FetchDemandDetails extends DemandEvent {
  final String orderId;

  FetchDemandDetails(this.orderId);
}
