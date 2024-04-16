import 'package:auto_injector/auto_injector.dart';
import 'package:schedule/app/data/repositories/hive_todo_day_repository.dart';
import 'package:schedule/app/data/repositories/hive_todo_repository.dart';
import 'package:schedule/app/iterator/repositories/todo_repository.dart';
import 'package:schedule/app/iterator/repositories/todos_day_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<TodoRepository>(HiveTodoRepository.new);
  injector.add<TodoDayRepository>(HiveTodoDayRepository.new);
}
