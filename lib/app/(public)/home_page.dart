import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:schedule/app/iterator/actions/todos_day_actions.dart';
import 'package:schedule/app/iterator/atoms/todo_day-atoms.dart';
import 'package:schedule/app/iterator/models/todo_day_model.dart';
import 'package:schedule/routes.dart';
import 'package:table_calendar/table_calendar.dart';

import '../iterator/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<TodoModel> todos = [];
  TodoDayModel? todoDay;
  Map<DateTime, List<TodoModel>> events = {};

  List<TodoModel> getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        todoDayState.addListener(() {
          setState(() {
            todos = getEventForDay(_selectedDay!);
            for (var todoDay in todoDayState.value) {
              events.addAll({todoDay.date: todoDay.todos});
            }
          });
        });
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                todoDay = TodoDayModel(id: -1, date: _selectedDay!, todos: []);
                Routefly.push(routePaths.note, arguments: todoDay);
              });
            },
          ),
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: Column(
            children: [
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2010, 3, 14),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusDay;
                      todos = getEventForDay(selectedDay);
                    });
                  }
                },
                eventLoader: getEventForDay,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo.title),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    fetchAllTodoDays();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
