part of 'cart_cubit.dart';

enum CartError {
  noItems
}

abstract class CartState extends Equatable {
  const CartState(this.stateData);

  final CartStateDataModel stateData;

  @override
  List<Object> get props => [stateData];
}

class CartInitial extends CartState {
  const CartInitial(super.stateData);
}
class CartLoading extends CartState {
  const CartLoading(super.stateData);
}
class CartSuccess extends CartState {
  const CartSuccess(super.stateData);
}
class CartFailed extends CartState {
  final CartError error;
  const CartFailed(super.stateData, this.error);
}