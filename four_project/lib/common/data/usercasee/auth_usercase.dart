import 'package:dartz/dartz.dart';
import 'package:four_project/domain/entity/roleEntity.dart';

abstract class AuthUserCase<String, Params> {
  Future<Either<String, RoleEnum>> singIn(Params params);
  Future<Either<String, bool>> signUp(Params params);
}
