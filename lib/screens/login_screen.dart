import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const LoginScreen({
    Key? key,
    required this.auth,
    required this.firestore,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Email"),
                    controller: _emailController,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Password"),
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      Auth(auth: widget.auth)
                          .signIn(email: _emailController.text, password: _passwordController.text)
                          .then((value) {
                        if (value == null) {
                          _emailController.clear();
                          _passwordController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                        }
                      });
                    },
                    child: const Text("Sign In"),
                  ),
                  TextButton(
                    onPressed: () {
                      Auth(auth: widget.auth)
                          .createAccount(email: _emailController.text, password: _passwordController.text)
                          .then((value) {
                        if (value == null) {
                          _emailController.clear();
                          _passwordController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                        }
                      });
                    },
                    child: const Text("Create Account"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
