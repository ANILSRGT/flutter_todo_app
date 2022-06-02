import 'package:flutter/material.dart';
import 'package:flutter_todo_app_1/models/todo.dart';

class TodoCard extends StatefulWidget {
  final TodoModel todo;
  final void Function(bool) onChanged;
  final VoidCallback onRemove;
  const TodoCard({Key? key, required this.todo, required this.onChanged, required this.onRemove}) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
              onPressed: widget.onRemove,
              icon: const Icon(
                Icons.close,
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Text(
                widget.todo.content,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: widget.todo.done,
              onChanged: (value) {
                widget.onChanged(value ?? false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
