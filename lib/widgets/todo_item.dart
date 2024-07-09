import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;

  const ToDoItem({super.key, required this.todo, required this.onDeleteItem, required this.onToDoChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
            onTap: () {
              onToDoChange(todo);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: Colors.white,
            leading:  Icon(
              todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
              color: tdBlue,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            title: Text(
              todo.task!,
              style: TextStyle(
                  fontSize: 16,
                  color: tdBlack,
                  decoration: todo.isDone? TextDecoration.lineThrough : null),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: tdRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  onDeleteItem(todo.task);
                },
              ),
            ),
            )
            );
  }
}
