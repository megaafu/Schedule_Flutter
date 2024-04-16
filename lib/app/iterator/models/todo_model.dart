import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;


  TodoModel({
    required this.id,
    required this.title,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    bool? check,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,

    );
  }
}
