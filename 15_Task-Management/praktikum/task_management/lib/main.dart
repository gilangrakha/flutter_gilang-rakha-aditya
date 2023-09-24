import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/models/tasl_manager.dart';
import 'package:task_management/screens/task_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  TaskManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
