part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}

class ForgotPwdFailure extends LoginState {
  final String message;
  ForgotPwdFailure({required this.message});
}

class ForgotPwdSuccess extends LoginState {}

class ResetPwdFailure extends LoginState {
  final String message;
  ResetPwdFailure({required this.message});
}

class ResetPwdSuccess extends LoginState {}
