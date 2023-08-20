import 'package:flutter/cupertino.dart';

import '../model/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = <Task>[
    Task(title: 'Buy milk'),
    Task(title: 'Buy bread'),
    Task(title: 'Buy meat'),
  ];
 int get lengthTask => tasks.length;
 void changeTasks(int index){
   tasks[index].checkTasks();
   notifyListeners();
 }
 void addTask(String title){
    var task =  Task(title: title);
      tasks.add(task);
      notifyListeners();
 }
}