import 'package:four_project/domain/entity/roleEntity.dart';

class Role extends RoleEntity {
  late int id;
  final String roleName;

  Role({required this.roleName}) : super(roleName: roleName);

  Map<String, dynamic> toMap() {
    return {
      'roleName': roleName,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(roleName: json['roleName']);
  }
}
