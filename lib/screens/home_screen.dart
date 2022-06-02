import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const HomeScreen({
    Key? key,
    required this.auth,
    required this.firestore,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDos"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Auth(auth: widget.auth).signOut().then((value) {
                if (value == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Logged Out")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                }
              });
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            "Add ToDo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_todoController.text.isNotEmpty) {
                        setState(() {
                          Database(firestore: widget.firestore)
                              .addTodo(uid: widget.auth.currentUser!.uid, content: _todoController.text);
                          _todoController.clear();
                        });
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<TodoModel>>(
              stream: Database(firestore: widget.firestore).streamTodos(uid: widget.auth.currentUser!.uid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final List<TodoModel> _models = <TodoModel>[];
                if (snapshot.connectionState == ConnectionState.active) {
                  if (!snapshot.hasData || snapshot.data.length <= 0) {
                    return const Center(
                      child: Text("You don't have any unfinished Todos"),
                    );
                  }
                  _models.addAll(snapshot.data);
                  final List<TodoModel> trueModels = _models.where((element) => element.done).toList();
                  _models.removeWhere((element) => element.done);
                  _models.insertAll(_models.length, trueModels);
                  return ListView.builder(
                    itemCount: _models.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCard(
                        todo: _models[index],
                        onRemove: () {
                          setState(() {});
                          Database(firestore: widget.firestore).deleteTodo(
                            uid: widget.auth.currentUser!.uid,
                            todoId: _models[index].todoId,
                          );
                        },
                        onChanged: (newValue) {
                          setState(() {});
                          Database(firestore: widget.firestore).updateTodo(
                            uid: widget.auth.currentUser!.uid,
                            todoId: _models[index].todoId,
                            isCheck: newValue,
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
