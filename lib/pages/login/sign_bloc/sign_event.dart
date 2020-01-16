import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignEvent extends Equatable {
  const SignEvent();

  List<Object> get props => [];
}

class SignButtonPressed extends SignEvent {
  final String username;
  final String password;
  final String repeatPassword;

  SignButtonPressed(
      {@required this.username,
      @required this.password,
      @required this.repeatPassword})
      : assert(username != null),
        assert(password != null),
        assert(repeatPassword != null);
}

class SignOwnerInfo extends SignEvent {
  final String username;
  final String wechat;
  final String city;

  SignOwnerInfo(
      {@required this.username, @required this.wechat, @required this.city});
}

class SignCraftInfo extends SignEvent {
  final String username;
  final String wechat;
  final String city;
  SignCraftInfo(
      {@required this.username, @required this.wechat, @required this.city});
}
