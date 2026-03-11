// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../../global/models.dart";

class LoginModel extends Equatable {
  final String email;
  final String password;
  const LoginModel({
    required this.email,
    required this.password,
  });

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  factory LoginModel.init() {
    return LoginModel(
      email: '',
      password: ''
    );
  }

  // String toJson() => json.encode(toMap());

  // factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password];
}
