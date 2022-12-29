import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
part 'gallery_model.g.dart';

@HiveType(typeId: 3)
class GalleryModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  List<Uint8List> images;
  @HiveField(2)
  String eventName;
  @HiveField(3)
  String description;
  @HiveField(4)
  String dateTime;

  GalleryModel(
      {this.id,
      required this.images,
      required this.eventName,
      required this.description,
      required this.dateTime});
}
