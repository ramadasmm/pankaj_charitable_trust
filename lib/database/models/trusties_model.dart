import 'package:hive_flutter/adapters.dart';
part 'trusties_model.g.dart';

@HiveType(typeId: 2)
class TrsutiesModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String number;
  @HiveField(3)
  String address;
  TrsutiesModel({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
  });
}
