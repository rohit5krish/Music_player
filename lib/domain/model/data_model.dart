import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class audioModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String songname;

  @HiveField(2)
  String artist;

  @HiveField(4)
  String songuri;

  audioModel(
      {required this.id,
      required this.songname,
      required this.artist,
      required this.songuri});
}

String boxname = "songs";

class StorageBox {
  static Box<List>? _box;
  static Box<List> getInstance() {
    return _box ??= Hive.box(boxname);
  }
}
