import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/task_item_screen.dart';

import '../models/tasl_manager.dart';
import 'empty_task_screen.dart';

class TaskScreen extends StatelessWidget{
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskItemScreen(
                onCreate: (task) {
                  manager.addTask(task);
                  Navigator.pop(context);
                }
              ),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen(){
    return Consumer<TaskManager>(
      builder: (context, manager, child){
        if (manager.taskModels.isNotEmpty){
          return Container();
        } else {
          return const EmptyTaskScreen();
        }
      }
    );
  }
}