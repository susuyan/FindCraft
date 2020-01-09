import 'package:equatable/equatable.dart';

abstract class SignState extends Equatable {
  const SignState();

  @override
  List<Object> get props => [];
}

class InitialSignState extends SignState {}

class SignLoading extends SignState {}

class SignSuccess extends SignState {}

class SignFailure extends SignState {
  final String error;

  SignFailure(this.error);
}