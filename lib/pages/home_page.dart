import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/services/database_service.dart';
import 'package:todo_app/widgets/todo_item.dart';
import 'package:todo_app/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final User? user = Auth().currentUser;

  final DatabaseService _databaseService =DatabaseService();


  // final todosList = ToDo.todoList();
  // final _todoController = TextEditingController();

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('ToDo App');
  }

  // Widget _userUid() {
  //   return Text(user?.email ?? 'User email');
  // }

  // Widget _signOutButton() {
  //   return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: _buildUI(),
      // body: Stack(
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      //       child: Column(
      //         children: [
      //           searchBox(),
      //           Expanded(
      //             child: ListView(
      //               children: [
      //                 Container(
      //                   margin: const EdgeInsets.only(top: 50, bottom: 20),
      //                   child: const Text(
      //                     "All Todos",
      //                     style: TextStyle(
      //                         fontSize: 30, fontWeight: FontWeight.w500),
      //                   ),
      //                 ),
      //                 _messageListView(),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //                 margin: const EdgeInsets.only(
      //                     bottom: 20, right: 20, left: 20),
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: 20, vertical: 5),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   boxShadow: const [
      //                     BoxShadow(
      //                       color: Colors.grey,
      //                       offset: Offset(0, 0),
      //                       blurRadius: 10.0,
      //                       spreadRadius: 0.0,
      //                     ),
      //                   ],
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 // child: TextField(
      //                 //   controller: _todoController,
      //                 //   decoration: const InputDecoration(
      //                 //     hintText: 'Add a new todo item',
      //                 //     border: InputBorder.none,
      //                 //   ),
      //                 // )
      //                 ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.only(bottom: 20, right: 20),
      //             child: ElevatedButton(
      //               onPressed: () {},
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: tdBlue,
      //                 minimumSize: const Size(60, 60),
      //                 elevation: 10,
      //                 shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10), 
      //                 ),
      //               ),
      //               child: const Text(
      //                 '+',
      //                 style: TextStyle(fontSize: 40, color: Colors.white),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Column(children: [
        _messageListView(),
      ],)
      );
  }

  Widget _messageListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _databaseService.getToDos(),
        builder: (context, snapshot) {
          List todos = snapshot.data?.docs ?? [];
          if(todos.isEmpty) {
            return const Center(
              child: Text('Add a ToDo!'),
            );
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              ToDo todo = todos[index].data();
              String todoId = todos[index].id;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListTile(
                tileColor: Colors.red,
                title: Text(todo.task),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) {
                    ToDo updateToDo = todo.copyWith(isDone: !todo.isDone);
                    _databaseService.updateToDo(todoId, updateToDo);
                  },
                ),
              ),
            );
          }
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.menu, color: tdBlack, size: 30), _title()],
      ),
      backgroundColor: tdBGColor,
    );
  }
}
