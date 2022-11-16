import 'package:second_practical/domain/entity/maker_entity.dart';

class Maker extends MakerEntity {
  Maker({required super.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Maker.toFromMap(Map<String, dynamic> json) {
    return Maker(name: json['name']);
  }
}
