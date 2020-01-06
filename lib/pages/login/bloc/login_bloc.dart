import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/pages/authentication/authentication_bloc.dart';
import 'package:find_craft/pages/authentication/authentication_event.dart';
import 'package:find_craft/repositories/user_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.authenticationBloc})
      : assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      if (event.username.isEmpty || event.password.isEmpty) {
        yield LoginFailure(error: '手机号和密码不能为空');
      } else {
        if (await UserRepository.requestLogin(event) == 1) {          
          yield LoginSuccess();
          authenticationBloc.add(LoggedIn());
        } else {
          yield LoginFailure(error: '网络错误');
        }
      }
    }
  }
}
