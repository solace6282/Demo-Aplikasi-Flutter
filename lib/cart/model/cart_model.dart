// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../global/models.dart";

class CartModel extends Equatable {
  final ProductModel product;
  final int count;
  const CartModel({
    required this.product,
    required this.count,
  });

  CartModel copyWith({
    ProductModel? product,
    int? count,
  }) {
    return CartModel(
      product: product ?? this.product,
      count: count ?? this.count,
    );
  }

  factory CartModel.none() =>
    CartModel(product: ProductModel.init(), count: 0);

  double get total =>
    product.harga * count;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'count': count,
    };
  }

  // factory CartModel.fromMap(Map<String, dynamic> map) {
  //   return CartModel(
  //     product: ProductModel.fromMap(map['product'] as Map<String,dynamic>),
  //     count: map['count'] as int,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [product, count];
}
