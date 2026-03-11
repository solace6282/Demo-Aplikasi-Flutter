part of "../../global/services.dart";

class ProductService {
  const ProductService(this._apiService);
  final BaseApiService _apiService;

  Future<ApiReturnValue<List<ProductModel>>> getProducts() async {
    final response = await _apiService.get("${ApiConstants.baseUrl}/api/v1/products", await ApiConstants.headerWithToken());

    if (response.response == null){
      return ApiReturnValue(response: null, message: response.message, statusCode: response.statusCode);
    }

    return ApiReturnValue(response: (response.response as Iterable).map((e) => ProductModel.fromMap(e),).toList(), message: response.message, statusCode: response.statusCode);
  }

}