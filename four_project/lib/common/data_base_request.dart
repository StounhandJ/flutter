abstract class DataBaseRequest {
  static String deleteTable(String table) => 'drop table $table';

  static const String tableRole = 'Role';
  static const String tableAccount = 'Account';
  static const String tableEmployee = 'Employee';
  static const String tableCategory = 'Category';
  static const String tableProvider = 'Provider';
  static const String tableProduct = 'Product';
  static const String tableCell = 'Cell';
  static const String tableProductInCell = 'ProductInCell';
  static const String tableOrder = 'Order';

  static const List<String> tableList = [
    tableRole,
    tableAccount,
    tableEmployee,
    tableCategory,
    tableProvider,
    tableProduct,
    tableCell,
    tableProductInCell,
    tableOrder
  ];

  static const List<String> createTableList = [
    _createTableRole,
    _createTableAccount,
    _createTableEmployee,
    _createTableCategory,
    _createTableProvider,
    _createTableProduct,
    _createTableCell,
    _createTableProductInCell,
    _createTableOrder
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER, "roleName" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableAccount =
      'CREATE TABLE "$tableAccount" ("id" INTEGER, "login" TEXT NOT NULL UNIQUE, "password" TEXT NOT NULL, "roleId" INTEGER NOT NULL, FOREIGN KEY("roleId") REFERENCES "Role"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableEmployee =
      'CREATE TABLE "$tableEmployee" ("id" INTEGER, "surname" TEXT NOT NULL, "name" TEXT NOT NULL, "patronymic" TEXT NOT NULL, "accountId" INTEGER NOT NULL, FOREIGN KEY("accountId") REFERENCES "Account"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableCategory =
      'CREATE TABLE "$tableCategory" ("id" INTEGER, "categoryName" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableProvider =
      'CREATE TABLE "$tableProvider" ("id" INTEGER, "providerName" TEXT NOT NULL UNIQUE, "phone" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableProduct =
      'CREATE TABLE "$tableProduct" ("id" INTEGER, "productName" TEXT NOT NULL UNIQUE, "description" TEXT NOT NULL, "providerId" INTEGER NOT NULL, "categoryId" INTEGER NOT NULL, "price" INTEGER NOT NULL, "count" INTEGER NOT NULL, FOREIGN KEY("providerId") REFERENCES "Provider"("id"), FOREIGN KEY("categoryId") REFERENCES "Category"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableCell =
      'CREATE TABLE "$tableCell" ("id" INTEGER, "cellName" TEXT NOT NULL UNIQUE, "row" INTEGER NOT NULL, "column" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableProductInCell =
      'CREATE TABLE "$tableProductInCell" ("id" INTEGER, "productId" INTEGER NOT NULL, "cellId" INTEGER NOT NULL, FOREIGN KEY("productId") REFERENCES "Product"("id"), FOREIGN KEY("cellId") REFERENCES "Cell"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableOrder =
      'CREATE TABLE "$tableOrder" ("id" INTEGER, "productId" INTEGER NOT NULL, "employeeId" INTEGER NOT NULL, "date" TEXT NOT NULL, "count" INTEGER NOT NULL, FOREIGN KEY("productId") REFERENCES "Product"("id"), FOREIGN KEY("employeeId") REFERENCES "Employee"("id"), PRIMARY KEY("id" AUTOINCREMENT))';
}
