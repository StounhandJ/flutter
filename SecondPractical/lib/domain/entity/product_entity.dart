class ProductEntity {
  late int id;
  final String name;
  final int maker_id;
  final int price;
  final int shelf_id;
  final int category_id;

  ProductEntity({
    required this.name,
    required this.maker_id,
    required this.price,
    required this.shelf_id,
    required this.category_id,
  });
}
