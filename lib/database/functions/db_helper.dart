import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pankaj_charitable_trust/database/models/gallery_model.dart';
import 'package:pankaj_charitable_trust/database/models/student_model.dart';
import 'package:pankaj_charitable_trust/database/models/trusties_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

ValueNotifier<List<TrsutiesModel>> trustiesListNotifier = ValueNotifier([]);

ValueNotifier<List<GalleryModel>> galleryListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  final dataId = await studentDB.add(value);
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
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  await studentDB.deleteAt(id);
  studentListNotifier.value.clear();
  studentListNotifier.notifyListeners();

  getAllStudents();
}

Future<void> updateStudent(StudentModel value, int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  await studentDB.putAt(id, value);

  getAllStudents();
}

Future<void> addTrusties(TrsutiesModel value) async {
  final trustieDB = await Hive.openBox<TrsutiesModel>('trusties_db');

  final trusteeId = await trustieDB.add(value);

  value.id = trusteeId;
  trustieDB.put(trusteeId, value);
  trustiesListNotifier.value.add(value);
  trustiesListNotifier.notifyListeners();
}

Future<void> getAllTrusties() async {
  final trustiesDB = await Hive.openBox<TrsutiesModel>('trusties_db');

  trustiesListNotifier.value.clear();

  trustiesListNotifier.value.addAll(trustiesDB.values);
  trustiesListNotifier.notifyListeners();
}

Future<void> getTrustee(int id) async {
  final trustiesDb = await Hive.openBox<TrsutiesModel>('trusties_db');

  trustiesDb.get(id);
}

Future<void> deleteTrustee(int id) async {
  final trustiesDb = await Hive.openBox<TrsutiesModel>('trusties_db');

  await trustiesDb.deleteAt(id);

  getAllTrusties();
}

Future<void> updateTrustee(TrsutiesModel value, int id) async {
  final trustiesDb = await Hive.openBox<TrsutiesModel>('trusties_db');

  await trustiesDb.putAt(id, value);

  getAllTrusties();
}

Future<void> saveImage(GalleryModel value) async {
  final galleryDb = await Hive.openBox<GalleryModel>('gallery_db');

  final dataId = await galleryDb.add(value);
  value.id = dataId;

  galleryDb.put(dataId, value);

  galleryListNotifier.value.add(value);
  print(value.images.toString());

  galleryListNotifier.notifyListeners();
}
