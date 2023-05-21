import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String task_name;
  final bool task_completed;
  final Function(bool?) onChanged;
  final Function(BuildContext) deleteFunction;

  const TodoTile(
      {super.key,
      required this.task_name,
      required this.task_completed,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(children: [
            Checkbox(
              value: task_completed,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(task_name,
                style: TextStyle(
                    decoration: task_completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
          ]),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
