import 'package:firebase_auth/firebase_auth.dart';

class firebaseauth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("error creating user");
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("error signing in user");
    }
  }
}
