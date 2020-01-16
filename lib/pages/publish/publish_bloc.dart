import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/repositories/publish_repository.dart';
import './bloc.dart';

class PublishBloc extends Bloc<PublishEvent, PublishState> {
  final PublishRepository repository = PublishRepository();

  @override
  PublishState get initialState => InitialPublishState();

  @override
  Stream<PublishState> mapEventToState(
    PublishEvent event,
  ) async* {
    if (event is PublishDemand) {
      yield Publishing();
      try {
        repository.requestPublishDemand(event);
        yield PublishSuccess();
      } catch (e) {
        yield PublishFailure();
      }
    }
  }
}
