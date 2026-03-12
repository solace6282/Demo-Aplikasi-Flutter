import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:litest/global/models.dart';
import 'package:litest/global/services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._service) : super(ProductInitial(ProductStateData.init()));

  final ProductService _service;

  Future<void> getProducts() async {
    emit(ProductLoading(state.stateData));
    final response = await _service.getProducts();

    if (response.response == null){
      emit(ProductFailed(state.stateData));
      return;
    }

    emit(ProductSuccess(state.stateData.copyWith(
      products: response.response,
      shown: response.response
    )));
  }

  void filter([ProductCategory? pc]){
    emit(ProductInitial(state.stateData.copyWith(
      filter: CopyWithModel(value: pc),
      shown: pc == null ? state.stateData.products : state.stateData.products.where((element) => element.category == pc,).toList()
    )));
  }
}