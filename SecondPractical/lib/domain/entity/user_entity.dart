class UserEntity {
  late int id;
  final String login;
  final String password;
  final int role_id;

  UserEntity({
    required this.login,
    required this.password,
    required this.role_id,
  });
}
