// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 1;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      active: fields[11] as String,
      collegeId: fields[5] as String,
      courseId: fields[7] as String,
      duration: fields[9] as String,
      remarks: fields[10] as String?,
      schooId: fields[3] as String,
      school: fields[2] as String,
      college: fields[4] as String,
      course: fields[6] as String,
      startYear: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.school)
      ..writeByte(3)
      ..write(obj.schooId)
      ..writeByte(4)
      ..write(obj.college)
      ..writeByte(5)
      ..write(obj.collegeId)
      ..writeByte(6)
      ..write(obj.course)
      ..writeByte(7)
      ..write(obj.courseId)
      ..writeByte(8)
      ..write(obj.startYear)
      ..writeByte(9)
      ..write(obj.duration)
      ..writeByte(10)
      ..write(obj.remarks)
      ..writeByte(11)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
