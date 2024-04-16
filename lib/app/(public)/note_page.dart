import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:schedule/app/iterator/actions/todos_day_actions.dart';
import 'package:schedule/app/iterator/atoms/todo_atoms.dart';
import '../iterator/actions/todo_actions.dart';
import '../iterator/models/todo_day_model.dart';
import '../iterator/models/todo_model.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  void editTodoDialog([TodoModel? model]) {
    model ??= TodoModel(id: -1, title: '');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextFormField(
            initialValue: model?.title,
            onChanged: (value) {
              model = model!.copyWith(title: value);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                deleteTodo(model!.id);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                putTodo(model!);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    TodoDayModel todoDay = Routefly.of(context).route.arguments;
    return RxBuilder(
      builder: (_) {
        final todos = todoState.value;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Todos'),
            leading: BackButton(
              onPressed: () {
                putTodoDay(todoDay.copyWith(
                  todos: todos,
                ));
                clearTodo();
                Routefly.pop(context);
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              editTodoDialog();
            },
            child: const Icon(Icons.add),
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                fetchTodos();
              },
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, index) {
                  getTodo(todos[index].id);
                  final todo = todoLoad.value[todos[index].id];
                  return FutureBuilder(
                    future: todo,
                    builder: (context, snap) {
                      return snap.hasData == false
                          ? Container()
                          : buildList(snap.data);
                    },
                  );
                },
              )),
        );
      },
    );
  }

  Widget buildList(TodoModel? todo) {
    final children = <Widget>[];
    children.add(ListTile(
      title: Text(todo!.title),
      onTap: () {
        editTodoDialog(todo);
      },
    ));
    return Column(children: children);
  }
}
