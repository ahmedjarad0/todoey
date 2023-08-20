import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/povider/task_data_provider.dart';
import 'package:todo_app/screen/add_task_screen.dart';
import 'package:todo_app/widget/tile_todo.dart';

import '../model/task.dart';
import '../widget/list_view_todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        color: Colors.lightBlueAccent,
                        Icons.list,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Todoey',
                      style: TextStyle(color: Colors.white, fontSize: 54),
                    ),
                    Text(
                      '${Provider.of<TaskData>(context).lengthTask} task',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                child: const ListViewTodo(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddTaskScreen();
              },
            );
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add)),
    );
  }
}
