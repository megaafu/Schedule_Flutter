import 'package:hive/hive.dart';
import 'package:schedule/app/iterator/models/todo_day_model.dart';
import 'package:schedule/app/iterator/repositories/todos_day_repository.dart';

const db = "today";

class HiveTodoDayRepository implements TodoDayRepository {
  Future<List<TodoDayModel>> getList() async {
    var box = await Hive.openBox<TodoDayModel>(db);
    final list = box.values.toList();
    if (list.isEmpty) return [];
    return list;
  }

  @override
  Future<bool> delete(int id) async {
    var box = await Hive.openBox<TodoDayModel>(db);
    final list = await getList();
    final index = list.indexWhere((element) => element.id == id);
    if (index == -1) return false;
    await box.deleteAt(index);
    return true;
  }

  @override
  Future<List<TodoDayModel>> getAll() async {
    return await getList();
  }

  @override
  Future<TodoDayModel> insert(TodoDayModel todoDay) async {
    var box = await Hive.openBox<TodoDayModel>(db);
    final list = await getList();
    final id = list.isEmpty ? 1 : list.last.id + 1;
    final newTodoDay = todoDay.copyWith(id: id);
    await box.add(newTodoDay);
    return newTodoDay;
  }

  @override
  Future<TodoDayModel> update(TodoDayModel todoDay) async {
    var box = await Hive.openBox<TodoDayModel>(db);
    final list = await getList();
    final index = list.indexWhere((element) => element.id == todoDay.id);
    if (index == -1) return throw Exception("Not Found");
    await box.putAt(index, todoDay);
    return todoDay;
  }
  Future<void> clear() async{
    var box = await Hive.openBox<TodoDayModel>(db);
    await box.clear();
  }
}
