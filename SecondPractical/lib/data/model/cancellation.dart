import 'package:second_practical/domain/entity/cancellation_entity.dart';

class Cancellation extends CancellationEntity {
  Cancellation(
      {required super.date, required super.user_id, required super.product_id});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'user_id': user_id,
      'product_id': product_id,
    };
  }

  factory Cancellation.toFromMap(Map<String, dynamic> json) {
    return Cancellation(
      date: json['date'],
      user_id: json['user_id'],
      product_id: json['product_id'],
    );
  }
}
