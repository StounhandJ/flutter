import 'package:second_practical/domain/entity/product_entity.dart';

class Product extends ProductEntity {
  Product(
      {required super.name,
      required super.maker_id,
      required super.price,
      required super.shelf_id,
      required super.category_id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'maker_id': maker_id,
      'price': price,
      'shelf_id': shelf_id,
      'category_id': category_id,
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      maker_id: json['maker_id'],
      price: json['price'],
      shelf_id: json['shelf_id'],
      category_id: json['category_id'],
    );
  }
}
