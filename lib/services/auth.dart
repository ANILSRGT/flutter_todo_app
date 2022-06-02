import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth;

  Auth({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  Future<String?> createAccount({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "Email address is not valid!";
        case "email-already-in-use":
          return "There already exists an account!";
        case "operation-not-allowed":
          return "Sign up with Email/Password accounts are not enabled!";
        case "weak-password":
          return "Password is not strong enough!";
        default:
          return "Something went wrong!";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "Email address is not valid!";
        case "user-disabled":
          return "User has been disabled!";
        case "user-not-found":
          return "User not found!";
        case "wrong-password":
          return "Wrong password!";
        default:
          return "Something went wrong!";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signOut() async {
    try {
      await auth.signOut();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
