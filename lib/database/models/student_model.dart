import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
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
  @HiveField(5)
  String school;
  @HiveField(6)
  String college;
  @HiveField(7)
  String course;
  @HiveField(8)
  String year;

  StudentModel(
      {this.id,
      required this.name,
      required this.email,
      required this.number,
      required this.address,
      required this.school,
      required this.college,
      required this.course,
      required this.year});
}
