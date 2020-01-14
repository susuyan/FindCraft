import 'dart:async';
import 'package:bloc/bloc.dart';

import './bloc.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  @override
  SignState get initialState => InitialSignState();

  @override
  Stream<SignState> mapEventToState(
    SignEvent event,
  ) async* {
    if (event is SignButtonPressed) {
      yield SignLoading();

      if (event.username.isEmpty) {
        yield SignFailure('手机号不能为空');
      } else if (event.password.isEmpty) {
        yield SignFailure('密码不能为空');
      } else if (event.repeatPassword.isEmpty) {
        yield SignFailure('密码不能为空');
      } else if (event.password != event.repeatPassword) {
        yield SignFailure('密码不一致');
      } else {
        // UserRepository.requestSign(event);
        yield SignedAccount();
      }
    }
  }
}
