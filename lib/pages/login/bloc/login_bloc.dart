import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial(false);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      print('$event.username    $event.password');

      if (event.username.isEmpty) {
        yield LoginFailure(error: '请输入用户名');
      }
      if (event.password.isEmpty) {
        yield LoginFailure(error: '请输入用户名');
      }

    }
  }
}
