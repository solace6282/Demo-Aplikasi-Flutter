// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? address
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'address': address
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address']
    );
  }

  factory UserModel.init() {
    return UserModel(
      id: -1,
      name: '',
      email: '',
      address: ''
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, email, address];
}
