part of 'check_token_cubit.dart';

abstract class CheckTokenState extends Equatable {
  const CheckTokenState();

  @override
  List<Object> get props => [];
}

class CheckTokenExists extends CheckTokenState {
  final UserModel user;

  const CheckTokenExists({required this.user});
}

class CheckTokenInitial extends CheckTokenState {}

class CheckTokenNotExist extends CheckTokenState {}

// class CheckTokenLoading extends CheckTokenState {}

// class CheckTokenSuccess extends CheckTokenState {}

// class CheckTokenFailed extends CheckTokenState {}