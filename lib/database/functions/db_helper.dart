import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pankaj_charitable_trust/database/models/student_model.dart';
import 'package:pankaj_charitable_trust/database/models/trusties_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

ValueNotifier<List<TrsutiesModel>> trustiesListNotifier = ValueNotifier([]);

int? dataId;

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  dataId = await studentDB.add(value);
  value.id = dataId;

  studentDB.put(dataId, value);

  studentListNotifier.value.add(value);

  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> getStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentDB.get(id);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  await studentDB.delete(id);

  getAllStudents();
}

Future<void> addTrusties(TrsutiesModel value) async {
  final trustieDB = await Hive.openBox<TrsutiesModel>('trusties_db');

  await trustieDB.add(value);
  trustiesListNotifier.value.add(value);
  trustiesListNotifier.notifyListeners();
}

Future<void> getAllTrusties() async {
  final trustiesDB = await Hive.openBox<TrsutiesModel>('trusties_db');

  trustiesListNotifier.value.clear();

  trustiesListNotifier.value.addAll(trustiesDB.values);
  trustiesListNotifier.notifyListeners();
}
