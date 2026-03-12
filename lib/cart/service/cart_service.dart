part of "../../global/services.dart";

class CartService {
  const CartService(this._apiService);
  final BaseApiService _apiService;

  Future<ApiReturnValue<bool>> submit(CartStateDataModel detail) async {
    final response = await _apiService.post(
      "${ApiConstants.baseUrl}/api/v1/order", 
      detail.toMap(),
      await ApiConstants.headerWithToken(),
    );

    if (response.response == null){
      return ApiReturnValue(response: null, message: response.message, statusCode: response.statusCode);
    }

    return ApiReturnValue(response: true, message: response.message, statusCode: response.statusCode);
  }
}