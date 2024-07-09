import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/services/database_service.dart';
import 'package:todo_app/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _todoController = TextEditingController();

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('ToDo App');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "All Todos",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: _databaseService.getToDos(),
                        builder: (context, snapshot) {
                          List todos = snapshot.data?.docs ?? [];
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('Error fetching ToDos'),
                            );
                          }
                          if (!snapshot.hasData || todos.isEmpty) {
                            return const Center(
                              child: Text('Add a ToDo!'),
                            );
                          }
                          return Column(
                            children: todos.map<Widget>((doc) {
                              ToDo todo = doc.data();
                              String todoId = doc.id;
                              return Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  leading: Checkbox(
                                    value: todo.isDone,
                                    onChanged: (value) {
                                      ToDo updateToDo =
                                          todo.copyWith(isDone: !todo.isDone);
                                      _databaseService.updateToDo(
                                          todoId, updateToDo);
                                    },
                                    activeColor: tdBlue,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  title: Text(
                                    todo.task,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: tdBlack,
                                        decoration: todo.isDone
                                            ? TextDecoration.lineThrough
                                            : null),
                                  ),
                                  trailing: Container(
                                    padding: const EdgeInsets.all(0),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
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
                                        _databaseService.deleteToDo(todoId);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      ToDo todo =
                          ToDo(task: _todoController.text, isDone: false);
                      _databaseService.addToDo(todo);
                      _todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(user!.email ?? ''),
        // Image(image: user!.photoURL ?? )
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          color: tdRed,
          onPressed: () {
            signOut();
          },
        ),
      ],
    ),
    backgroundColor: tdBGColor,
  );
}

}
