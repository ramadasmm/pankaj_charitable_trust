import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;

  @HiveField(2)
  String school;
  @HiveField(3)
  String schooId;
  @HiveField(4)
  String college;
  @HiveField(5)
  String collegeId;
  @HiveField(6)
  String course;
  @HiveField(7)
  String courseId;
  @HiveField(8)
  String startYear;
  @HiveField(9)
  String duration;
  @HiveField(10)
  String? remarks;
  @HiveField(11)
  String active;

  StudentModel(
      {this.id,
      required this.name,
      required this.active,
      required this.collegeId,
      required this.courseId,
      required this.duration,
      this.remarks,
      required this.schooId,
      required this.school,
      required this.college,
      required this.course,
      required this.startYear});
}
