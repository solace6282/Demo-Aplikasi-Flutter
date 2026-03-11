part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState(this.stateData);

  final ProductStateData stateData;

  @override
  List<Object> get props => [stateData];
}

class ProductInitial extends ProductState {
  const ProductInitial(super.stateData);
}
class ProductLoading extends ProductState {
  const ProductLoading(super.stateData);
}
class ProductSuccess extends ProductState {
  const ProductSuccess(super.stateData);
}
class ProductFailed extends ProductState {
  const ProductFailed(super.stateData);
}