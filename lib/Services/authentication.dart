import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
 
 String? _userId ;
  String get getuid => _userId!;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Stream<User?> get authState => firebaseAuth.authStateChanges();
  Future loginIntoAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user!;
      _userId = user.uid;
       sharedPreferences.setString('uid', _userId!);
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
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user!;
      _userId = user.uid;
      sharedPreferences.setString('uid', _userId!);
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
 