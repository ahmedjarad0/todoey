import 'package:flutter/material.dart';

class TileTodo extends StatelessWidget {
  const TileTodo({
    required this.text,
    required this.onChanged,
    required this.isDone,
    super.key,
  });

  final String text;
  final Function(bool?)? onChanged;
  final bool isDone;

  // bool check = false ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style:
            TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(value: isDone, onChanged: onChanged),
    );
  }
}
