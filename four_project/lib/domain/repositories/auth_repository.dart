import 'package:dartz/dartz.dart';
import 'package:four_project/domain/entity/roleEntity.dart';

abstract class AuthRepository {
  Future<Either<String, RoleEnum>> signIn(String login, String password);
  Future<Either<String, bool>> signUp(String login, String password);
}
