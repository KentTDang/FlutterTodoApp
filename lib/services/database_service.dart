import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo.dart';
// import 'package:todo_app/auth.dart';

const String TODO_COLLECTION_REF = "todos";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference<ToDo> _todosRef;

  DatabaseService() {
    _todosRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<ToDo>(
        fromFirestore: (snapshots, _) => ToDo.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (todo, _) => todo.toJson());
  }

  Stream<QuerySnapshot> getToDos() {
    return _todosRef.snapshots();
  }

  Future<void> addToDo(ToDo todo) async {
    await _todosRef.add(todo);
  }

  Future<void> deleteToDo(String todoId) async {
    await _todosRef.doc(todoId).delete();
  }

  Future<void> updateToDo(String todoId, ToDo todo) async {
    await _todosRef.doc(todoId).update(todo.toJson());
  }
}
