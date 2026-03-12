// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../global/models.dart";

class CartStateDataModel extends Equatable {
  final List<CartModel> cart;
  final UserModel userDetail;
  // final 
  const CartStateDataModel({
    required this.cart,
    required this.userDetail
  });

  CartStateDataModel copyWith({
    List<CartModel>? cart,
    UserModel? userDetail
  }) {
    return CartStateDataModel(
      cart: cart ?? this.cart,
      userDetail: userDetail ?? this.userDetail
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart': cart.map((x) => x.toMap()).toList(),
      'user': userDetail.toMap()
    };
  }

  factory CartStateDataModel.init() {
    return CartStateDataModel(
      cart: [],
      userDetail: UserModel.init()
    );
  }

  CartModel productInCart(ProductModel product) =>
    cart.firstWhere((element) => element.product.id == product.id, orElse: () => CartModel.none());
  
  double get total =>
    cart.fold(0, (previousValue, element) => previousValue + element.product.harga * element.count,);

  // String toJson() => json.encode(toMap());

  // factory CartStateDataModel.fromJson(String source) => CartStateDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [cart, userDetail];
}
