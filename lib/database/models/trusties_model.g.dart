// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trusties_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrsutiesModelAdapter extends TypeAdapter<TrsutiesModel> {
  @override
  final int typeId = 2;

  @override
  TrsutiesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrsutiesModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      email: fields[2] as String,
      number: fields[3] as String,
      address: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrsutiesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrsutiesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
