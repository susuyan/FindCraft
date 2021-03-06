import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:find_craft/repositories/user_repository.dart';

import './bloc.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final repository = UserRepository();

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
        } on DioError catch (e) {
          yield SignFailure('${e.response.data['msg']}');
        }
      }
    }

    if (event is SignOwnerInfo) {
      yield SignLoading();
      try {
        await repository.requestSignOwner(event);
        yield SignedOwnerInfo();
      } on DioError catch (e) {
        yield SignFailure('${e.response.data['msg']}');
      }
    }

    if (event is SignCraftInfo) {
      yield SignLoading();
      try {
        await repository.requestSignCraft(event);
        yield SignedCraftInfo();
      } on DioError catch (e) {
        yield SignFailure('${e.response.data['msg']}');
      }
    }
  }
}
