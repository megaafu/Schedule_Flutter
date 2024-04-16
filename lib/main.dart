import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:schedule/app/app_widget.dart';
import 'package:schedule/app/injector.dart';
import 'package:schedule/app/iterator/models/todo_day_model.dart';
import 'package:schedule/app/iterator/models/todo_model.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  Hive.registerAdapter(TodoDayModelAdapter());
  registerInstances();
  runApp(const AppWidget());
}
