import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_craft/pages/authentication/bloc.dart';
import 'package:find_craft/repositories/user_repository.dart';

import './bloc.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final repository = UserRepository();

  final AuthenticationBloc authenticationBloc;

  SignBloc({this.authenticationBloc});

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
        try {
          await repository.requestSign(event);
          yield SignedAccount();
        } catch (e) {
          yield SignFailure('网络错误');
        }
      }
    }

    if (event is SignOwnerInfo) {
      yield SignLoading();
      try {
        await repository.requestSignOwner(event);
        authenticationBloc.add(AppStarted());
        yield SignedOwnerInfo();
      } catch (e) {
        yield SignFailure('网络错误');
      }
    }

    if (event is SignCraftInfo) {
      yield SignLoading();
      try {
        await repository.requestSignCraft(event);
        yield SignedCraftInfo();
        
      } catch (e) {
        yield SignFailure('网络错误');
      }
    }
  }
}
