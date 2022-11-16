import 'package:second_practical/domain/entity/user_entity.dart';

class User extends UserEntity {
  User({required super.login, required super.password, required super.role_id});

  Map<String, dynamic> toMap() {
    return {
      'naloginme': login,
      'password': password,
      'role_id': role_id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      password: json['password'],
      role_id: json['role_id'],
    );
  }
}
