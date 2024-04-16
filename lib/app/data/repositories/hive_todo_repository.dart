import 'package:hive/hive.dart';
import 'package:schedule/app/iterator/models/todo_model.dart';
import 'package:schedule/app/iterator/repositories/todo_repository.dart';

const db = "todo";

class HiveTodoRepository implements TodoRepository {
  Future<List<TodoModel>> getList() async {
    var box = await Hive.openBox<TodoModel>(db);
    final list = box.values.toList();
    if (list.isEmpty) return [];
    return list;
  }

  @override
  Future<bool> delete(int id) async {
    var box = await Hive.openBox<TodoModel>(db);
    final list = await getList();
    final index = list.indexWhere((element) => element.id == id);
    if (index == -1) return false;
    await box.deleteAt(index);
    return true;
  }

  @override
  Future<List<TodoModel>> getAll() async {
    final list = await getList();
    return list;
  }

  @override
  Future<void> clear() async {
    var box = await Hive.openBox<TodoModel>(db);
    await box.clear();
  }

  @override
  Future<TodoModel> insert(TodoModel model) async {
    var box = await Hive.openBox<TodoModel>(db);
    final list = await getList();
    final id = list.isEmpty ? 1 : list.last.id + 1;
    final newModel = model.copyWith(id: id);
    await box.add(newModel);
    return newModel;
  }
  @override
  Future<TodoModel?> getTodo(int id) async {
    var box = await Hive.openBox<TodoModel>(db);
    final list = await getList();
    final index = list.indexWhere((e) => e.id == id);
    if (index == -1) throw Exception('Todo Not Found');
    final model =  box.getAt(index);
    return model;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    var box = await Hive.openBox<TodoModel>(db);
    final list = await getList();
    final index = list.indexWhere((e) => e.id == model.id);
    if (index == -1) throw Exception('Todo Not Found');
    await box.putAt(index, model);
    return model;
  }
}
