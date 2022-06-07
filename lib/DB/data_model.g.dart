// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class audioModelAdapter extends TypeAdapter<audioModel> {
  @override
  final int typeId = 0;

  @override
  audioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return audioModel(
      id: fields[0] as int,
      songname: fields[1] as String,
      artist: fields[2] as String,
      songuri: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, audioModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.songname)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(4)
      ..write(obj.songuri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is audioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
