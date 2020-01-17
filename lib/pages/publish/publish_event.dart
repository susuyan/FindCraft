import 'package:equatable/equatable.dart';
import 'package:find_craft/widgets/demand_tag.dart';
import 'package:flutter/material.dart';

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
  final List<Tag> tags;

  PublishDemand({
    @required this.title,
    @required this.content,
    @required this.city,
    @required this.address,
    @required this.tags
  });
}
