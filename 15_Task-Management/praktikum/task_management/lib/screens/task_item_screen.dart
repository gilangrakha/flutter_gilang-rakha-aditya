import 'package:flutter/material.dart';
import 'package:task_management/models/task_model.dart';

class TaskItemScreen extends StatefulWidget{
  final Function(TaskModel) onCreate;
  const TaskItemScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _TaskItemScreenState createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}