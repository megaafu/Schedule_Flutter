
import 'package:schedule/app/iterator/models/todo_day_model.dart';

abstract class TodoDayRepository {
  Future<List<TodoDayModel>> getAll();

  Future<TodoDayModel> insert(TodoDayModel todoDay);

  Future<TodoDayModel> update(TodoDayModel todoDay);

  Future<bool> delete(int id);
}