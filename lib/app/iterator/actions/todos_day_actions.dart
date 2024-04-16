

import 'package:schedule/app/injector.dart';
import 'package:schedule/app/iterator/atoms/todo_day-atoms.dart';
import 'package:schedule/app/iterator/models/todo_day_model.dart';
import 'package:schedule/app/iterator/repositories/todos_day_repository.dart';

Future<void> fetchAllTodoDays() async{
  final todoDayRepository = injector.get<TodoDayRepository>();
  todoDayState.value = await todoDayRepository.getAll();
}
Future<void> putTodoDay(TodoDayModel todoDay)async{
  final todoDayRepository = injector.get<TodoDayRepository>();
  if(todoDay.id == -1){
    await todoDayRepository.insert(todoDay);
  }else{
    await todoDayRepository.update(todoDay);
  }
  fetchAllTodoDays();
}
Future<void> deleteTodoDay(int id) async {
  final todoDayRepository = injector.get<TodoDayRepository>();
  await todoDayRepository.delete(id);
  fetchAllTodoDays();
}