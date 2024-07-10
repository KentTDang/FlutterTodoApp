import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/services/database_service.dart';
import 'package:todo_app/model/todo.dart';
import 'package:confetti/confetti.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _todoController = TextEditingController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> signOut() async {
    await Auth().signOut();
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
                          "All Tasks",
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
                              child: Text('Error fetching Tasks'),
                            );
                          }
                          if (!snapshot.hasData || todos.isEmpty) {
                            return const Center(
                              child: Text('Add a Task!'),
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
                                      if (!todo.isDone == true) {
                                        _confettiController.play();
                                      }
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
                        const EdgeInsets.only(bottom: 40, right: 20, left: 20),
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
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40, right: 20),
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
          Align(
            alignment: Alignment.topCenter,
            child: 
              ConfettiWidget(
                confettiController: _confettiController,
                shouldLoop: false,
                blastDirection: pi / 2,
                emissionFrequency: 0.1,
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
          const Text('Welcome back!'),
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
