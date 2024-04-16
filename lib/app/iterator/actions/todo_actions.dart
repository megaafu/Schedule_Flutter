import 'package:schedule/app/injector.dart';
import 'package:schedule/app/iterator/atoms/todo_atoms.dart';
import 'package:schedule/app/iterator/models/todo_model.dart';
import 'package:schedule/app/iterator/repositories/todo_repository.dart';

Future<void> fetchTodos() async {
  final repository = injector.get<TodoRepository>();
  todoState.value = await repository.getAll();
}

Future<void> putTodo(TodoModel model) async {
  final repository = injector.get<TodoRepository>();
  if (model.id == -1) {
    await repository.insert(model);
  } else {
    await repository.update(model);
  }
  fetchTodos();
}

Future<void> deleteTodo(int id) async {
  final repository = injector.get<TodoRepository>();
  await repository.delete(id);
  fetchTodos();
}

Future<void> getTodo(int id) async {
  final repository = injector.get<TodoRepository>();
  if(id!=-1){
    todoLoad.value = {id: repository.getTodo(id)};
  }
}

Future<void> clearTodo() async {
  final repository = injector.get<TodoRepository>();
  await repository.clear();
  fetchTodos();
}
