import 'package:second_practical/domain/entity/entrance_entity.dart';

class Entrance extends EntranceEntity {
  Entrance(
      {required super.date, required super.user_id, required super.product_id});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'user_id': user_id,
      'product_id': product_id,
    };
  }

  factory Entrance.toFromMap(Map<String, dynamic> json) {
    return Entrance(
      date: json['date'],
      user_id: json['user_id'],
      product_id: json['product_id'],
    );
  }
}
