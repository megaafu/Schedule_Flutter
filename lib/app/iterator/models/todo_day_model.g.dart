// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDayModelAdapter extends TypeAdapter<TodoDayModel> {
  @override
  final int typeId = 1;

  @override
  TodoDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoDayModel(
      id: fields[0] as int,
      date: fields[1] as DateTime,
      todos: (fields[2] as List).cast<TodoModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, TodoDayModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.todos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
