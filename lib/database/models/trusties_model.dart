import 'package:hive_flutter/adapters.dart';
part 'trusties_model.g.dart';

@HiveType(typeId: 2)
class TrsutiesModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String number;
  @HiveField(4)
  String address;
  TrsutiesModel({
    this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.address,
  });
}
