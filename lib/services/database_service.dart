import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/services/auth_service.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference<ToDo> _todosRef;

  DatabaseService() {
    String? uid = Auth().currentUser?.uid;
    if (uid != null) {
      _todosRef = _firestore.collection('users').doc(uid).collection('todos').withConverter<ToDo>(
        fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
        toFirestore: (todo, _) => todo.toJson(),
      );
    } else {
      throw Exception("User is not authenticated");
    }
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
