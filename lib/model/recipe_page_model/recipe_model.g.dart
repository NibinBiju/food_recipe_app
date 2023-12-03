// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreateRecipeModelAdapter extends TypeAdapter<CreateRecipeModel> {
  @override
  final int typeId = 1;

  @override
  CreateRecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreateRecipeModel(
      recipeName: fields[0] as String?,
      date: fields[1] as DateTime?,
      timeInMinutes: fields[2] as int?,
      imgIndex: fields[3] as int?,
      imgUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreateRecipeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.recipeName)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.timeInMinutes)
      ..writeByte(3)
      ..write(obj.imgIndex)
      ..writeByte(4)
      ..write(obj.imgUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateRecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
