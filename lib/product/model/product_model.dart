// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../global/models.dart";

enum ProductCategory {
  one,
  two,
  three,
}
class ProductModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final double harga;
  final ProductCategory category;
  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.harga,
    required this.category,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    double? harga,
    ProductCategory? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      harga: harga ?? this.harga,
      category: category ?? this.category,
    );
  }

  factory ProductModel.init() =>
    ProductModel(id: -1, name: '', image: '', description: '', harga: -1, category: ProductCategory.one);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'harga': harga,
      'category': category.name,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
      harga: map['harga'] as double,
      category: ProductCategory.values.where((element) => element.name == map['category'],).firstOrNull ?? ProductCategory.one,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      description,
      harga,
      category,
    ];
  }
}
