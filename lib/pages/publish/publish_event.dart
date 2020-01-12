import 'package:equatable/equatable.dart';

abstract class PublishEvent extends Equatable {
  const PublishEvent();

  @override
  List<Object> get props => [];
}

class PublishDemand extends PublishEvent {
  final String title;
  final String content;
  final String city;
  final String address;

  PublishDemand(this.title, this.content, this.city, this.address);
}
