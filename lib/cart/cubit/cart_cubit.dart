import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:litest/global/models.dart';
import 'package:litest/global/services.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._service) : super(CartInitial(CartStateDataModel.init()));

  final CartService _service;

  void reset(){
    emit(CartInitial(CartStateDataModel.init().copyWith(
      userDetail: state.stateData.userDetail
    )));
  }

  void updateUser(UserModel user){
    emit(CartInitial(state.stateData.copyWith(
      userDetail: user
    )));
  }

  void addItemToCart(ProductModel product){
    final curr = [...state.stateData.cart];
    final exist = curr.indexWhere((element) => element.product.id == product.id,);

    if (exist != -1){
      emit(CartInitial(state.stateData.copyWith(
        cart: curr..[exist] = curr[exist].copyWith(count: curr[exist].count + 1)
      )));
      return;
    }
    
    emit(CartInitial(state.stateData.copyWith(
      cart: [...curr, CartModel(count: 1, product: product)]
    )));
  }

  void deleteItemFromCart(ProductModel product){
    final curr = [...state.stateData.cart];
    final idx = curr.indexWhere((element) => element.product.id == product.id,);

    if (curr[idx].count == 1){
      emit(CartInitial(state.stateData.copyWith(
        cart: curr..removeAt(idx)
      )));
      return;
    }

    emit(CartInitial(state.stateData.copyWith(
      cart: curr..[idx] = curr[idx].copyWith(count: curr[idx].count - 1)
    )));
  }

  void submit(){
    if (state.stateData.cart.isEmpty){
      emit(CartFailed(state.stateData, CartError.noItems));
      return;
    }

    emit(CartSuccess(state.stateData));
  }
}