import 'package:second_practical/domain/entity/shelf_entity.dart';

class Shelf extends ShelfEntity {
  Shelf({required super.name, required super.warehouse_id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'warehouse_id': warehouse_id,
    };
  }

  factory Shelf.toFromMap(Map<String, dynamic> json) {
    return Shelf(
      name: json['name'],
      warehouse_id: json['warehouse_id'],
    );
  }
}
