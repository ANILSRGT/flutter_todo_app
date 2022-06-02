import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app_1/models/todo.dart';

class Database {
  final FirebaseFirestore firestore;

  Database({required this.firestore});

  Stream<List<TodoModel>>? streamTodos({required String uid}) {
    try {
      return firestore.collection("todos").doc(uid).collection("todos").snapshots().map((value) {
        List<TodoModel> res = <TodoModel>[];
        for (var element in value.docs) {
          res.add(TodoModel.fromDocumentSnapshot(documentSnapshot: element));
        }
        return res;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTodo({required String uid, required String content}) async {
    try {
      firestore.collection("todos").doc(uid).collection("todos").add({
        "content": content,
        "done": false,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodo({required String uid, required String todoId, required bool isCheck}) async {
    try {
      await firestore.collection("todos").doc(uid).collection("todos").doc(todoId).update({
        "done": isCheck,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTodo({required String uid, required String todoId}) async {
    try {
      await firestore.collection("todos").doc(uid).collection("todos").doc(todoId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
