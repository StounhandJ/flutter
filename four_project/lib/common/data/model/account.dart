import 'package:four_project/domain/entity/accountEntity.dart';
import 'package:four_project/domain/entity/roleEntity.dart';

class Account extends AccountEntity {
  late int id;
  final String login;
  final String password;
  final int roleId;

  Account({
    required this.login,
    required this.password,
    required this.roleId,
  }) : super(
          login: login,
          password: password,
          roleId: roleId,
        );

  Map<String, dynamic> toMap() {
    return {'login': login, 'password': password, 'roleId': roleId};
  }

  factory Account.toFromMap(Map<String, dynamic> json) {
    return Account(
      login: json['login'],
      password: json['password'],
      roleId: json['roleId'],
    );
  }
}
