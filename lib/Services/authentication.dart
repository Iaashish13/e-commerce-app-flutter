import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication with ChangeNotifier {
 
  String? uid;
  String get getuid => uid!;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Stream<User?> get authState => firebaseAuth.authStateChanges();
  Future loginIntoAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user!;
      uid = user.uid;
      // ignore: avoid_print
      print('Uid = $getuid');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
    notifyListeners();
  }

  Future signUpAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user!;
      uid = user.uid;
      // ignore: avoid_print
      print('Uid = $getuid');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
    notifyListeners();
  }
}
 