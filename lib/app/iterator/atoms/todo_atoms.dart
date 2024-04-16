import 'package:schedule/app/iterator/models/todo_model.dart';
import 'package:asp/asp.dart';

final todoState = Atom<List<TodoModel>>([]);

final todoLoad = Atom<Map<int,Future<TodoModel?>>>({});