import 'package:dartz/dartz.dart';
import 'package:four_project/common/data/usercasee/auth_usercase.dart';
import 'package:four_project/domain/entity/roleEntity.dart';

import '../repositories/auth_repository.dart';

class Auth implements AuthUserCase<String, AuthParams> {
  final AuthRepository _authRepository;

  Auth(this._authRepository);

  @override
  Future<Either<String, RoleEnum>> singIn(AuthParams params) {
    return _authRepository.signIn(params.login, params.password);
  }

  @override
  Future<Either<String, bool>> signUp(AuthParams params) {
    return _authRepository.signUp(params.login, params.password);
  }
}

class AuthParams {
  final String login;
  final String password;

  AuthParams({required this.login, required this.password});
}
