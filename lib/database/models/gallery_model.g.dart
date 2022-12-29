// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GalleryModelAdapter extends TypeAdapter<GalleryModel> {
  @override
  final int typeId = 3;

  @override
  GalleryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GalleryModel(
      id: fields[0] as int?,
      images: (fields[1] as List).cast<Uint8List>(),
      eventName: fields[2] as String,
      description: fields[3] as String,
      dateTime: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GalleryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.eventName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
