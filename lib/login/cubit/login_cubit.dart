import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:litest/core/util/shared_preferences.dart';
import 'package:litest/global/models.dart';
import 'package:litest/global/services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._apiService) : super(LoginInitial(LoginModel.init()));

  final LoginService _apiService;

  void update({String? email, String? password}){
    emit(LoginInitial(state.login.copyWith(
      email: email,
      password: password
    )));
  }

  Future<void> login() async {
    emit(LoginLoading(state.login));

    final res = await _apiService.login(state.login);

    if (res.response == null){
      emit(LoginFailed(state.login));
      return;
    }

    emit(LoginSuccess(state.login));
  }
}