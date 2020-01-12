import 'package:equatable/equatable.dart';

abstract class PublishState extends Equatable {
  const PublishState();
  List<Object> get props => [];
}

class InitialPublishState extends PublishState {
  @override
  List<Object> get props => [];
}

class PublishSuccess extends PublishState {}
class Publishing extends PublishState {}