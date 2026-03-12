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
  final String message;
  const LoginFailed(super.login, this.message);

  @override
  List<Object> get props => [...super.props, message];
}

class LoginLoading extends LoginState {
  const LoginLoading(super.login);
}

class LoginSuccess extends LoginState {
  final UserModel user;
  const LoginSuccess(super.login, this.user);
}