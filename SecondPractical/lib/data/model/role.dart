import 'package:second_practical/domain/entity/role_entity.dart';

class Role extends RoleEntity {
  Role({required super.role});

  Map<String, dynamic> toMap() {
    return {'role': role};
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}
