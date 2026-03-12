import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:litest/core/util/shared_preferences.dart';
import 'package:litest/global/models.dart';
import 'package:litest/global/services.dart';

part 'check_token_state.dart';

class CheckTokenCubit extends Cubit<CheckTokenState> {
  CheckTokenCubit(this._service) : super(CheckTokenInitial());

  final LoginService _service;

  Future<void> checkToken() async {
    final response = await _service.getUser();

    if (response.response == null){
      emit(CheckTokenNotExist());
      return;
    }
    emit((await SharedPreferencesUtil.getString("token")).isEmpty ? CheckTokenNotExist() : CheckTokenExists(user: response.response!));
  }
}