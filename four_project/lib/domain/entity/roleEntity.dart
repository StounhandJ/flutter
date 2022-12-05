class RoleEntity {
  late int id;
  final String roleName;

  RoleEntity({required this.roleName});
}

enum RoleEnum {
  admin(
    id: 1,
    role: 'Администратор',
  ),
  user(
    id: 2,
    role: 'Клиент',
  ),
  nobody(
    id: 0,
    role: 'Нет',
  );

  const RoleEnum({
    required this.id,
    required this.role,
  });

  final int id;
  final String role;
}
