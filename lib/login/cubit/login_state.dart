part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState(this.login);

  final LoginModel login;

  @override
  List<Object> get props => [login];
}

class LoginInitial extends LoginState {
  const LoginInitial(super.login);
}

class LoginFailed extends LoginState {
  const LoginFailed(super.login);
}

class LoginLoading extends LoginState {
  const LoginLoading(super.login);
}

class LoginSuccess extends LoginState {
  const LoginSuccess(super.login);
}