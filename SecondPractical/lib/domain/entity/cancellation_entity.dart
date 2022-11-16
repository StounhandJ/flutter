class CancellationEntity {
  late int id;
  final DateTime date;
  final int user_id;
  final int product_id;

  CancellationEntity(
      {required this.date, required this.user_id, required this.product_id});
}
