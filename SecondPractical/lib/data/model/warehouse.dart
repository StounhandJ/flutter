import 'package:second_practical/domain/entity/warehouse_entity.dart';

class Warehouse extends WarehouseEntity {
  Warehouse({required super.name, required super.address});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
    };
  }

  factory Warehouse.toFromMap(Map<String, dynamic> json) {
    return Warehouse(name: json['name'], address: json['address']);
  }
}
