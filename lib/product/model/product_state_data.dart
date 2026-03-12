// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../global/models.dart";

class ProductStateData extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> shown;
  final ProductCategory? filter;
  const ProductStateData({
    required this.products,
    required this.shown,
    required this.filter
  });

  ProductStateData copyWith({
    List<ProductModel>? products,
    List<ProductModel>? shown,
    CopyWithModel<ProductCategory>? filter
  }) {
    return ProductStateData(
      products: products ?? this.products,
      shown: shown ?? this.shown,
      filter: filter == null ? this.filter : filter.value
    );
  }

  factory ProductStateData.init() =>
    ProductStateData(
      products: [],
      shown: [],
      filter: null
    );

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'products': products.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory ProductStateData.fromMap(Map<String, dynamic> map) {
  //   return ProductStateData(
  //     products: List<ProductModel>.from((map['products'] as List<int>).map<ProductModel>((x) => ProductModel.fromMap(x as Map<String,dynamic>),),),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ProductStateData.fromJson(String source) => ProductStateData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [products, shown];
}
