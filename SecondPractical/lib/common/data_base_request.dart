abstract class DataBaseRequest {
  /// Запрос для удаления таблиц
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableCategory = 'category';
  static const String tableMaker = 'maker';
  static const String tableRole = 'Role';
  static const String tableWarehouse = 'warehouse';
  static const String tableShelf = 'shelf';
  static const String tableUser = 'user';
  static const String tableProduct = 'product';
  static const String tableCancellation = 'cancellation';
  static const String tableEntrance = 'entrance';

  static const List<String> tableList = [
    tableCategory,
    tableMaker,
    tableRole,
    tableWarehouse,
    tableShelf,
    tableUser,
    tableProduct,
    tableCancellation,
    tableEntrance,
  ];

  static const List<String> createTableList = [
    _createTableCategory,
    _createTableMaker,
    _createTableRole,
    _createTableWarehouse,
    _createTableShelf,
    _createTableUser,
    _createTableProduct,
    _createTableCancellation,
    _createTableEntrance,
  ];

  /// Запрос для создания таблицы category
  static const String _createTableCategory =
      'CREATE TABLE "$tableCategory"  (id integer NOT NULL, name varchar(255) NOT NULL, PRIMARY KEY (id));';

  /// Запрос для создания таблицы maker
  static const String _createTableMaker =
      'CREATE TABLE "$tableMaker"  (id integer NOT NULL, name varchar(255) NOT NULL, PRIMARY KEY (id));';

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы warehouse
  static const String _createTableWarehouse =
      'CREATE TABLE "$tableWarehouse"  ( id integer NOT NULL, name varchar(255) NOT NULL, address varchar(255) NOT NULL, PRIMARY KEY (id));';

  /// Запрос для создания таблицы shelf
  static const String _createTableShelf =
      'CREATE TABLE "$tableShelf"  ( id integer NOT NULL, name varchar(255) NOT NULL, warehouse_id integer NOT NULL, PRIMARY KEY (id), CONSTRAINT shelf_warehouse_id_warehouse_id_foreign FOREIGN KEY (warehouse_id) REFERENCES "$tableWarehouse" (id));';

  /// Запрос для создания таблицы user
  static const String _createTableUser =
      'CREATE TABLE "$tableUser"  ( id integer NOT NULL, login varchar(255) NOT NULL, password varchar(255) NOT NULL, role_id integer NOT NULL, PRIMARY KEY (id), CONSTRAINT user_role_id_role_id_foreign FOREIGN KEY (role_id) REFERENCES "$tableRole" (id));';

  /// Запрос для создания таблицы product
  static const String _createTableProduct =
      'CREATE TABLE "$tableProduct"  ( id integer NOT NULL, name varchar(255) NOT NULL, maker_id integer NOT NULL, price integer NOT NULL, shelf_id integer NOT NULL, category_id integer NOT NULL, PRIMARY KEY (id), CONSTRAINT product_shelf_id_shelf_id_foreign FOREIGN KEY (shelf_id) REFERENCES "$tableShelf" (id), CONSTRAINT product_category_id_category_id_foreign FOREIGN KEY (category_id) REFERENCES "$tableCategory" (id), CONSTRAINT product_maker_id_maker_id_foreign FOREIGN KEY (maker_id) REFERENCES "$tableMaker" (id));';

  /// Запрос для создания таблицы cancellation
  static const String _createTableCancellation =
      'CREATE TABLE "$tableCancellation"  ( id integer NOT NULL, date date NOT NULL, user_id integer NOT NULL, product_id integer NOT NULL, PRIMARY KEY (id), CONSTRAINT cancellation_product_id_product_id_foreign FOREIGN KEY (product_id) REFERENCES "$tableProduct" (id), CONSTRAINT cancellation_user_id_user_id_foreign FOREIGN KEY (user_id) REFERENCES "$tableUser" (id));';

  /// Запрос для создания таблицы entrance
  static const String _createTableEntrance =
      'CREATE TABLE "$tableEntrance"  ( id integer NOT NULL, date date NOT NULL, user_id integer NOT NULL, product_id integer NOT NULL, PRIMARY KEY (id), CONSTRAINT entrance_product_id_product_id_foreign FOREIGN KEY (product_id) REFERENCES "$tableProduct" (id), CONSTRAINT entrance_user_id_user_id_foreign FOREIGN KEY (user_id) REFERENCES "$tableUser" (id));';
}
