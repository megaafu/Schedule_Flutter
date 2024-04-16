import 'package:schedule/app/iterator/models/todo_model.dart';

class TodoAdapter {
  static Map<String, dynamic> toMap(TodoModel todo) {
    return {
      'id': todo.id,
      'title': todo.title,
    };
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
    );
  }
}
