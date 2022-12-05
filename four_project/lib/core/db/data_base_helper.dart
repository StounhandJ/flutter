import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:four_project/common/data/model/account.dart';
import 'package:four_project/common/data/model/role.dart';
import 'package:four_project/domain/entity/roleEntity.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../common/data_base_request.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'storage.db');

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(
        _pathDB,
        options: OpenDatabaseOptions(
          version: _version,
          onCreate: (db, version) async {
            await onCreateTable(db);
          },
          onUpgrade: (db, oldVersion, newVersion) async {
            await onUpdateTable(db);
          },
        ),
      );
    } else {
      dataBase = await openDatabase(_pathDB, version: _version,
          onCreate: (dataBase, version) async {
        await onCreateTable(dataBase);
      }, onUpgrade: (dataBase, oldVersion, newVersion) async {
        await onUpdateTable(dataBase);
      });
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    await onInitTable(db);
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('Select name From sqlite_master;');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(
          DataBaseRequest.tableRole,
          Role(
            roleName: RoleEnum.admin.name,
          ).toMap());
      db.insert(
          DataBaseRequest.tableRole,
          Role(
            roleName: RoleEnum.user.name,
          ).toMap());

      db.insert(
          DataBaseRequest.tableAccount,
          Account(
            login: 'loginAdmin',
            password: md5.convert(utf8.encode('password')).toString(),
            roleId: RoleEnum.admin.id,
          ).toMap());
    } on DatabaseException catch (e) {}
  }
}
