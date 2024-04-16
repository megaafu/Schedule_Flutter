import 'package:hive/hive.dart';
import 'package:schedule/app/iterator/models/todo_model.dart';
part 'todo_day_model.g.dart';

@HiveType(typeId: 1)
class TodoDayModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final List<TodoModel> todos;

  TodoDayModel({required this.id, required this.date, required this.todos});

  TodoDayModel copyWith({
    int? id,
    DateTime? date,
    List<TodoModel>? todos,
  }) {
    return TodoDayModel(
      id: id ?? this.id,
      date: date ?? this.date,
      todos: todos ?? this.todos,
    );
  }
}
