import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/pages/authentication/bloc.dart';
import 'package:find_craft/repositories/user_repository.dart';

import './bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  final AuthenticationBloc authenticationBloc;
  final UserRepository userRepository;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(authenticationBloc != null),
        assert(authenticationBloc != null);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      yield LoginInitial();
    }
  }
}
