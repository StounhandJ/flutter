import 'package:second_practical/domain/entity/category_entity.dart';

class Category extends CategoryEntity {
  Category({required super.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Category.toFromMap(Map<String, dynamic> json) {
    return Category(name: json['name']);
  }
}
