import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
            onTap: () {
              print('Clicked on Todo Item');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: Colors.white,
            leading: const Icon(
              Icons.check_box,
              color: tdBlue,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            title: const Text(
              'Check Mail',
              style: TextStyle(
                  fontSize: 16,
                  color: tdBlack,
                  decoration: TextDecoration.lineThrough),
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
                  print('Clicked on delete icon');
                },
              ),
            ),
            )
            );
  }
}
