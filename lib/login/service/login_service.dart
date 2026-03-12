part of "../../global/services.dart";

class LoginService {
  const LoginService(this._apiService);
  final BaseApiService _apiService;

  Future<ApiReturnValue<UserModel>> login(LoginModel login) async {
    final response = await _apiService.post(
      "${ApiConstants.baseUrl}/api/v1/login", 
      {
        "user": login.email,
        "password": login.password
      }, 
      await ApiConstants.headerWithToken()
    );

    if (response.response == null){
      return ApiReturnValue(response: null, message: response.message, statusCode: response.statusCode);
    }

    await SharedPreferencesUtil.setString('token', response.response!['token']);

    return ApiReturnValue(response: UserModel.fromMap(response.response!['user']), message: response.message, statusCode: response.statusCode);
  }

  Future<ApiReturnValue<UserModel>> getUser() async {
    final response = await _apiService.get(
      "${ApiConstants.baseUrl}/api/v1/user", 
      await ApiConstants.headerWithToken()
    );

    if (response.response == null){
      return ApiReturnValue(response: null, message: response.message, statusCode: response.statusCode);
    }

    return ApiReturnValue(response: UserModel.fromMap(response.response!), message: response.message, statusCode: response.statusCode);
  }
}