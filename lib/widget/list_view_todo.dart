import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/povider/task_data_provider.dart';

import 'tile_todo.dart';

class ListViewTodo extends StatelessWidget {
  const ListViewTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          itemCount: value.lengthTask,
          itemBuilder: (context, index) {
            return TileTodo(
              text: value.tasks[index].title,
              isDone: value.tasks[index].isDone,
              onChanged: (values) {
                value.changeTasks(index);
              },
            );
          },
        );
      },
    );
  }
}
