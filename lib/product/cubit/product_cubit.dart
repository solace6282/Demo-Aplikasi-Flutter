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
      products: response.response
    )));
  }
}