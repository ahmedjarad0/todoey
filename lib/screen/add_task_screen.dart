import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/povider/task_data_provider.dart';

import '../model/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key,}) : super(key: key);
  // final Function(String?)? addTasks;


  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        padding:
        EdgeInsets.only(bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              autofocus: true,
              controller: _textEditingController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // addTasks(_textEditingController.text);
                if (_textEditingController.text.isNotEmpty) {
                  Provider.of<TaskData>(context,listen: false).addTask(_textEditingController.text);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter required task')));
                }
              },
              style: ElevatedButton.styleFrom(),
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
