import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/pages/authentication/authentication_bloc.dart';
import 'package:find_craft/pages/authentication/authentication_event.dart';

import 'package:find_craft/repositories/user_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final UserRepository userRepository = UserRepository();

  LoginBloc({@required this.authenticationBloc})
      : assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      if (event.username.isEmpty || event.password.isEmpty) {
        yield LoginFailure(error: '手机号和密码不能为空');
      } else {
        try {
          var model = await userRepository.requestLogin(event);
          await userRepository.storeToken(model);
          authenticationBloc.add(LoggedIn());
          await userRepository.requestUserInfo(event.username);

          yield LoginSuccess();
        } catch (e) {
          yield LoginFailure(error: '网络错误');
        }
      }
    }
  }
}
