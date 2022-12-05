import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:four_project/common/data/model/account.dart';
import 'package:four_project/common/data_base_request.dart';
import 'package:four_project/core/db/data_base_helper.dart';
import 'package:four_project/domain/entity/roleEntity.dart';
import 'package:four_project/domain/repositories/auth_repository.dart';

import 'package:sqflite/sqflite.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final _db = DataBaseHelper.instance.dataBase;

  String table = DataBaseRequest.tableAccount;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      var account = await _db.query(
        table,
        where: 'login = ?',
        whereArgs: [login],
      );
      if (account.isEmpty) {
        return const Left('Такого пользователя нет');
      }
      if (account.first['password'] !=
          md5.convert(utf8.encode(password)).toString()) {
        return const Left('Пароль пользователя неверный');
      }
      return Right(RoleEnum.values[(account.first['roleId'] as int) - 1]);
    } on DatabaseException catch (error) {
      return Left(error.result.toString());
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) async {
    try {
      var account = await _db.query(
        table,
        where: 'login = ?',
        whereArgs: [login],
      );
      if (account.isNotEmpty) {
        return const Left('Логин уже занят');
      }
      _db.insert(
          table,
          Account(
                  login: login,
                  password: md5.convert(utf8.encode(password)).toString(),
                  roleId: RoleEnum.user.id)
              .toMap());
      return const Right(true);
    } on DatabaseException catch (error) {
      return const Left("Ошибка");
    }
  }
}
