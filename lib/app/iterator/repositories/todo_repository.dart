import 'package:schedule/app/iterator/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getAll();

  Future<TodoModel> insert(TodoModel model);

  Future<TodoModel> update(TodoModel model);

  Future<TodoModel?> getTodo(int id);

  Future<bool> delete(int id);

  Future<void> clear();
}
